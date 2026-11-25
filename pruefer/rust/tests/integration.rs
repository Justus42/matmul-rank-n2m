//! End-to-end tests: run the binary on files and check first line and exit code.

use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicUsize, Ordering};

fn data(name: &str) -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("tests")
        .join("daten")
        .join(name)
}

fn run(path: &Path) -> (i32, Vec<String>) {
    let out = Command::new(env!("CARGO_BIN_EXE_pruefer"))
        .arg(path)
        .output()
        .expect("binary runs");
    let text = String::from_utf8(out.stdout).expect("utf-8 output");
    (
        out.status.code().expect("exit code"),
        text.lines().map(|s| s.to_owned()).collect(),
    )
}

static COUNTER: AtomicUsize = AtomicUsize::new(0);

/// Writes `content` to a fresh temporary directory under `name`.
fn tmp_file(name: &str, content: &str) -> PathBuf {
    let dir = std::env::temp_dir().join(format!(
        "pruefer-rust-test-{}-{}",
        std::process::id(),
        COUNTER.fetch_add(1, Ordering::SeqCst)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let p = dir.join(name);
    std::fs::write(&p, content).unwrap();
    p
}

fn strassen_text() -> String {
    std::fs::read_to_string(data("2x2x2-r7-strassen69.json")).unwrap()
}

/// Naive scheme for <n,k,m>: one product per (i, j, l), A[i][j] * B[j][l] -> C[i][l].
/// If `transpose_w` is set, w is stored as m x n with w[l][i] = 1 (wrong convention).
fn naive(n: usize, k: usize, m: usize, transpose_w: bool, short: &str) -> (String, String) {
    let unit = |rows: usize, cols: usize, a: usize, b: usize| -> String {
        let rs: Vec<String> = (0..rows)
            .map(|r| {
                let cs: Vec<String> = (0..cols)
                    .map(|c| if r == a && c == b { "\"1\"" } else { "\"0\"" }.to_owned())
                    .collect();
                format!("[{}]", cs.join(","))
            })
            .collect();
        format!("[{}]", rs.join(","))
    };
    let mut prods = Vec::new();
    for i in 0..n {
        for j in 0..k {
            for l in 0..m {
                let w = if transpose_w {
                    unit(m, n, l, i)
                } else {
                    unit(n, m, i, l)
                };
                prods.push(format!(
                    "{{\"u\":{},\"v\":{},\"w\":{}}}",
                    unit(n, k, i, j),
                    unit(k, m, j, l),
                    w
                ));
            }
        }
    }
    let rank = n * k * m;
    let id = format!("{}x{}x{}-r{}-{}", n, k, m, rank, short);
    let text = format!(
        "{{\"format_version\":1,\"id\":\"{id}\",\"n\":{n},\"k\":{k},\"m\":{m},\"rank\":{rank},\"ring\":\"Z\",\
         \"origin\":{{\"source\":\"Schulmethode\",\"method\":\"im Test erzeugt\",\"created\":\"2026-11-25\",\
         \"created_by\":\"Verfahrenssucher, A-09 (Test)\"}},\"products\":[{}]}}",
        prods.join(",")
    );
    (format!("{}.json", id), text)
}

// ---------------------------------------------------------------- accepted

#[test]
fn strassen_accepted() {
    let (code, lines) = run(&data("2x2x2-r7-strassen69.json"));
    assert_eq!(code, 0, "{:?}", lines);
    assert_eq!(lines[0], "ANGENOMMEN 2x2x2-r7-strassen69 2x2x2 rank=7 ring=Z");
    assert_eq!(lines.len(), 1, "{:?}", lines);
}

#[test]
fn strassen_rational_accepted_with_denominators() {
    let (code, lines) = run(&data("2x2x2-r7-strassen69-q.json"));
    assert_eq!(code, 0, "{:?}", lines);
    assert_eq!(lines[0], "ANGENOMMEN 2x2x2-r7-strassen69-q 2x2x2 rank=7 ring=Q");
    assert!(lines[1].starts_with("HINWEIS Nenner-Primteiler: 2, 3 "), "{:?}", lines);
}

#[test]
fn wrong_strassen_accepted_over_gf2() {
    // The sign error vanishes in characteristic 2.
    let (code, lines) = run(&data("2x2x2-r7-strassen69-falsch-gf2.json"));
    assert_eq!(code, 0, "{:?}", lines);
    assert_eq!(
        lines[0],
        "ANGENOMMEN 2x2x2-r7-strassen69-falsch-gf2 2x2x2 rank=7 ring=GF(2)"
    );
}

#[test]
fn naive_rectangular_accepted() {
    for (n, k, m) in [(3, 2, 5), (4, 2, 4), (1, 3, 2), (2, 1, 3)] {
        let (name, text) = naive(n, k, m, false, "naiv");
        let (code, lines) = run(&tmp_file(&name, &text));
        assert_eq!(code, 0, "{} {:?}", name, lines);
    }
}

#[test]
fn zero_product_hint() {
    // Append a product with u = 0 to the naive 1x1x1 scheme (rank 2).
    let text = "{\"format_version\":1,\"id\":\"1x1x1-r2-null\",\"n\":1,\"k\":1,\"m\":1,\"rank\":2,\"ring\":\"Q\",\
        \"origin\":{\"source\":\"s\",\"method\":\"m\",\"created\":\"2026-11-25\",\"created_by\":\"t\"},\
        \"products\":[{\"u\":[[\"2\"]],\"v\":[[\"1/2\"]],\"w\":[[\"1\"]]},{\"u\":[[\"0\"]],\"v\":[[\"5\"]],\"w\":[[\"7\"]]}]}";
    let (code, lines) = run(&tmp_file("1x1x1-r2-null.json", text));
    assert_eq!(code, 0, "{:?}", lines);
    assert!(lines.iter().any(|l| l.starts_with("HINWEIS Produkt 1 (Zählung ab 0): u ist ganz null")));
    assert!(lines.iter().any(|l| l.starts_with("HINWEIS Nenner-Primteiler: 2 ")));
}

// ---------------------------------------------------------------- rejected

#[test]
fn wrong_strassen_rejected() {
    let (code, lines) = run(&data("2x2x2-r7-strassen69-falsch.json"));
    assert_eq!(code, 1, "{:?}", lines);
    assert!(lines[0].starts_with("ABGELEHNT 2x2x2-r7-strassen69-falsch 2 von 64 Gleichungen verletzt, erste: "), "{:?}", lines);
    // M2 = (A10 + A11) B00 with w[1][1] = +1 instead of -1 contributes 2 to the
    // coefficient of A10*B00 and A11*B00 in C11.
    let v: Vec<&String> = lines.iter().filter(|l| l.starts_with("VERLETZT ")).collect();
    assert_eq!(
        v,
        vec![
            "VERLETZT i=1 j=0 j'=0 l=0 i'=1 l'=1 Wert=2 Soll=0",
            "VERLETZT i=1 j=1 j'=0 l=0 i'=1 l'=1 Wert=2 Soll=0",
        ]
    );
}

#[test]
fn wrong_strassen_rejected_over_gf3() {
    let (code, lines) = run(&data("2x2x2-r7-strassen69-falsch-gf3.json"));
    assert_eq!(code, 1, "{:?}", lines);
    assert!(lines.iter().any(|l| l == "VERLETZT i=1 j=0 j'=0 l=0 i'=1 l'=1 Wert=2 Soll=0"));
}

#[test]
fn transposed_w_rejected_when_square() {
    // For n = m the transposed convention has the right shape but is wrong.
    let (name, text) = naive(2, 2, 2, true, "transp");
    let (code, lines) = run(&tmp_file(&name, &text));
    assert_eq!(code, 1, "{:?}", lines);
}

#[test]
fn each_single_coefficient_change_is_rejected() {
    // Flip every coefficient of Strassen once (0 -> 1, nonzero -> 0) and
    // require rejection every time.
    let base = strassen_text();
    let mut positions = Vec::new();
    let bytes = base.as_bytes();
    let start = base.find("\"products\"").unwrap();
    let mut i = start;
    while i < bytes.len() {
        if bytes[i] == b'"' {
            let end = i + 1 + base[i + 1..].find('"').unwrap();
            let tok = &base[i + 1..end];
            if tok.chars().all(|c| c == '-' || c.is_ascii_digit()) && !tok.is_empty() {
                positions.push((i + 1, end));
            }
            i = end + 1;
        } else {
            i += 1;
        }
    }
    assert_eq!(positions.len(), 7 * 12);
    for (a, b) in positions {
        let tok = &base[a..b];
        let repl = if tok == "0" { "1" } else { "0" };
        let text = format!("{}{}{}", &base[..a], repl, &base[b..]);
        let (code, lines) = run(&tmp_file("2x2x2-r7-strassen69.json", &text));
        assert_eq!(code, 1, "change at {} {:?}", a, lines);
    }
}

// ---------------------------------------------------------------- malformed

fn expect_malformed(name: &str, text: &str, needle: &str) {
    let (code, lines) = run(&tmp_file(name, text));
    assert_eq!(code, 2, "{:?}", lines);
    assert!(
        lines[0].starts_with(&format!("FEHLERHAFT {} ", name)),
        "{:?}",
        lines
    );
    assert!(lines[0].contains(needle), "expected '{}' in {:?}", needle, lines);
    assert_eq!(lines.len(), 1);
}

#[test]
fn malformed_cases() {
    let s = strassen_text();
    let f = "2x2x2-r7-strassen69.json";
    // Step 1
    expect_malformed(f, "{", "kein gültiges JSON");
    expect_malformed(f, "[]", "oberste Ebene");
    expect_malformed(f, &s.replacen("\"format_version\"", "\"extra\": 1, \"format_version\"", 1), "unbekannter Schlüssel \"extra\"");
    expect_malformed(f, &s.replacen("\"ring\": \"Z\",", "", 1), "Pflichtfeld \"ring\" fehlt");
    expect_malformed(f, &s.replacen("\"n\": 2,", "\"n\": 2, \"n\": 2,", 1), "doppelter Schlüssel");
    expect_malformed(f, &s.replacen("\"n\": 2,", "\"n\": 2.0,", 1), "\"n\" muss eine Ganzzahl sein");
    expect_malformed(f, &s.replacen("\"n\": 2,", "\"n\": 0,", 1), ">= 1");
    expect_malformed(f, &s.replacen("\"created\": \"2026-11-25\"", "\"created\": \"25.11.2026\"", 1), "JJJJ-MM-TT");
    expect_malformed(f, &s.replacen("\"created_by\"", "\"created_von\"", 1), "created_von");
    // Step 2
    expect_malformed(f, &s.replacen("\"format_version\": 1", "\"format_version\": 2", 1), "format_version ist 2");
    // Step 3
    expect_malformed("2x2x2-r7-anders.json", &s, "stimmt nicht mit dem Dateinamen");
    expect_malformed(f, &s.replacen("\"m\": 2", "\"m\": 3", 1), "passt nicht zu");
    let bad_short = s.replacen("2x2x2-r7-strassen69", "2x2x2-r7-Strassen", 1);
    expect_malformed("2x2x2-r7-Strassen.json", &bad_short, "Kurzname");
    // Step 4
    let r8 = s
        .replacen("2x2x2-r7-strassen69", "2x2x2-r8-strassen69", 1)
        .replacen("\"rank\": 7", "\"rank\": 8", 1);
    expect_malformed("2x2x2-r8-strassen69.json", &r8, "rank=8, aber");
    // Step 5
    let (name, text) = naive(2, 2, 3, true, "transp");
    expect_malformed(&name, &text, "w hat 3 Zeilen, erwartet 2");
    expect_malformed(f, &s.replacen("[\"1\",\"0\"]", "[\"1\"]", 1), "erwartet 2");
    expect_malformed(f, &s.replacen("\"1\",\"0\"", "1,\"0\"", 1), "muss eine Zeichenkette sein");
    // Step 6
    expect_malformed(f, &s.replacen("\"ring\": \"Z\"", "\"ring\": \"GF(4)\"", 1), "keine Primzahl");
    expect_malformed(f, &s.replacen("\"ring\": \"Z\"", "\"ring\": \"R\"", 1), "unbekannt");
    expect_malformed(f, &s.replacen("\"-1\"", "\"-1/1\"", 1), "Bruchstrich");
    expect_malformed(f, &s.replacen("\"-1\"", "\"+1\"", 1), "Schreibweise");
    expect_malformed(f, &s.replacen("\"-1\"", "\"1.0\"", 1), "Schreibweise");
}

#[test]
fn invalid_utf8_and_arguments() {
    let p = tmp_file("2x2x2-r7-x.json", "");
    std::fs::write(&p, [0xffu8, 0xfe, 0x7b]).unwrap();
    let (code, lines) = run(&p);
    assert_eq!(code, 2);
    assert!(lines[0].contains("UTF-8"), "{:?}", lines);

    let out = Command::new(env!("CARGO_BIN_EXE_pruefer")).output().unwrap();
    assert_eq!(out.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&out.stdout).starts_with("FEHLERHAFT "));

    let (code, lines) = run(Path::new("/nonexistent/2x2x2-r7-x.json"));
    assert_eq!(code, 2);
    assert!(lines[0].starts_with("FEHLERHAFT 2x2x2-r7-x.json Datei nicht lesbar"));
}

#[test]
fn example_block_from_format_readme_accepted() {
    // The JSON block of section 7 in verfahren/README.md, saved unchanged.
    let readme = std::fs::read_to_string(
        Path::new(env!("CARGO_MANIFEST_DIR")).join("../../verfahren/README.md"),
    )
    .expect("verfahren/README.md readable");
    let start = readme.find("```json\n").expect("json block") + "```json\n".len();
    let end = start + readme[start..].find("```").expect("end of block");
    let (code, lines) = run(&tmp_file("2x2x2-r7-strassen69.json", &readme[start..end]));
    assert_eq!(code, 0, "{:?}", lines);
    assert_eq!(lines, vec!["ANGENOMMEN 2x2x2-r7-strassen69 2x2x2 rank=7 ring=Z"]);
}

// ------------------------------------------------- section 9 (task S1-08)
//
// One block per rule of section 9 in verfahren/README.md. Every case
// states the expected first word and exit code. Cases are built from the
// Strassen test file by text replacement.

const F: &str = "2x2x2-r7-strassen69.json";

/// Replaces `from` by `to` exactly once (panics if `from` is not unique).
fn edit(text: &str, from: &str, to: &str) -> String {
    assert_eq!(text.matches(from).count(), 1, "pattern {:?} not unique", from);
    text.replacen(from, to, 1)
}

/// Expects FEHLERHAFT with exit code 2, file name as last path part and no
/// further lines (9.7.6).
fn malformed(name: &str, text: &str, case: &str) {
    let (code, lines) = run(&tmp_file(name, text));
    assert_eq!(code, 2, "{}: {:?}", case, lines);
    assert!(
        lines[0].starts_with(&format!("FEHLERHAFT {} ", name)),
        "{}: {:?}",
        case,
        lines
    );
    assert_eq!(lines.len(), 1, "{}: {:?}", case, lines);
}

fn malformed_bytes(name: &str, bytes: &[u8], case: &str) {
    let p = tmp_file(name, "");
    std::fs::write(&p, bytes).unwrap();
    let (code, lines) = run(&p);
    assert_eq!(code, 2, "{}: {:?}", case, lines);
    assert!(lines[0].starts_with(&format!("FEHLERHAFT {} ", name)), "{}: {:?}", case, lines);
    assert_eq!(lines.len(), 1, "{}: {:?}", case, lines);
}

/// Expects ANGENOMMEN with exit code 0 and returns all lines.
fn accepted(name: &str, text: &str, case: &str) -> Vec<String> {
    let (code, lines) = run(&tmp_file(name, text));
    assert_eq!(code, 0, "{}: {:?}", case, lines);
    assert!(lines[0].starts_with("ANGENOMMEN "), "{}: {:?}", case, lines);
    lines
}

/// Strassen over Q (same coefficients, ring changed).
fn strassen_q() -> String {
    edit(&strassen_text(), "\"ring\": \"Z\"", "\"ring\": \"Q\"")
}

#[test]
fn r9_1_1_json_text() {
    let s = strassen_text();
    // Byte-order mark.
    let mut bom = vec![0xEFu8, 0xBB, 0xBF];
    bom.extend_from_slice(s.as_bytes());
    malformed_bytes(F, &bom, "BOM");
    // Invalid UTF-8 inside a string.
    let mut bad = s.clone().into_bytes();
    let pos = s.find("Strassen,").unwrap();
    bad[pos] = 0xC3; // start of a 2-byte sequence followed by ASCII
    malformed_bytes(F, &bad, "invalid UTF-8");
    // Content after the JSON value.
    malformed(F, &format!("{}x", s), "trailing text");
    malformed(F, &format!("{}{{}}", s), "second value");
    malformed(F, &format!("{}\u{0C}", s), "form feed after value");
    malformed(F, &format!("{}\u{A0}", s), "no-break space after value");
    // Whitespace after the value in the sense of RFC 8259 is fine.
    accepted(F, &format!(" \t\r\n{} \t\r\n", s), "whitespace around value");
    // NaN, Infinity, comments, trailing commas.
    malformed(F, &edit(&s, "\"n\": 2,", "\"n\": NaN,"), "NaN");
    malformed(F, &edit(&s, "\"n\": 2,", "\"n\": Infinity,"), "Infinity");
    malformed(F, &edit(&s, "\"n\": 2,", "\"n\": -Infinity,"), "-Infinity");
    malformed(F, &edit(&s, "\"n\": 2,", "\"n\": 2, // Kommentar\n"), "line comment");
    malformed(F, &edit(&s, "\"n\": 2,", "\"n\": 2, /* Kommentar */"), "block comment");
    malformed(F, &edit(&s, "\"created_by\": \"Verfahrenssucher, A-09 (Testfall)\"", "\"created_by\": \"Verfahrenssucher, A-09 (Testfall)\","), "trailing comma in object");
    malformed(F, &edit(&s, "\"v\": [[\"1\",\"1\"],[\"0\",\"0\"]]", "\"v\": [[\"1\",\"1\",],[\"0\",\"0\"]]"), "trailing comma in list");
    malformed(F, &edit(&s, "\"0\",\"0\"]]}\n  ]", "\"0\",\"0\"]]},\n  ]"), "trailing comma in products");
}

#[test]
fn r9_1_2_duplicate_keys() {
    let s = strassen_text();
    malformed(F, &edit(&s, "\"n\": 2,", "\"n\": 2, \"n\": 2,"), "top level");
    malformed(F, &edit(&s, "\"created\": \"2026-11-25\",", "\"created\": \"2026-11-25\", \"created\": \"2026-11-25\","), "origin");
    malformed(F, &edit(&s, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], ", "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], "), "product");
    // Equal after decoding the escape (9.1.4).
    malformed(F, &edit(&s, "\"n\": 2,", "\"n\": 2, \"\\u006e\": 2,"), "escaped duplicate");
}

#[test]
fn r9_1_3_lone_surrogates() {
    let s = strassen_text();
    let notes = "\"notes\": \"Strassen, unverändert aus verfahren/README.md. Erwartet: ANGENOMMEN.\"";
    malformed(F, &edit(&s, notes, "\"notes\": \"a\\ud800b\""), "lone high surrogate");
    malformed(F, &edit(&s, notes, "\"notes\": \"a\\udc00b\""), "lone low surrogate");
    malformed(F, &edit(&s, notes, "\"notes\": \"a\\udc00\\ud800b\""), "surrogates in wrong order");
    malformed(F, &edit(&s, notes, "\"notes\": \"\\ud800\""), "only a high surrogate");
    malformed(F, &edit(&s, "\"n\": 2,", "\"n\": 2, \"\\ud800\": 2,"), "lone surrogate in key");
    // A proper pair is fine.
    accepted(F, &edit(&s, notes, "\"notes\": \"a\\ud83d\\ude00b\""), "surrogate pair");
}

#[test]
fn r9_1_4_escapes_decode() {
    let s = strassen_text();
    // Escaped key "u" and escaped coefficient "1".
    let t = edit(&s, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], ", "{\"\\u0075\": [[\"\\u0031\",\"0\"],[\"0\",\"1\"]], ");
    let lines = accepted(F, &t, "escaped key and coefficient");
    assert_eq!(lines, vec!["ANGENOMMEN 2x2x2-r7-strassen69 2x2x2 rank=7 ring=Z"]);
    // Escaped slash and escaped id.
    let t = edit(&s, "\"id\": \"2x2x2-r7-strassen69\"", "\"id\": \"2x2x2-r7-strassen\\u00369\"");
    accepted(F, &t, "escaped id");
    let t = edit(&s, "\"ring\": \"Z\"", "\"ring\": \"\\u005a\"");
    accepted(F, &t, "escaped ring");
    // An escape that decodes to a forbidden value is still forbidden.
    let t = edit(&s, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]]", "{\"u\": [[\"1\\n\",\"0\"],[\"0\",\"1\"]]");
    malformed(F, &t, "escaped line feed in coefficient");
}

