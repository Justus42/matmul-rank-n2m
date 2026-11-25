//! Checker 2 for matrix multiplication schemes (task A-09).
//!
//! Reads one scheme file in the format of `verfahren/README.md`
//! (format version 1) and verifies with exact arithmetic that the
//! products compute the matrix product. No floating point values are
//! used for any coefficient or any computation.
//!
//! Usage: `pruefer <path>`
//!
//! First output line is exactly one of
//!   ANGENOMMEN <id> <n>x<k>x<m> rank=<rank> ring=<ring>   (exit 0)
//!   ABGELEHNT <id> <reason>                              (exit 1)
//!   FEHLERHAFT <file name> <reason>                      (exit 2)
//! Further lines are details and hints that do not change the result.

use std::collections::BTreeSet;
use std::fmt;
use std::path::Path;
use std::process::ExitCode;

use num_bigint::{BigInt, BigUint};
use num_integer::Integer;
use num_rational::BigRational;
use num_traits::{One, Signed, ToPrimitive, Zero};
use serde::de::{self, Deserialize, Deserializer, MapAccess, SeqAccess, Visitor};

// ---------------------------------------------------------------------------
// Strict JSON value
// ---------------------------------------------------------------------------

/// JSON value as read from the file. Objects keep their key order and
/// reject duplicate keys. Numbers are kept only if they are integers;
/// any non-integer number is recorded as `NonInteger` without its value.
#[derive(Debug)]
enum Json {
    Null,
    Bool,
    /// Non-negative integer that fits into u64.
    UInt(u64),
    /// Negative integer that fits into i64.
    NegInt,
    /// A number with fraction or exponent, or too large for 64 bits.
    NonInteger,
    Str(String),
    Arr(Vec<Json>),
    Obj(Vec<(String, Json)>),
}

impl<'de> Deserialize<'de> for Json {
    fn deserialize<D: Deserializer<'de>>(d: D) -> Result<Self, D::Error> {
        struct V;
        impl<'de> Visitor<'de> for V {
            type Value = Json;
            fn expecting(&self, f: &mut fmt::Formatter) -> fmt::Result {
                f.write_str("a JSON value")
            }
            fn visit_unit<E: de::Error>(self) -> Result<Json, E> {
                Ok(Json::Null)
            }
            fn visit_bool<E: de::Error>(self, b: bool) -> Result<Json, E> {
                let _ = b;
                Ok(Json::Bool)
            }
            fn visit_u64<E: de::Error>(self, x: u64) -> Result<Json, E> {
                Ok(Json::UInt(x))
            }
            fn visit_i64<E: de::Error>(self, x: i64) -> Result<Json, E> {
                if x >= 0 {
                    Ok(Json::UInt(x as u64))
                } else {
                    Ok(Json::NegInt)
                }
            }
            fn visit_f64<E: de::Error>(self, _x: f64) -> Result<Json, E> {
                // The value is deliberately discarded.
                Ok(Json::NonInteger)
            }
            fn visit_str<E: de::Error>(self, s: &str) -> Result<Json, E> {
                Ok(Json::Str(s.to_owned()))
            }
            fn visit_string<E: de::Error>(self, s: String) -> Result<Json, E> {
                Ok(Json::Str(s))
            }
            fn visit_seq<A: SeqAccess<'de>>(self, mut a: A) -> Result<Json, A::Error> {
                let mut v = Vec::new();
                while let Some(x) = a.next_element::<Json>()? {
                    v.push(x);
                }
                Ok(Json::Arr(v))
            }
            fn visit_map<A: MapAccess<'de>>(self, mut a: A) -> Result<Json, A::Error> {
                let mut v: Vec<(String, Json)> = Vec::new();
                while let Some(key) = a.next_key::<String>()? {
                    if v.iter().any(|(k, _)| *k == key) {
                        return Err(de::Error::custom(format!(
                            "doppelter Schlüssel \"{}\"",
                            key
                        )));
                    }
                    let val = a.next_value::<Json>()?;
                    v.push((key, val));
                }
                Ok(Json::Obj(v))
            }
        }
        d.deserialize_any(V)
    }
}

impl Json {
    fn kind(&self) -> &'static str {
        match self {
            Json::Null => "null",
            Json::Bool => "Wahrheitswert",
            Json::UInt(_) | Json::NegInt => "Ganzzahl",
            Json::NonInteger => "Zahl mit Komma, Exponent oder außerhalb von 64 Bit",
            Json::Str(_) => "Zeichenkette",
            Json::Arr(_) => "Liste",
            Json::Obj(_) => "Objekt",
        }
    }
}

