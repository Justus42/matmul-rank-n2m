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
    expect_malformed(f, &s.replacen("\"created_by\"", "\"created_von\"", 1), "created_by");
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