#[test]
fn r9_1_5_top_level_object() {
    for text in ["[]", "\"x\"", "1", "null", "true", "[{}]"] {
        malformed(F, text, text);
    }
}

#[test]
fn r9_2_1_unknown_keys() {
    let s = strassen_text();
    malformed(F, &edit(&s, "\"n\": 2,", "\"n\": 2, \"extra\": \"x\","), "top level");
    malformed(F, &edit(&s, "\"created\": \"2026-11-25\",", "\"created\": \"2026-11-25\", \"extra\": \"x\","), "origin");
    malformed(F, &edit(&s, "\"created\": \"2026-11-25\",", "\"created\": \"2026-11-25\", \"Source\": \"x\","), "origin, case differs");
    malformed(F, &edit(&s, "\"created\": \"2026-11-25\",", "\"created\": \"2026-11-25\", \"claim\": \"B-001\","), "origin, top-level key");
    malformed(F, &edit(&s, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], ", "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"x\": \"1\", "), "product");
    malformed(F, &edit(&s, "\"n\": 2,", "\"n\": 2, \"derived_from\": \"2x2x2-r7-a\","), "derived_from on top level");
    // The optional keys at their places are fine.
    let t = edit(&s, "\"n\": 2,", "\"n\": 2, \"claim\": \"B-999\",");
    let t = edit(&t, "\"created\": \"2026-11-25\",", "\"created\": \"2026-11-25\", \"derived_from\": \"2x2x2-r7-other\",");
    accepted(F, &t, "all eleven and all five keys");
}