fn get<'a>(obj: &'a [(String, Json)], key: &str) -> Option<&'a Json> {
    obj.iter().find(|(k, _)| k == key).map(|(_, v)| v)
}

// ---------------------------------------------------------------------------
// Result of a check
// ---------------------------------------------------------------------------

enum Outcome {
    Accepted { header: String, lines: Vec<String> },
    Rejected { id: String, reason: String, lines: Vec<String> },
    Malformed { reason: String },
}

/// Error in steps 1 to 6 of section 6 (file is malformed).
type Step<T> = Result<T, String>;

// ---------------------------------------------------------------------------
// Ring
// ---------------------------------------------------------------------------

#[derive(Clone, Debug)]
enum Ring {
    Z,
    Q,
    Gf(u64),
}

impl fmt::Display for Ring {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            Ring::Z => write!(f, "Z"),
            Ring::Q => write!(f, "Q"),
            Ring::Gf(p) => write!(f, "GF({})", p),
        }
    }
}

fn parse_ring(s: &str) -> Step<Ring> {
    match s {
        "Z" => return Ok(Ring::Z),
        "Q" => return Ok(Ring::Q),
        _ => {}
    }
    let inner = s
        .strip_prefix("GF(")
        .and_then(|t| t.strip_suffix(')'))
        .ok_or_else(|| format!("ring \"{}\" unbekannt (erlaubt: Z, Q, GF(p))", s))?;
    if !is_canonical_natural(inner) {
        return Err(format!("ring \"{}\": p ist keine Zahl in Normalform", s));
    }
    let p: u64 = inner.parse().map_err(|_| {
        format!(
            "ring \"{}\": p zu groß (dieses Programm unterstützt p < 2^64)",
            s
        )
    })?;
    if !is_prime_u64(p) {
        return Err(format!("ring \"{}\": {} ist keine Primzahl", s, p));
    }
    Ok(Ring::Gf(p))
}

/// "0" or a digit string without leading zero.
fn is_canonical_natural(s: &str) -> bool {
    !s.is_empty()
        && s.bytes().all(|b| b.is_ascii_digit())
        && (s == "0" || !s.starts_with('0'))
}

fn mul_mod(a: u64, b: u64, m: u64) -> u64 {
    ((a as u128 * b as u128) % m as u128) as u64
}

fn pow_mod(mut a: u64, mut e: u64, m: u64) -> u64 {
    let mut r = 1 % m;
    a %= m;
    while e > 0 {
        if e & 1 == 1 {
            r = mul_mod(r, a, m);
        }
        a = mul_mod(a, a, m);
        e >>= 1;
    }
    r
}

/// Deterministic Miller-Rabin test, correct for all 64-bit integers
/// (bases 2, 3, 5, ..., 37 suffice for n < 3.3e24).
fn is_prime_u64(n: u64) -> bool {
    if n < 2 {
        return false;
    }
    const BASES: [u64; 12] = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37];
    for &p in BASES.iter() {
        if n % p == 0 {
            return n == p;
        }
    }
    let mut d = n - 1;
    let mut s = 0;
    while d % 2 == 0 {
        d /= 2;
        s += 1;
    }
    'outer: for &a in BASES.iter() {
        let mut x = pow_mod(a, d, n);
        if x == 1 || x == n - 1 {
            continue;
        }
        for _ in 1..s {
            x = mul_mod(x, x, n);
            if x == n - 1 {
                continue 'outer;
            }
        }
        return false;
    }
    true
}

// ---------------------------------------------------------------------------
// Coefficients
// ---------------------------------------------------------------------------

/// Parses a coefficient string according to the pattern
/// `-?(0|[1-9][0-9]*)(/[1-9][0-9]*)?` and the rules of the ring.
/// Returns the exact rational value (reduced).
fn parse_coeff(s: &str, ring: &Ring) -> Step<BigRational> {
    let (neg, rest) = match s.strip_prefix('-') {
        Some(r) => (true, r),
        None => (false, s),
    };
    let (num_s, den_s) = match rest.find('/') {
        Some(pos) => (&rest[..pos], Some(&rest[pos + 1..])),
        None => (rest, None),
    };
    if !is_canonical_natural(num_s) {
        return Err(format!("Koeffizient \"{}\" hat keine erlaubte Schreibweise", s));
    }
    if let Some(d) = den_s {
        if !is_canonical_natural(d) || d == "0" {
            return Err(format!("Koeffizient \"{}\" hat keine erlaubte Schreibweise", s));
        }
        if !matches!(ring, Ring::Q) {
            return Err(format!(
                "Koeffizient \"{}\": Bruchstrich ist bei ring={} nicht erlaubt",
                s, ring
            ));
        }
    }
    let mut num: BigInt = num_s.parse().expect("digits checked");
    if neg {
        num = -num;
    }
    let den: BigInt = match den_s {
        Some(d) => d.parse().expect("digits checked"),
        None => BigInt::one(),
    };
    Ok(BigRational::new(num, den))
}

