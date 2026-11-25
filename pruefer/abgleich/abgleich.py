#!/usr/bin/env python3
"""Run both verifiers on every shared test case and compare them (task S1-20).

Both programs are used only as finished command-line tools; nothing is changed.

    cd pruefer/rust && cargo build --release      # once
    python3 pruefer/abgleich/gen_cases.py         # (re)creates faelle/
    python3 pruefer/abgleich/abgleich.py          # writes ergebnis.tsv and ergebnis.md

Compared per case (verfahren/README.md 9.7.5): first word of the first line and
exit code, against each other and against the expectation from the format.
Additional checks, reported but not part of the 9.7.5 comparison:
  - ANGENOMMEN: the whole first line is identical in both programs (9.7.5)
  - second word is the file name (FEHLERHAFT, 9.7.3) or the id (otherwise)
  - FEHLERHAFT output has exactly one line (9.7.6)
Exit code of this script: 0 if both programs agree with each other and with the
expectation on every case, 1 otherwise.
"""

import argparse
import os
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
CASES = os.path.join(HERE, "faelle")
DEFAULT_PY = os.path.join(HERE, "..", "python", "pruefer.py")
DEFAULT_RS = os.path.join(HERE, "..", "rust", "target", "release", "pruefer")
VERFAHREN = os.path.join(HERE, "..", "..", "verfahren")
EXIT = {"ANGENOMMEN": 0, "ABGELEHNT": 1, "FEHLERHAFT": 2}
TIMEOUT = 300


def run(cmd, cwd=None, stdout=subprocess.PIPE):
    try:
        p = subprocess.run(cmd, stdout=stdout, stderr=subprocess.PIPE, cwd=cwd, timeout=TIMEOUT)
    except subprocess.TimeoutExpired:
        return {"code": "TIMEOUT", "out": b"", "err": b""}
    return {"code": p.returncode, "out": p.stdout or b"", "err": p.stderr or b""}


def first_word(res):
    line = res["out"].split(b"\n", 1)[0].decode("utf-8", "replace")
    return line.split(" ", 1)[0] if line else "(leer)", line


def side_checks(res, word, line, fname):
    """Return a list of short problem tags for the extra checks."""
    probs = []
    if word not in EXIT:
        return probs
    parts = line.split(" ")
    second = parts[1] if len(parts) > 1 else ""
    if fname is not None:
        want = fname if word == "FEHLERHAFT" else fname[:-5] if fname.endswith(".json") else fname
        if second != want:
            probs.append("2. Wort ≠ %s" % ("Dateiname" if word == "FEHLERHAFT" else "id"))
    hints = [l for l in res["out"].split(b"\n")[1:] if l.startswith(b"HINWEIS")]
    if word in ("ANGENOMMEN", "ABGELEHNT"):
        res["hints"] = bool(hints)
    if word == "FEHLERHAFT":
        rest = res["out"].split(b"\n", 1)[1] if b"\n" in res["out"] else b""
        if rest.strip(b"\n"):
            probs.append("mehr als 1 Zeile")
    return probs


def load_cases():
    cases = []
    with open(os.path.join(CASES, "LISTE.tsv"), encoding="utf-8") as f:
        for ln in f:
            if ln.startswith("#") or not ln.strip():
                continue
            name, rule, exp, _code, rel, desc = ln.rstrip("\n").split("\t")
            cases.append({"name": name, "rule": rule, "exp": exp, "desc": desc,
                          "args": [os.path.join(CASES, rel)], "fname": os.path.basename(rel)})
    # the project's own procedure files, used directly so the check follows main
    for fn in sorted(os.listdir(VERFAHREN)):
        if fn.endswith(".json"):
            cases.insert(0, {"name": "verfahren/" + fn, "rule": "7", "exp": "ANGENOMMEN",
                             "desc": "Projektdatei unter verfahren/",
                             "args": [os.path.join(VERFAHREN, fn)], "fname": fn})
    return cases