#[test]
fn r9_2_2_integer_fields() {
    let s = strassen_text();
    for field in ["\"n\": 2,", "\"k\": 2,", "\"m\": 2,", "\"rank\": 7,", "\"format_version\": 1,"] {
        let (key, val) = field.trim_end_matches(',').split_once(": ").unwrap();
        for bad in [
            format!("{}.0", val),
            format!("{}e0", val),
            format!("{}E0", val),
            format!("\"{}\"", val),
            "true".to_owned(),
            "false".to_owned(),
            "null".to_owned(),
            format!("[{}]", val),
            "0".to_owned(),
            format!("-{}", val),
            "-0".to_owned(),
            "18446744073709551616".to_owned(),
            "100000000000000000000000000000".to_owned(),
        ] {
            let t = edit(&s, field, &format!("{}: {},", key, bad));
            malformed(F, &t, &format!("{} = {}", key, bad));
        }
    }
}

#[test]
fn r9_2_3_types_and_null() {
    let s = strassen_text();
    let src = "\"source\": \"V. Strassen, Gaussian elimination is not optimal, Numer. Math. 13 (1969), 354-356\"";
    let notes = "\"notes\": \"Strassen, unverändert aus verfahren/README.md. Erwartet: ANGENOMMEN.\"";
    let origin_start = "\"origin\": {";
    malformed(F, &edit(&s, src, "\"source\": 5"), "origin.source number");
    malformed(F, &edit(&s, src, "\"source\": null"), "origin.source null");
    malformed(F, &edit(&s, src, "\"source\": [\"x\"]"), "origin.source list");
    malformed(F, &edit(&s, src, "\"source\": {}"), "origin.source object");
    malformed(F, &edit(&s, "\"created\": \"2026-11-25\"", "\"created\": 20261125"), "origin.created number");
    malformed(F, &edit(&s, "\"created_by\": \"Verfahrenssucher, A-09 (Testfall)\"", "\"created_by\": true"), "origin.created_by bool");
    malformed(F, &edit(&s, "\"created\": \"2026-11-25\",", "\"created\": \"2026-11-25\", \"derived_from\": null,"), "derived_from null");
    malformed(F, &edit(&s, "\"created\": \"2026-11-25\",", "\"created\": \"2026-11-25\", \"derived_from\": 1,"), "derived_from number");
    malformed(F, &edit(&s, notes, "\"notes\": null"), "notes null");
    malformed(F, &edit(&s, notes, "\"notes\": 1"), "notes number");
    malformed(F, &edit(&s, notes, "\"notes\": [\"a\"]"), "notes list");
    malformed(F, &edit(&s, notes, "\"claim\": null"), "claim null");
    malformed(F, &edit(&s, notes, "\"claim\": 1"), "claim number");
    malformed(F, &edit(&s, "\"id\": \"2x2x2-r7-strassen69\"", "\"id\": null"), "id null");
    malformed(F, &edit(&s, "\"ring\": \"Z\"", "\"ring\": null"), "ring null");
    // origin itself.
    let origin_end = s.find("\"notes\"").unwrap();
    let origin_from = s.find(origin_start).unwrap();
    for bad in ["null", "\"x\"", "[]", "1"] {
        let t = format!("{}\"origin\": {},\n  {}", &s[..origin_from], bad, &s[origin_end..]);
        malformed(F, &t, &format!("origin = {}", bad));
    }
    // Missing optional keys are fine.
    let t = edit(&s, &format!("{},\n", notes), "");
    accepted(F, &t, "without notes");
}