/// Value of a coefficient as an element of the ring, for display and
/// for zero tests. For GF(p) the result is the residue in [0, p).
fn reduce(x: &BigRational, ring: &Ring) -> BigRational {
    match ring {
        Ring::Gf(p) => {
            // Coefficients over GF(p) are integers (checked when parsing).
            debug_assert!(x.is_integer());
            let r = x.to_integer().mod_floor(&BigInt::from(*p));
            BigRational::from_integer(r)
        }
        _ => x.clone(),
    }
}

fn show(x: &BigRational) -> String {
    if x.is_integer() {
        x.to_integer().to_string()
    } else {
        format!("{}/{}", x.numer(), x.denom())
    }
}

// ---------------------------------------------------------------------------
// Steps 1 to 6: reading and validating the file
// ---------------------------------------------------------------------------

type Matrix = Vec<Vec<BigRational>>;

struct Product {
    u: Matrix,
    v: Matrix,
    w: Matrix,
}

struct Scheme {
    id: String,
    n: usize,
    k: usize,
    m: usize,
    rank: usize,
    ring: Ring,
    ring_text: String,
    products: Vec<Product>,
}

const TOP_KEYS: [&str; 11] = [
    "format_version",
    "id",
    "n",
    "k",
    "m",
    "rank",
    "ring",
    "origin",
    "claim",
    "notes",
    "products",
];

fn req<'a>(obj: &'a [(String, Json)], key: &str, ctx: &str) -> Step<&'a Json> {
    get(obj, key).ok_or_else(|| format!("Pflichtfeld \"{}\" fehlt{}", key, ctx))
}

fn as_str<'a>(j: &'a Json, what: &str) -> Step<&'a str> {
    match j {
        Json::Str(s) => Ok(s),
        other => Err(format!(
            "\"{}\" muss eine Zeichenkette sein, ist aber {}",
            what,
            other.kind()
        )),
    }
}

fn as_pos_int(j: &Json, what: &str) -> Step<usize> {
    match j {
        Json::UInt(x) if *x >= 1 => usize::try_from(*x)
            .map_err(|_| format!("\"{}\" ist zu groß", what)),
        Json::UInt(_) | Json::NegInt => {
            Err(format!("\"{}\" muss eine Ganzzahl >= 1 sein", what))
        }
        other => Err(format!(
            "\"{}\" muss eine Ganzzahl sein, ist aber {}",
            what,
            other.kind()
        )),
    }
}

fn check_date(s: &str) -> Step<()> {
    let b = s.as_bytes();
    let bad = || format!("origin.created \"{}\" ist kein Datum der Form JJJJ-MM-TT", s);
    if b.len() != 10
        || b[4] != b'-'
        || b[7] != b'-'
        || ![0, 1, 2, 3, 5, 6, 8, 9].iter().all(|&i| b[i].is_ascii_digit())
    {
        return Err(bad());
    }
    let y: u32 = s[0..4].parse().map_err(|_| bad())?;
    let mo: u32 = s[5..7].parse().map_err(|_| bad())?;
    let d: u32 = s[8..10].parse().map_err(|_| bad())?;
    if y < 1 {
        // Section 9.3: years 0001 to 9999.
        return Err(bad());
    }
    let leap = (y % 4 == 0 && y % 100 != 0) || y % 400 == 0;
    let dim = match mo {
        1 | 3 | 5 | 7 | 8 | 10 | 12 => 31,
        4 | 6 | 9 | 11 => 30,
        2 if leap => 29,
        2 => 28,
        _ => return Err(bad()),
    };
    if d < 1 || d > dim {
        return Err(bad());
    }
    Ok(())
}

const ORIGIN_KEYS: [&str; 5] = ["source", "method", "created", "created_by", "derived_from"];

/// Section 9.2.4: a free text string must contain at least one character
/// other than space, tab, line feed and carriage return.
fn check_text<'a>(j: &'a Json, what: &str) -> Step<&'a str> {
    let s = as_str(j, what)?;
    if !s.chars().any(|c| !matches!(c, ' ' | '\t' | '\n' | '\r')) {
        return Err(format!(
            "\"{}\" ist leer oder enthält nur Leerraum",
            what
        ));
    }
    Ok(s)
}