def special_cases(tmp):
    """Cases that are invocations rather than files (9.7.1, 9.7.2, 9.7.3)."""
    strassen = os.path.join(CASES, "strassen-z", "2x2x2-r7-strassen69.json")
    d = os.path.join(tmp, "ordner.json")
    os.mkdir(d)
    badname = os.path.join(tmp.encode(), b"2x2x2-r7-stra\xffssen.json")
    with open(strassen, "rb") as src, open(badname, "wb") as dst:
        dst.write(src.read())
    nl = os.path.join(tmp, "2x2x2-r7-a\nb.json")
    with open(strassen, "rb") as src, open(nl, "wb") as dst:
        dst.write(src.read())
    return [
        {"name": "aufruf-ohne-argument", "rule": "9.7.1", "exp": "FEHLERHAFT", "args": [],
         "fname": "-", "desc": "kein Argument"},
        {"name": "aufruf-zwei-argumente", "rule": "9.7.1", "exp": "FEHLERHAFT",
         "args": [strassen, strassen], "fname": "-", "desc": "zwei Argumente"},
        {"name": "aufruf-leeres-argument", "rule": "9.7.2", "exp": "FEHLERHAFT", "args": [""],
         "fname": None, "desc": "ein leeres Argument"},
        {"name": "datei-fehlt", "rule": "9.7.2", "exp": "FEHLERHAFT",
         "args": [os.path.join(tmp, "2x2x2-r7-fehlt.json")], "fname": "2x2x2-r7-fehlt.json",
         "desc": "Datei existiert nicht"},
        {"name": "datei-ist-ordner", "rule": "9.7.2", "exp": "FEHLERHAFT", "args": [d],
         "fname": "ordner.json", "desc": "Pfad ist ein Ordner"},
        {"name": "pfad-relativ", "rule": "9.7.3", "exp": "ANGENOMMEN",
         "args": ["2x2x2-r7-strassen69.json"], "cwd": os.path.dirname(strassen),
         "fname": "2x2x2-r7-strassen69.json", "desc": "Aufruf mit Dateiname ohne Ordner"},
        {"name": "pfad-mit-punkten", "rule": "9.7.3", "exp": "ANGENOMMEN",
         "args": [os.path.join(CASES, "strassen-z", "..", "strassen-z", "2x2x2-r7-strassen69.json")],
         "fname": "2x2x2-r7-strassen69.json", "desc": "Pfad mit .."},
        {"name": "dateiname-kein-utf8", "rule": "9.4.1", "exp": "FEHLERHAFT", "args": [badname],
         "fname": None, "desc": "Dateiname mit Byte 0xFF (kein UTF-8), Inhalt Strassen"},
        {"name": "dateiname-zeilenvorschub", "rule": "9.7.6", "exp": "FEHLERHAFT", "args": [nl],
         "fname": None, "desc": "Dateiname mit Zeilenvorschub, Inhalt Strassen"},
    ]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--python", default=DEFAULT_PY)
    ap.add_argument("--rust", default=DEFAULT_RS)
    a = ap.parse_args()
    py = [sys.executable, os.path.abspath(a.python)]
    rs = [os.path.abspath(a.rust)]

    rows = []
    with tempfile.TemporaryDirectory() as tmp:
        for c in load_cases() + special_cases(tmp):
            res = {}
            for tag, cmd in (("py", py), ("rs", rs)):
                r = run(cmd + c["args"], cwd=c.get("cwd"))
                w, line = first_word(r)
                r["word"], r["line"] = w, line
                r["side"] = side_checks(r, w, line, c["fname"])
                res[tag] = r
            p, r = res["py"], res["rs"]
            exp_code = EXIT[c["exp"]]
            same = (p["word"], p["code"]) == (r["word"], r["code"])
            if p["word"] == "ANGENOMMEN" and r["word"] == "ANGENOMMEN" and p["line"] != r["line"]:
                same = False
            ok_p = (p["word"], p["code"]) == (c["exp"], exp_code)
            ok_r = (r["word"], r["code"]) == (c["exp"], exp_code)
            if same and ok_p:
                verdict = "gleich"
            elif same:
                verdict = "BEIDE ≠ ERWARTUNG"
            else:
                verdict = "ABWEICHUNG"
            side = []
            for tag, x in (("Py", p), ("Rs", r)):
                side += ["%s: %s" % (tag, s) for s in x["side"]]
            if "hints" in p and "hints" in r and p["hints"] != r["hints"]:
                side.append("Hinweiszeilen nur bei %s" % ("Python" if p["hints"] else "Rust"))
            rows.append((c, p, r, verdict, ok_p, ok_r, side))

    with open(os.path.join(HERE, "ergebnis.tsv"), "w", encoding="utf-8") as f:
        f.write("# case\trule\texpected\tpy_word\tpy_exit\trs_word\trs_exit\tverdict\tside_checks\n")
        for c, p, r, v, _, _, side in rows:
            f.write("\t".join([c["name"], c["rule"], c["exp"], p["word"], str(p["code"]),
                               r["word"], str(r["code"]), v, "; ".join(side)]) + "\n")

    def cell(x, ok):
        s = "%s %s" % (x["word"], x["code"])
        return s if ok else "**%s**" % s

    md = ["| Nr. | Fall | Regel | Erwartung | Python | Rust | Ergebnis | Nebenprüfungen |",
          "|---|---|---|---|---|---|---|---|"]
    for i, (c, p, r, v, okp, okr, side) in enumerate(rows, 1):
        md.append("| %d | `%s` %s | %s | %s %d | %s | %s | %s | %s |" % (
            i, c["name"], c["desc"].replace("|", "\\|"), c["rule"], c["exp"], EXIT[c["exp"]],
            cell(p, okp), cell(r, okr), v, "; ".join(side).replace("|", "\\|")))
    with open(os.path.join(HERE, "ergebnis.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(md) + "\n")

    # Behaviour when the output cannot be written (internal-error probe, not
    # fixed by the format; see BERICHT.md). Informational only.
    probes = []
    for c in ("strassen-z", "strassen-vorzeichen", "zusatz-oben"):
        f = os.path.join(CASES, c, os.listdir(os.path.join(CASES, c))[0])
        row = [c]
        for cmd in (py, rs):
            with open("/dev/full", "wb") as full:
                row.append(run(cmd + [f], stdout=full)["code"])
            p2 = subprocess.run(cmd + [f], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                                close_fds=True, pass_fds=(), preexec_fn=lambda: os.close(1))
            row.append(p2.returncode)
        probes.append(row)
    with open(os.path.join(HERE, "ergebnis-ausgabefehler.md"), "w", encoding="utf-8") as f:
        f.write("| Fall | Python, Ausgabe /dev/full | Python, Ausgabe geschlossen "
                "| Rust, Ausgabe /dev/full | Rust, Ausgabe geschlossen |\n|---|---|---|---|---|\n")
        for row in probes:
            f.write("| `%s` | %s | %s | %s | %s |\n" % tuple(row))

    n = len(rows)
    n_same = sum(1 for x in rows if x[3] == "gleich")
    print("%d Fälle, %d gleich und wie erwartet, %d Abweichungen, %d beide anders als erwartet"
          % (n, n_same, sum(1 for x in rows if x[3] == "ABWEICHUNG"),
             sum(1 for x in rows if x[3] == "BEIDE ≠ ERWARTUNG")))
    for c, p, r, v, okp, okr, side in rows:
        if v != "gleich" or side:
            print("%-28s %-6s erw=%s | py=%s %s | rs=%s %s | %s | %s" % (
                c["name"], c["rule"], c["exp"], p["word"], p["code"], r["word"], r["code"], v,
                "; ".join(side)))
    return 0 if n_same == n else 1


if __name__ == "__main__":
    sys.exit(main())