#[test]
fn r9_2_4_blank_strings() {
    let s = strassen_text();
    let fields = [
        "\"source\": \"V. Strassen, Gaussian elimination is not optimal, Numer. Math. 13 (1969), 354-356\"",
        "\"method\": \"aus verfahren/README.md, Abschnitt 7, übernommen\"",
        "\"created_by\": \"Verfahrenssucher, A-09 (Testfall)\"",
        "\"notes\": \"Strassen, unverändert aus verfahren/README.md. Erwartet: ANGENOMMEN.\"",
    ];
    for field in fields {
        let key = field.split(':').next().unwrap();
        for blank in ["", " ", "\\t", "\\n", "\\r", " \\t\\r\\n "] {
            let t = edit(&s, field, &format!("{}: \"{}\"", key, blank));
            malformed(F, &t, &format!("{} = {:?}", key, blank));
        }
        // Any other character counts as content, e.g. a no-break space.
        let t = edit(&s, field, &format!("{}: \"\\u00a0\"", key));
        accepted(F, &t, &format!("{} = no-break space", key));
        let t = edit(&s, field, &format!("{}: \" x \"", key));
        accepted(F, &t, &format!("{} = ' x '", key));
    }
    let notes = fields[3];
    for blank in ["", "  ", "\\n"] {
        malformed(F, &edit(&s, notes, &format!("\"claim\": \"{}\"", blank)), "claim blank");
        malformed(
            F,
            &edit(&s, "\"created\": \"2026-11-25\",", &format!("\"created\": \"2026-11-25\", \"derived_from\": \"{}\",", blank)),
            "derived_from blank",
        );
    }
    accepted(F, &edit(&s, notes, "\"claim\": \"B-001\""), "claim set");
}