/// Section 9.4.2: `id` (and `origin.derived_from`) must match
/// `([1-9][0-9]*)x([1-9][0-9]*)x([1-9][0-9]*)-r([1-9][0-9]*)-([a-z0-9]+(-[a-z0-9]+)*)`
/// completely, ASCII only. Returns the short name.
fn parse_id(s: &str) -> Option<&str> {
    fn number(t: &str) -> bool {
        !t.is_empty() && t.bytes().all(|b| b.is_ascii_digit()) && !t.starts_with('0')
    }
    let (dims, rest) = s.split_once("-r")?;
    let mut it = dims.split('x');
    let (a, b, c) = (it.next()?, it.next()?, it.next()?);
    if it.next().is_some() {
        return None;
    }
    let (r, short) = rest.split_once('-')?;
    if ![a, b, c, r].iter().all(|t| number(t)) {
        return None;
    }
    let short_ok = !short.is_empty()
        && short.split('-').all(|part| {
            !part.is_empty()
                && part
                    .bytes()
                    .all(|ch| ch.is_ascii_lowercase() || ch.is_ascii_digit())
        });
    if !short_ok {
        return None;
    }
    Some(short)
}

/// Step 1, origin part.
fn check_origin(j: &Json) -> Step<()> {
    let obj = match j {
        Json::Obj(o) => o,
        other => {
            return Err(format!(
                "\"origin\" muss ein Objekt sein, ist aber {}",
                other.kind()
            ))
        }
    };
    for (key, _) in obj {
        if !ORIGIN_KEYS.contains(&key.as_str()) {
            return Err(format!("unbekannter Schlüssel \"{}\" in \"origin\"", key));
        }
    }
    for key in ["source", "method", "created", "created_by"] {
        let v = req(obj, key, " in \"origin\"")?;
        check_text(v, &format!("origin.{}", key))?;
    }
    check_date(as_str(get(obj, "created").unwrap(), "origin.created")?)?;
    if let Some(v) = get(obj, "derived_from") {
        let d = check_text(v, "origin.derived_from")?;
        if parse_id(d).is_none() {
            return Err(format!(
                "origin.derived_from \"{}\" hat nicht die Form einer id",
                d
            ));
        }
    }
    Ok(())
}

/// Reads a matrix with the given shape as a list of lists of strings.
/// Shape errors are step 5, coefficient errors step 6. To keep the
/// order of the steps, shapes of all products are checked first (see
/// `read_scheme`), so here only the raw strings are collected.
fn matrix_strings<'a>(
    j: &'a Json,
    rows: usize,
    cols: usize,
    what: &str,
) -> Step<Vec<Vec<&'a str>>> {
    let list = match j {
        Json::Arr(a) => a,
        other => {
            return Err(format!(
                "{} muss eine Liste sein, ist aber {}",
                what,
                other.kind()
            ))
        }
    };
    if list.len() != rows {
        return Err(format!(
            "{} hat {} Zeilen, erwartet {}",
            what,
            list.len(),
            rows
        ));
    }
    let mut out = Vec::with_capacity(rows);
    for (i, row) in list.iter().enumerate() {
        let r = match row {
            Json::Arr(a) => a,
            other => {
                return Err(format!(
                    "{} Zeile {} muss eine Liste sein, ist aber {}",
                    what,
                    i,
                    other.kind()
                ))
            }
        };
        if r.len() != cols {
            return Err(format!(
                "{} Zeile {} hat {} Einträge, erwartet {}",
                what,
                i,
                r.len(),
                cols
            ));
        }
        let mut cells = Vec::with_capacity(cols);
        for (c, x) in r.iter().enumerate() {
            match x {
                Json::Str(s) => cells.push(s.as_str()),
                other => {
                    return Err(format!(
                        "{}[{}][{}] muss eine Zeichenkette sein, ist aber {}",
                        what,
                        i,
                        c,
                        other.kind()
                    ))
                }
            }
        }
        out.push(cells);
    }
    Ok(out)
}