#[test]
fn r9_2_5_derived_from() {
    let s = strassen_text();
    let with = |d: &str| {
        edit(&s, "\"created\": \"2026-11-25\",", &format!("\"created\": \"2026-11-25\", \"derived_from\": \"{}\",", d))
    };
    for good in ["2x2x2-r7-strassen69", "3x2x5-r25-hk71", "4x2x4-r25-s001", "1x1x1-r1-a-b-c"] {
        accepted(F, &with(good), good);
    }
    for bad in [
        "strassen69",
        "2x2x2-r7-strassen69.json",
        "02x2x2-r7-a",
        "2x2x2-r07-a",
        "0x2x2-r7-a",
        "2x2x2-r7-",
        "2x2x2-r7-a-",
        "2x2x2-r7--a",
        "2x2x2-r7-a--b",
        "2x2x2-r7-A",
        "2x2x2-r7-ä",
        "2x2x2x2-r7-a",
        "2x2-r7-a",
        "2x2x2-7-a",
        "2x2x2-r7_a",
        " 2x2x2-r7-a",
        "2x2x2-r7-a ",
        "２x2x2-r7-a",
    ] {
        malformed(F, &with(bad), bad);
    }
}

#[test]
fn r9_2_6_products_and_matrices() {
    let s = strassen_text();
    let p0 = "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"v\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"w\": [[\"1\",\"0\"],[\"0\",\"1\"]]}";
    malformed(F, &edit(&s, p0, "null"), "product null");
    malformed(F, &edit(&s, p0, "[]"), "product list");
    malformed(F, &edit(&s, p0, "\"p\""), "product string");
    malformed(F, &edit(&s, p0, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"v\": [[\"1\",\"0\"],[\"0\",\"1\"]]}"), "w missing");
    malformed(F, &edit(&s, p0, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"v\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"w\": null}"), "w null");
    malformed(F, &edit(&s, p0, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"v\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"w\": [[\"1\",\"0\"],null]}"), "row null");
    malformed(F, &edit(&s, p0, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"v\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"w\": [[\"1\",null],[\"0\",\"1\"]]}"), "entry null");
    malformed(F, &edit(&s, p0, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"v\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"w\": [[\"1\",\"0\",\"0\"],[\"0\"]]}"), "unequal rows");
    malformed(F, &edit(&s, p0, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"v\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"w\": [[1,\"0\"],[\"0\",\"1\"]]}"), "number entry");
    malformed(F, &edit(&s, p0, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"v\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"w\": [\"1\",\"0\",\"0\",\"1\"]}"), "flat list");
    malformed(F, &edit(&s, p0, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"v\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"w\": [[[\"1\"],\"0\"],[\"0\",\"1\"]]}"), "nested list entry");
    malformed(F, &edit(&s, p0, "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"v\": [[\"1\",\"0\"],[\"0\",\"1\"]], \"w\": [[\"1\",\"0\"],[\"0\",\"1\"],[]]}"), "extra empty row");
    let products_start = s.find("\"products\": [").unwrap();
    let t = format!("{}\"products\": {{}}\n}}", &s[..products_start]);
    malformed(F, &t, "products object");
    let t = format!("{}\"products\": null\n}}", &s[..products_start]);
    malformed(F, &t, "products null");
}

#[test]
fn r9_3_dates() {
    let s = strassen_text();
    let with = |d: &str| edit(&s, "\"created\": \"2026-11-25\"", &format!("\"created\": \"{}\"", d));
    for good in ["2026-11-25", "2024-02-29", "2000-02-29", "0001-01-01", "9999-12-31", "2099-01-01", "2026-04-30", "2026-12-31"] {
        accepted(F, &with(good), good);
    }
    for bad in [
        "2026-02-30",
        "2026-02-29",
        "1900-02-29",
        "2100-02-29",
        "2026-04-31",
        "2026-13-01",
        "2026-00-10",
        "2026-11-00",
        "2026-1-5",
        "2026-01-5",
        "0000-01-01",
        "2026-11-25T10:00",
        "2026-11-25 ",
        " 2026-11-25",
        "2026/11/25",
        "25.11.2026",
        "20261125",
        "+026-11-25",
        "-026-11-25",
        "2026-+1-25",
        "２026-11-25",
        "2026-11-2５",
        "10000-01-01",
        "",
    ] {
        malformed(F, &with(bad), bad);
    }
}

#[test]
fn r9_4_1_file_name_and_id() {
    let s = strassen_text();
    // File name in the FEHLERHAFT line is the last part of the path.
    let p = tmp_file("2x2x2-r7-strassen69.json", &edit(&s, "\"n\": 2,", "\"n\": 2.5,"));
    let p2 = p.parent().unwrap().join("unter").join("ordner");
    std::fs::create_dir_all(&p2).unwrap();
    let deep = p2.join(F);
    std::fs::copy(&p, &deep).unwrap();
    let (code, lines) = run(&deep);
    assert_eq!(code, 2);
    assert!(lines[0].starts_with("FEHLERHAFT 2x2x2-r7-strassen69.json "), "{:?}", lines);
    // Extension exactly ".json".
    for name in [
        "2x2x2-r7-strassen69.JSON",
        "2x2x2-r7-strassen69.Json",
        "2x2x2-r7-strassen69.json.bak",
        "2x2x2-r7-strassen69.json ",
        "2x2x2-r7-strassen69",
        "2x2x2-r7-strassen69.jsonl",
    ] {
        malformed(name, &s, name);
    }
    // id differs from the file name byte by byte.
    malformed("2x2x2-r7-strassen70.json", &s, "other file name");
    malformed(F, &edit(&s, "\"id\": \"2x2x2-r7-strassen69\"", "\"id\": \"2x2x2-r7-strassen69.json\""), "id with extension");
    malformed(F, &edit(&s, "\"id\": \"2x2x2-r7-strassen69\"", "\"id\": \"2x2x2-r7-strassen69 \""), "id with space");
    malformed(F, &edit(&s, "\"id\": \"2x2x2-r7-strassen69\"", "\"id\": \"2X2X2-r7-strassen69\""), "id upper case");
}