fn read_scheme(path: &Path, bytes: &[u8]) -> Step<Scheme> {
    // Step 1: UTF-8, JSON, required fields, no unknown top-level keys.
    if bytes.starts_with(&[0xEF, 0xBB, 0xBF]) {
        return Err("Byte-Order-Mark am Dateianfang ist nicht erlaubt".to_owned());
    }
    let text = std::str::from_utf8(bytes).map_err(|e| format!("kein gültiges UTF-8: {}", e))?;
    let root: Json = serde_json::from_str(text).map_err(|e| format!("kein gültiges JSON: {}", e))?;
    let top = match &root {
        Json::Obj(o) => o,
        other => {
            return Err(format!(
                "oberste Ebene muss ein Objekt sein, ist aber {}",
                other.kind()
            ))
        }
    };
    for (key, _) in top {
        if !TOP_KEYS.contains(&key.as_str()) {
            return Err(format!("unbekannter Schlüssel \"{}\" auf oberster Ebene", key));
        }
    }
    for key in [
        "format_version",
        "id",
        "n",
        "k",
        "m",
        "rank",
        "ring",
        "origin",
        "products",
    ] {
        req(top, key, "")?;
    }
    let fv = get(top, "format_version").unwrap();
    let id = as_str(get(top, "id").unwrap(), "id")?.to_owned();
    let n = as_pos_int(get(top, "n").unwrap(), "n")?;
    let k = as_pos_int(get(top, "k").unwrap(), "k")?;
    let m = as_pos_int(get(top, "m").unwrap(), "m")?;
    let rank = as_pos_int(get(top, "rank").unwrap(), "rank")?;
    let ring_text = as_str(get(top, "ring").unwrap(), "ring")?.to_owned();
    check_origin(get(top, "origin").unwrap())?;
    if let Some(v) = get(top, "claim") {
        check_text(v, "claim")?;
    }
    if let Some(v) = get(top, "notes") {
        check_text(v, "notes")?;
    }
    let products_json = match get(top, "products").unwrap() {
        Json::Arr(a) => a,
        other => {
            return Err(format!(
                "\"products\" muss eine Liste sein, ist aber {}",
                other.kind()
            ))
        }
    };
    let mut prod_objs = Vec::with_capacity(products_json.len());
    for (r, p) in products_json.iter().enumerate() {
        let o = match p {
            Json::Obj(o) => o,
            other => {
                return Err(format!(
                    "Produkt {} muss ein Objekt sein, ist aber {}",
                    r,
                    other.kind()
                ))
            }
        };
        for (key, _) in o {
            if !["u", "v", "w"].contains(&key.as_str()) {
                return Err(format!("Produkt {}: unbekannter Schlüssel \"{}\"", r, key));
            }
        }
        for key in ["u", "v", "w"] {
            req(o, key, &format!(" in Produkt {}", r))?;
        }
        prod_objs.push(o);
    }

    // Step 2: format version.
    match fv {
        Json::UInt(1) => {}
        Json::UInt(x) => return Err(format!("format_version ist {}, erwartet 1", x)),
        other => {
            return Err(format!(
                "format_version muss die Ganzzahl 1 sein, ist aber {}",
                other.kind()
            ))
        }
    }

    // Step 3: id equals file name, file name matches n, k, m, rank.
    let fname = path
        .file_name()
        .and_then(|f| f.to_str())
        .ok_or_else(|| "Dateiname nicht lesbar".to_owned())?;
    let stem = fname
        .strip_suffix(".json")
        .ok_or_else(|| format!("Dateiname \"{}\" endet nicht auf .json", fname))?;
    if id != stem {
        return Err(format!(
            "id \"{}\" stimmt nicht mit dem Dateinamen \"{}\" überein",
            id, fname
        ));
    }
    let prefix = format!("{}x{}x{}-r{}-", n, k, m, rank);
    let short = stem.strip_prefix(&prefix).ok_or_else(|| {
        format!(
            "Dateiname \"{}\" passt nicht zu n={}, k={}, m={}, rank={} (erwartet Anfang \"{}\")",
            fname, n, k, m, rank, prefix
        )
    })?;
    // Section 9.4.2: the whole id must match the pattern. The prefix is
    // built from the parsed numbers, so leading zeros cannot pass above;
    // the check here covers the short name.
    match parse_id(&id) {
        Some(s) if s == short => {}
        _ => {
            return Err(format!(
                "Kurzname \"{}\" im Dateinamen: nur Kleinbuchstaben und Ziffern, Teile durch einzelne Bindestriche getrennt, nicht leer",
                short
            ))
        }
    }

    // Step 4: rank equals number of products.
    if prod_objs.len() != rank {
        return Err(format!(
            "rank={}, aber \"products\" hat {} Einträge",
            rank,
            prod_objs.len()
        ));
    }

    // Step 5: shapes.
    let mut raw = Vec::with_capacity(rank);
    for (r, o) in prod_objs.iter().enumerate() {
        let u = matrix_strings(get(o, "u").unwrap(), n, k, &format!("Produkt {} u", r))?;
        let v = matrix_strings(get(o, "v").unwrap(), k, m, &format!("Produkt {} v", r))?;
        let w = matrix_strings(get(o, "w").unwrap(), n, m, &format!("Produkt {} w", r))?;
        raw.push((u, v, w));
    }

    // Step 6: ring and coefficients.
    let ring = parse_ring(&ring_text)?;
    let conv = |mat: &Vec<Vec<&str>>, what: String| -> Step<Matrix> {
        mat.iter()
            .enumerate()
            .map(|(i, row)| {
                row.iter()
                    .enumerate()
                    .map(|(c, s)| {
                        parse_coeff(s, &ring).map_err(|e| format!("{}[{}][{}]: {}", what, i, c, e))
                    })
                    .collect()
            })
            .collect()
    };
    let mut products = Vec::with_capacity(rank);
    for (r, (u, v, w)) in raw.iter().enumerate() {
        products.push(Product {
            u: conv(u, format!("Produkt {} u", r))?,
            v: conv(v, format!("Produkt {} v", r))?,
            w: conv(w, format!("Produkt {} w", r))?,
        });
    }

    Ok(Scheme {
        id,
        n,
        k,
        m,
        rank,
        ring,
        ring_text,
        products,
    })
}