#[test]
fn r9_4_2_id_pattern() {
    let s = strassen_text();
    let with_id = |id: &str| edit(&s, "\"id\": \"2x2x2-r7-strassen69\"", &format!("\"id\": \"{}\"", id));
    // Leading zeros, also when id and file name agree.
    for id in ["02x2x2-r7-strassen69", "2x02x2-r7-strassen69", "2x2x02-r7-strassen69", "2x2x2-r07-strassen69"] {
        malformed(&format!("{}.json", id), &with_id(id), id);
    }
    // Short name forms.
    for id in [
        "2x2x2-r7-",
        "2x2x2-r7--a",
        "2x2x2-r7-a-",
        "2x2x2-r7-a--b",
        "2x2x2-r7-Strassen",
        "2x2x2-r7-straßen",
        "2x2x2-r7-a_b",
        "2x2x2-r7-a.b",
        "2x2x2-r7",
    ] {
        malformed(&format!("{}.json", id), &with_id(id), id);
    }
    // Numbers must equal n, k, m, rank.
    malformed("2x2x3-r7-a.json", &with_id("2x2x3-r7-a"), "m differs");
    malformed("2x2x2-r8-a.json", &with_id("2x2x2-r8-a"), "rank differs");
    // Good short names.
    for id in ["2x2x2-r7-a", "2x2x2-r7-0", "2x2x2-r7-a-b-c1", "2x2x2-r7-r7", "2x2x2-r7-x-r7-x"] {
        accepted(&format!("{}.json", id), &with_id(id), id);
    }
}

#[test]
fn r9_5_coefficients() {
    let s = strassen_text();
    let q = strassen_q();
    let p0 = "{\"u\": [[\"1\",\"0\"],[\"0\",\"1\"]]";
    let with = |t: &str, a: &str, b: &str| edit(t, p0, &format!("{{\"u\": [[\"{}\",\"{}\"],[\"0\",\"1\"]]", a, b));
    // 9.5.1: the whole string must match.
    for bad in ["1\\n", "1 ", " 1", "1_0", "١", "１", "1\\u0000", "+1", "01", "1.0", "1e0", "0x1", "--1", "1/", "/1", "1/0", "1/00", "1/-1", "", "-", "1/2/3", "½"] {
        malformed(F, &with(&q, bad, "0"), &format!("Q {:?}", bad));
    }
    // 9.5.2: zero in any spelling, unreduced fractions.
    accepted(F, &with(&s, "1", "-0"), "Z -0");
    for (a, b) in [("1", "-0"), ("1", "0/5"), ("1", "-0/5"), ("1/1", "0"), ("2/2", "-0/7"), ("-3/-3", "0")] {
        if a.contains("/-") {
            malformed(F, &with(&q, a, b), a);
        } else {
            accepted(F, &with(&q, a, b), &format!("Q {} {}", a, b));
        }
    }
    // 9.5.3: no fraction bar over Z and GF(p), not even "2/1" or "0/1".
    for ring in ["Z", "GF(2)", "GF(3)"] {
        let t = edit(&s, "\"ring\": \"Z\"", &format!("\"ring\": \"{}\"", ring));
        for frac in ["1/1", "2/1", "0/1", "-0/1"] {
            malformed(F, &with(&t, frac, "0"), &format!("{} {}", ring, frac));
        }
    }
    // 9.5.4: no size limit.
    let big = "123456789012345678901234567890123456789012345678901234567890";
    let lines = accepted(F, &with(&q, &format!("{}/{}", big, big), &format!("0/{}", big)), "huge fraction");
    assert_eq!(lines[0], "ANGENOMMEN 2x2x2-r7-strassen69 2x2x2 rank=7 ring=Q");
    let (code, lines) = run(&tmp_file(F, &with(&s, big, "0")));
    assert_eq!(code, 1, "huge integer makes the scheme wrong: {:?}", lines);
    assert!(lines[0].starts_with("ABGELEHNT "), "{:?}", lines);
}

#[test]
fn r9_6_rings() {
    let s = strassen_text();
    let with = |r: &str| edit(&s, "\"ring\": \"Z\"", &format!("\"ring\": \"{}\"", r));
    for bad in [
        "GF(02)", "GF( 2)", "GF(2 )", "gf(2)", "Gf(2)", "GF(2) ", " GF(2)", "z", "q", "R", "C", "", "GF()", "GF(2", "GF2",
        "GF[2]", "GF(+2)", "GF(-2)", "GF(0)", "GF(1)", "GF(4)", "GF(561)", "GF(3215031751)", "GF(２)", "Z ", "QQ", "GF(p)",
        "GF(2.0)", "GF(1e1)",
    ] {
        malformed(F, &with(bad), bad);
    }
    // 9.6.2: 2 <= p < 2^64, prime, deterministic test.
    for good in ["GF(2)", "GF(3)", "GF(5)", "GF(1000003)", "GF(18446744073709551557)", "Q"] {
        let lines = accepted(F, &with(good), good);
        assert_eq!(lines[0], format!("ANGENOMMEN 2x2x2-r7-strassen69 2x2x2 rank=7 ring={}", good));
    }
    for bad in [
        "GF(18446744073709551615)", // 2^64 - 1, composite
        "GF(18446744073709551616)", // 2^64
        "GF(18446744073709551629)", // 2^64 + 13, prime but too large
        "GF(340282366920938463463374607431768211507)",
    ] {
        malformed(F, &with(bad), bad);
    }
}

#[test]
fn r9_7_1_arguments() {
    let bin = env!("CARGO_BIN_EXE_pruefer");
    let p = data(F);
    for args in [vec![], vec![p.clone(), p.clone()], vec![p.clone(), PathBuf::from("x")]] {
        let out = Command::new(bin).args(&args).output().unwrap();
        assert_eq!(out.status.code(), Some(2), "{:?}", args);
        let text = String::from_utf8(out.stdout).unwrap();
        let lines: Vec<&str> = text.lines().collect();
        assert!(lines[0].starts_with("FEHLERHAFT - "), "{:?}", lines);
        assert_eq!(lines.len(), 1);
    }
}

#[test]
fn r9_7_2_unreadable_files() {
    let (code, lines) = run(Path::new("/nonexistent/2x2x2-r7-x.json"));
    assert_eq!(code, 2);
    assert!(lines[0].starts_with("FEHLERHAFT 2x2x2-r7-x.json "), "{:?}", lines);
    assert_eq!(lines.len(), 1);
    // A directory cannot be read as a file.
    let p = tmp_file("platzhalter", "");
    let dir = p.parent().unwrap().join("2x2x2-r7-ordner.json");
    std::fs::create_dir_all(&dir).unwrap();
    let (code, lines) = run(&dir);
    assert_eq!(code, 2, "{:?}", lines);
    assert!(lines[0].starts_with("FEHLERHAFT 2x2x2-r7-ordner.json "), "{:?}", lines);
    // Empty file.
    malformed(F, "", "empty file");
}

#[test]
fn r9_7_4_malformed_wins_over_wrong_equations() {
    // The wrong Strassen (2 violated equations) with an additional format
    // error is FEHLERHAFT, not ABGELEHNT, whatever the error is.
    let s = std::fs::read_to_string(data("2x2x2-r7-strassen69-falsch.json")).unwrap();
    let name = "2x2x2-r7-strassen69-falsch.json";
    let id = "\"id\": \"2x2x2-r7-strassen69-falsch\"";
    assert!(s.contains(id));
    let start = s.find("\"created\": \"").unwrap() + "\"created\": \"".len();
    let date = &s[start..start + 10];
    let cases = vec![
        s.replacen(&format!("\"created\": \"{}\"", date), "\"created\": \"2026-02-30\"", 1),
        s.replacen("\"source\": ", "\"extra\": \"x\", \"source\": ", 1),
        s.replacen("\"products\"", "\"claim\": \"\", \"products\"", 1),
        s.replacen("\"ring\": \"Z\"", "\"ring\": \"GF(4)\"", 1),
        s.replacen("\"-1\"", "\"-1/1\"", 1),
    ];
    for (i, t) in cases.iter().enumerate() {
        assert_ne!(t, &s, "case {} did not change the text", i);
        malformed(name, t, &format!("case {}", i));
    }
}

#[test]
fn r9_7_6_no_hints_when_malformed() {
    // Over Q with a zero product and a denominator, so that an accepted file
    // would carry two hint lines; a format error suppresses them.
    let good = "{\"format_version\":1,\"id\":\"1x1x1-r2-null\",\"n\":1,\"k\":1,\"m\":1,\"rank\":2,\"ring\":\"Q\",\
        \"origin\":{\"source\":\"s\",\"method\":\"m\",\"created\":\"2026-11-25\",\"created_by\":\"t\"},\
        \"products\":[{\"u\":[[\"2\"]],\"v\":[[\"1/2\"]],\"w\":[[\"1\"]]},{\"u\":[[\"0\"]],\"v\":[[\"5\"]],\"w\":[[\"7\"]]}]}";
    let lines = accepted("1x1x1-r2-null.json", good, "base");
    assert_eq!(lines.len(), 3, "{:?}", lines);
    malformed("1x1x1-r2-null.json", &good.replacen("2026-11-25", "2026-11-31", 1), "bad date");
    malformed("1x1x1-r2-null.json", &good.replacen("\"t\"}", "\"t\",\"x\":\"y\"}", 1), "origin key");
}

#[test]
fn r9_7_7_denominator_hint() {
    // Denominator 1000003 * 1000033 > 10^12: both primes are above the trial
    // division bound, so the hint must name the unfactored rest.
    let d = "1000036000099";
    let text = format!(
        "{{\"format_version\":1,\"id\":\"1x1x1-r1-gross\",\"n\":1,\"k\":1,\"m\":1,\"rank\":1,\"ring\":\"Q\",\
        \"origin\":{{\"source\":\"s\",\"method\":\"m\",\"created\":\"2026-11-25\",\"created_by\":\"t\"}},\
        \"products\":[{{\"u\":[[\"{d}\"]],\"v\":[[\"1/{d}\"]],\"w\":[[\"1\"]]}}]}}"
    );
    let lines = accepted("1x1x1-r1-gross.json", &text, "big denominator");
    assert!(lines.iter().any(|l| l.contains("nicht zerlegten Faktor 1000036000099")), "{:?}", lines);
    // Small denominators are listed completely.
    let text = text.replace(d, "360");
    let lines = accepted("1x1x1-r1-gross.json", &text, "small denominator");
    assert!(lines.iter().any(|l| l.starts_with("HINWEIS Nenner-Primteiler: 2, 3, 5 ")), "{:?}", lines);
    assert!(!lines.iter().any(|l| l.contains("nicht zerlegten")), "{:?}", lines);
}

#[test]
fn verfahren_files_of_the_project_accepted() {
    // The two Hopcroft-Kerr files from task A-10 (see the PR of S1-08).
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("../../verfahren");
    for (file, header) in [
        ("3x2x5-r25-hk71.json", "ANGENOMMEN 3x2x5-r25-hk71 3x2x5 rank=25 ring=Z"),
        ("3x2x6-r30-hk71.json", "ANGENOMMEN 3x2x6-r30-hk71 3x2x6 rank=30 ring=Z"),
    ] {
        let (code, lines) = run(&dir.join(file));
        assert_eq!(code, 0, "{} {:?}", file, lines);
        assert_eq!(lines[0], header);
    }
}