// ---------------------------------------------------------------------------
// Step 7: the equations
// ---------------------------------------------------------------------------

struct Violation {
    i: usize,
    j: usize,
    j2: usize,
    l: usize,
    i2: usize,
    l2: usize,
    value: BigRational,
    expected: u8,
}

impl fmt::Display for Violation {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(
            f,
            "i={} j={} j'={} l={} i'={} l'={} Wert={} Soll={}",
            self.i,
            self.j,
            self.j2,
            self.l,
            self.i2,
            self.l2,
            show(&self.value),
            self.expected
        )
    }
}

/// Computes, for all index tuples, the sum over r of
/// u_r[i][j] * v_r[j'][l] * w_r[i'][l'] exactly and compares it with
/// 1 if (i, j, l) = (i', j', l') and 0 otherwise. Returns all violations.
fn check_equations(s: &Scheme) -> Vec<Violation> {
    let mut out = Vec::new();
    for i in 0..s.n {
        for j in 0..s.k {
            for j2 in 0..s.k {
                for l in 0..s.m {
                    // uv[r] = u_r[i][j] * v_r[j'][l], independent of i', l'.
                    let uv: Vec<BigRational> = s
                        .products
                        .iter()
                        .map(|p| &p.u[i][j] * &p.v[j2][l])
                        .collect();
                    for i2 in 0..s.n {
                        for l2 in 0..s.m {
                            let mut sum = BigRational::zero();
                            for (r, p) in s.products.iter().enumerate() {
                                if !uv[r].is_zero() {
                                    sum += &uv[r] * &p.w[i2][l2];
                                }
                            }
                            let value = reduce(&sum, &s.ring);
                            let expected: u8 = if i == i2 && j == j2 && l == l2 { 1 } else { 0 };
                            if value != BigRational::from_integer(BigInt::from(expected)) {
                                out.push(Violation {
                                    i,
                                    j,
                                    j2,
                                    l,
                                    i2,
                                    l2,
                                    value,
                                    expected,
                                });
                            }
                        }
                    }
                }
            }
        }
    }
    out
}

// ---------------------------------------------------------------------------
// Hints
// ---------------------------------------------------------------------------

fn is_zero_matrix(mat: &Matrix, ring: &Ring) -> bool {
    mat.iter().flatten().all(|x| reduce(x, ring).is_zero())
}

/// Prime factors of a positive integer by trial division up to 10^6.
/// Returns the primes found and the unfactored rest (> 1) if any.
fn prime_factors(mut d: BigUint) -> (Vec<u64>, Option<BigUint>) {
    let mut primes = Vec::new();
    let mut p: u64 = 2;
    while p <= 1_000_000 {
        let bp = BigUint::from(p);
        if &bp * &bp > d {
            break;
        }
        if (&d % &bp).is_zero() {
            primes.push(p);
            while (&d % &bp).is_zero() {
                d /= &bp;
            }
        }
        p += if p == 2 { 1 } else { 2 };
    }
    if d.is_one() {
        (primes, None)
    } else if d.to_u64().map_or(false, |x| x <= 1_000_000u64 * 1_000_000u64) {
        // Remaining d has no factor <= sqrt(d), so it is prime.
        primes.push(d.to_u64().unwrap());
        (primes, None)
    } else {
        (primes, Some(d))
    }
}

fn hints(s: &Scheme) -> Vec<String> {
    let mut out = Vec::new();
    for (r, p) in s.products.iter().enumerate() {
        for (name, mat) in [("u", &p.u), ("v", &p.v), ("w", &p.w)] {
            if is_zero_matrix(mat, &s.ring) {
                out.push(format!(
                    "HINWEIS Produkt {} (Zählung ab 0): {} ist ganz null, das Verfahren käme mit weniger Produkten aus",
                    r, name
                ));
            }
        }
    }
    if let Ring::Q = s.ring {
        let mut dens: BTreeSet<BigUint> = BTreeSet::new();
        for p in &s.products {
            for x in p.u.iter().chain(p.v.iter()).chain(p.w.iter()).flatten() {
                let d = x.denom().abs().to_biguint().expect("positive");
                if !d.is_one() {
                    dens.insert(d);
                }
            }
        }
        let mut primes: BTreeSet<u64> = BTreeSet::new();
        let mut rests: BTreeSet<BigUint> = BTreeSet::new();
        for d in dens {
            let (ps, rest) = prime_factors(d);
            primes.extend(ps);
            if let Some(r) = rest {
                rests.insert(r);
            }
        }
        if primes.is_empty() && rests.is_empty() {
            out.push("HINWEIS Nenner-Primteiler: keine (alle Koeffizienten ganzzahlig)".to_owned());
        } else {
            let list: Vec<String> = primes.iter().map(|p| p.to_string()).collect();
            out.push(format!(
                "HINWEIS Nenner-Primteiler: {} (für diese Charakteristiken ist das Verfahren nicht belegt)",
                if list.is_empty() { "-".to_owned() } else { list.join(", ") }
            ));
            for r in rests {
                out.push(format!(
                    "HINWEIS Nenner enthält den nicht zerlegten Faktor {} (ohne Primteiler unter 10^6); seine Primteiler gehören ebenfalls zur Liste",
                    r
                ));
            }
        }
    }
    out
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

const MAX_LISTED: usize = 20;

/// Output lines must stay single lines: control characters taken from the
/// file or the path (e.g. a line feed in a coefficient) are written as
/// escapes `\u{..}`.
fn one_line(s: &str) -> String {
    let mut out = String::with_capacity(s.len());
    for c in s.chars() {
        if c.is_control() || c == '\u{2028}' || c == '\u{2029}' {
            out.push_str(&format!("\\u{{{:x}}}", c as u32));
        } else {
            out.push(c);
        }
    }
    out
}

fn run(path: &Path) -> Outcome {
    let bytes = match std::fs::read(path) {
        Ok(b) => b,
        Err(e) => {
            return Outcome::Malformed {
                reason: format!("Datei nicht lesbar: {}", e),
            }
        }
    };
    let scheme = match read_scheme(path, &bytes) {
        Ok(s) => s,
        Err(reason) => return Outcome::Malformed { reason },
    };
    debug_assert_eq!(scheme.ring.to_string(), scheme.ring_text);
    let violations = check_equations(&scheme);
    let hint_lines = hints(&scheme);
    if violations.is_empty() {
        Outcome::Accepted {
            header: format!(
                "{} {}x{}x{} rank={} ring={}",
                scheme.id, scheme.n, scheme.k, scheme.m, scheme.rank, scheme.ring_text
            ),
            lines: hint_lines,
        }
    } else {
        let total = scheme.n * scheme.k * scheme.k * scheme.m * scheme.n * scheme.m;
        let reason = format!(
            "{} von {} Gleichungen verletzt, erste: {}",
            violations.len(),
            total,
            violations[0]
        );
        let mut lines: Vec<String> = violations
            .iter()
            .take(MAX_LISTED)
            .map(|v| format!("VERLETZT {}", v))
            .collect();
        if violations.len() > MAX_LISTED {
            lines.push(format!(
                "VERLETZT ... weitere {} nicht aufgeführt",
                violations.len() - MAX_LISTED
            ));
        }
        lines.extend(hint_lines);
        Outcome::Rejected {
            id: scheme.id,
            reason,
            lines,
        }
    }
}

fn main() -> ExitCode {
    let args: Vec<std::ffi::OsString> = std::env::args_os().skip(1).collect();
    if args.len() != 1 {
        println!(
            "FEHLERHAFT - Aufruf: pruefer <Datei> (genau ein Dateipfad, erhalten: {})",
            args.len()
        );
        return ExitCode::from(2);
    }
    let path = Path::new(&args[0]);
    let display_name = path
        .file_name()
        .map(|f| f.to_string_lossy().into_owned())
        .unwrap_or_else(|| path.to_string_lossy().into_owned());
    match run(path) {
        Outcome::Accepted { header, lines } => {
            println!("ANGENOMMEN {}", header);
            for l in lines {
                println!("{}", l);
            }
            ExitCode::from(0)
        }
        Outcome::Rejected { id, reason, lines } => {
            println!("ABGELEHNT {} {}", one_line(&id), one_line(&reason));
            for l in lines {
                println!("{}", l);
            }
            ExitCode::from(1)
        }
        Outcome::Malformed { reason } => {
            println!("FEHLERHAFT {} {}", one_line(&display_name), one_line(&reason));
            ExitCode::from(2)
        }
    }
}

#[cfg(test)]
mod unit {
    use super::*;

    #[test]
    fn primes() {
        let ps: Vec<u64> = (0..60).filter(|&x| is_prime_u64(x)).collect();
        assert_eq!(
            ps,
            vec![2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59]
        );
        assert!(is_prime_u64(18446744073709551557)); // largest 64-bit prime
        assert!(!is_prime_u64(3215031751)); // strong pseudoprime to bases 2,3,5,7
        assert!(!is_prime_u64(1));
    }

    #[test]
    fn coefficients() {
        let q = Ring::Q;
        for ok in ["0", "1", "-1", "3/2", "-1/4", "-0", "12/8", "100"] {
            assert!(parse_coeff(ok, &q).is_ok(), "{}", ok);
        }
        for bad in [
            "+1", "01", "1.5", "1e2", " 1", "1 ", "1/0", "1/01", "", "-", "/2", "1/", "--1", "1/-2",
            "0x1", "١",
        ] {
            assert!(parse_coeff(bad, &q).is_err(), "{}", bad);
        }
        assert!(parse_coeff("1/2", &Ring::Z).is_err());
        assert!(parse_coeff("1/2", &Ring::Gf(3)).is_err());
        assert_eq!(
            parse_coeff("12/8", &q).unwrap(),
            BigRational::new(BigInt::from(3), BigInt::from(2))
        );
        assert_eq!(
            reduce(&parse_coeff("-1", &Ring::Gf(5)).unwrap(), &Ring::Gf(5)),
            BigRational::from_integer(BigInt::from(4))
        );
    }

    #[test]
    fn rings() {
        assert!(parse_ring("GF(2)").is_ok());
        assert!(parse_ring("GF(4)").is_err());
        assert!(parse_ring("GF(02)").is_err());
        assert!(parse_ring("GF(1)").is_err());
        assert!(parse_ring("GF()").is_err());
        assert!(parse_ring("R").is_err());
        assert!(parse_ring("gf(2)").is_err());
        assert!(parse_ring("GF(99999999999999999999999)").is_err());
    }

    #[test]
    fn factoring() {
        let (p, r) = prime_factors(BigUint::from(360u32));
        assert_eq!(p, vec![2, 3, 5]);
        assert!(r.is_none());
        let (p, r) = prime_factors(BigUint::from(1_000_003u64 * 2));
        assert_eq!(p, vec![2, 1_000_003]);
        assert!(r.is_none());
    }

    #[test]
    fn dates() {
        assert!(check_date("2026-11-25").is_ok());
        assert!(check_date("2024-02-29").is_ok());
        assert!(check_date("2026-02-29").is_err());
        assert!(check_date("2026-13-01").is_err());
        assert!(check_date("26-11-25").is_err());
        assert!(check_date("0000-01-01").is_err());
        assert!(check_date("0001-01-01").is_ok());
        assert!(check_date("9999-12-31").is_ok());
    }

    #[test]
    fn ids() {
        for ok in ["2x2x2-r7-strassen69", "3x2x5-r25-hk71", "1x1x1-r1-a-b-c", "10x2x10-r100-r1"] {
            assert!(parse_id(ok).is_some(), "{}", ok);
        }
        for bad in [
            "", "x", "02x2x2-r7-a", "2x2x2-r07-a", "2x2x2-r7-", "2x2x2-r7--a", "2x2x2-r7-a-", "2x2x2-r7-a--b",
            "2x2x2-r7-A", "2x2x2-r7-ä", "2x2-r7-a", "2x2x2x2-r7-a", "2x2x2-r-a", "2x2x2r7-a", "٢x2x2-r7-a",
        ] {
            assert!(parse_id(bad).is_none(), "{}", bad);
        }
        assert_eq!(parse_id("2x2x2-r7-a-b"), Some("a-b"));
    }

    #[test]
    fn single_line_output() {
        assert_eq!(one_line("a\nb\r\tc"), "a\\u{a}b\\u{d}\\u{9}c");
        assert_eq!(one_line("äx"), "äx");
    }
}
