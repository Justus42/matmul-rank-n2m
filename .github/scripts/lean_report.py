#!/usr/bin/env python3
"""Helper for .github/workflows/lean-project.yml (task S1-14).

Subcommands:
  gen-check LEAN_DIR OUT_FILE
      Write a Lean file that imports every module of the library under
      LEAN_DIR/YangBounds and, for each main theorem, runs `#print axioms`
      and logs one machine-readable line `AXIOM-RESULT|<name>|<axioms>`.
      Missing theorems are reported as `AXIOM-RESULT|<name>|MISSING`.
  sorry-report LEAN_DIR BUILD_LOG
      Print every `declaration uses 'sorry'` warning of the build log and every
      `sorry` token in the Lean sources outside comments.
  axiom-report CHECK_LOG
      Classify every main theorem: STANDARD (only propext, Classical.choice,
      Quot.sound), SORRY (depends on sorryAx), OTHER (further axioms) or
      MISSING. Prints a table, writes GitHub annotations and appends Markdown
      to the job summary. Never fails because of `sorry`.
"""
import os
import re
import sys
from pathlib import Path

# (label, fully qualified Lean name)
MAIN_THEOREMS = [
    ("Theorem 1 (Yang v3, R<3,2,m> >= ceil((24m+2)/5))", "YangBounds.yang_theorem_one"),
    ("Theorem 2 (Yang v3, R<n,2,m> >= (n+2)m+(n-3))", "YangBounds.yang_theorem_two"),
    ("Rank <3,2,6> = 30", "YangBounds.rank_three_two_six"),
    ("Rank <4,2,4> >= 25", "YangBounds.rank_four_two_four_ge"),
    ("Upper bound <3,2,6> <= 30 (Statements.lean)", "YangBounds.hopcroft_kerr_three_two_six"),
    ("Upper bound <3,2,6> <= 30 (Upper3x2x6.lean)", "YangBounds.Upper3x2x6.hopcroft_kerr_three_two_six"),
    ("Satz B <4,2,4>, length 25, unconditional (SatzB444Final.lean)", "YangBounds.SatzB444.satzB_unbedingt"),
    ("Satz B <4,2,4>, symmetric case, unconditional (SatzB444Final.lean)", "YangBounds.SatzB444.satzB_symm_unbedingt"),
    ("Satz B <4,2,4>, every field, unconditional (SatzB444Final.lean)", "YangBounds.SatzB444.satzB_global_unbedingt"),
    ("Satz E <4,2,4>, case (5,8): no sub-case A (SatzE444.lean)", "YangBounds.SatzE444.satzE"),
    ("Satz E <4,2,4>, every field (SatzE444.lean)", "YangBounds.SatzE444.satzE_global"),
    ("Only sub-case B, assuming Lemma P and non-symmetry (SatzE444Buendel.lean)", "YangBounds.SatzE444Buendel.nur_unterfallB"),
    ("Lemma P <4,2,4>, case (5,8), every infinite field (LemmaP444.lean)", "YangBounds.LemmaP444.lemmaP"),
    ("Only sub-case B, assuming non-symmetry, without Lemma P hypothesis (LemmaP444.lean)", "YangBounds.LemmaP444.nur_unterfallB'"),
    ("Only sub-case B, every field, without Lemma P hypothesis (LemmaP444.lean)", "YangBounds.LemmaP444.nur_unterfallB_global'"),
    ("Satz C <4,2,4>, algebraic core (SatzC444Kern.lean)", "YangBounds.SatzC444.satzC_kern"),
    ("Satz C <4,2,4>, generic point, length <= 25 (SatzC444Generisch.lean)", "YangBounds.SatzC444.satzC_generisch"),
    ("Folgerung C1 (R-C1) <4,2,4>, generic case (5,8) (SatzC444Generisch.lean)", "YangBounds.SatzC444.folgerungC1_generisch"),
    ("Final theorem R<4,2,4> >= 26, assuming bridge and sub-case B (Endsatz444.lean)", "YangBounds.Endsatz444.rank_four_two_four_ge_26_of"),
    ("Final theorem R<4,2,4> >= 26, hypotheses at one field (Endsatz444.lean)", "YangBounds.Endsatz444.rank_four_two_four_ge_26_of'"),
    ("Final theorem R<4,2,4> >= 26, alternative route over infinite fields (Endsatz444.lean)", "YangBounds.Endsatz444.rank_four_two_four_ge_26_of_unendlich"),
    ("Bridge <4,2,4>: (N1), (N2), (5,8), not symmetric over AlgebraicClosure K(S,T) (Bruecke444.lean)", "YangBounds.Bruecke444.bruecke"),
    ("Bridge <4,2,4>, existence over an algebraically closed field (Bruecke444.lean)", "YangBounds.Bruecke444.bruecke_exists"),
    ("Bridge <4,2,4>, applied: only sub-case B (Bruecke444.lean)", "YangBounds.Bruecke444.bruecke_unterfallB"),
    ("Bridge <4,2,4>, applied: no sub-case A (Bruecke444.lean)", "YangBounds.Bruecke444.bruecke_nicht_unterfallA"),
    ("Bridge as Endsatz444.BrueckeStatement, every field (Bruecke444.lean)", "YangBounds.Bruecke444.brueckeStatement"),
    ("Final theorem R<4,2,4> >= 26, bridge discharged, assuming sub-case B (Bruecke444.lean)", "YangBounds.Bruecke444.rank_four_two_four_ge_26_of_unterfallB"),
    ("Satz F <4,2,4>: sub-case B forces symmetry, assuming (B3') and (Z') (SatzF444.lean)", "YangBounds.SatzF444.satzF"),
    ("Case (5,8) symmetric, assuming (B3') and (Z') (SatzF444.lean)", "YangBounds.SatzF444.fall58_symmetrisch"),
    ("UnterfallBStatement, assuming (B3') and (Z') (SatzF444.lean)", "YangBounds.SatzF444.unterfallBStatement_of"),
    ("Final theorem R<4,2,4> >= 26, assuming only (B3') and (Z') (SatzF444.lean)", "YangBounds.SatzF444.rank_four_two_four_ge_26_of_hyp"),
    ("(B3') TransponiertEng at a normal form with TransN1, TransN2 (Transponiert444.lean)", "YangBounds.Transponiert444.transponiertEng_of"),
    ("TransN1 for the generic normal form genAlgL (Transponiert444.lean)", "YangBounds.Transponiert444.transN1_genAlgL"),
    ("TransN2 for the generic normal form genAlgL (Transponiert444.lean)", "YangBounds.Transponiert444.transN2_genAlgL"),
    ("(B3') TransponiertEng for genAlgL, no hypothesis (Transponiert444.lean)", "YangBounds.Transponiert444.transponiertEng_genAlgL"),
    ("No decomposition of length 25, assuming only (Z') at genAlgL (Transponiert444.lean)", "YangBounds.Transponiert444.keine_zerlegung_25_of_vielePunkte"),
    ("Final theorem R<4,2,4> >= 26, assuming only (Z') at genAlgL (Transponiert444.lean)", "YangBounds.Transponiert444.rank_four_two_four_ge_26_of_vielePunkte"),
    ("Final theorem R<4,2,4> >= 26, assuming only (Z') at normal forms (Transponiert444.lean)", "YangBounds.Transponiert444.rank_four_two_four_ge_26_of_hyp'"),
    ("Final theorem R<4,2,4> >= 26, no hypothesis (Transponiert444.lean with LemmaZ444.lean)", "YangBounds.Transponiert444.rank_four_two_four_ge_26"),
    ("Lemma Z <4,2,4>: 13 distinct points at the generic normal form, assuming Lemma K (LemmaZ444.lean)", "YangBounds.LemmaZ444.lemmaZ_generisch"),
    ("Lemma Z <4,2,4>: 13 distinct points at the normal form of the bridge, assuming Lemma K (LemmaZ444.lean)", "YangBounds.LemmaZ444.lemmaZ_bruecke"),
    ("No decomposition of length 25, assuming Lemma K and (B3') (LemmaZ444.lean)", "YangBounds.LemmaZ444.keine_zerlegung_25_of_lemmaK"),
    ("Final theorem R<4,2,4> >= 26, assuming Lemma K and (B3') for the bridge normal form (LemmaZ444.lean)", "YangBounds.LemmaZ444.rank_four_two_four_ge_26_of_lemmaK"),
    ("Final theorem R<4,2,4> >= 26, assuming Lemma K and (B3') at all normal forms (LemmaZ444.lean)", "YangBounds.LemmaZ444.rank_four_two_four_ge_26_of_lemmaK_transponiert"),
    ("Lemma Z <4,2,4>: 13 distinct points at the bridge normal form, unconditional (LemmaZ444.lean)", "YangBounds.LemmaZ444.lemmaZ_bruecke_unbedingt"),
    ("Final theorem R<4,2,4> >= 26, assuming only (B3') for the bridge normal form (LemmaZ444.lean)", "YangBounds.LemmaZ444.rank_four_two_four_ge_26_of_transponiertEng"),
    ("Final theorem R<4,2,4> >= 26, assuming only (B3') at all normal forms (LemmaZ444.lean)", "YangBounds.LemmaZ444.rank_four_two_four_ge_26_of_transponiertEng'"),
    ("Lemma K: two factorisations of (Xp)x(Yp), every field (LemmaK444.lean)", "YangBounds.LemmaK444.lemmaK"),
    ("Lemma K: cases (i) and (ii) exclude each other (LemmaK444.lean)", "YangBounds.LemmaK444.lemmaK_exklusiv"),
    ("Folgerung K1: at most two orbits, every field (LemmaK444.lean)", "YangBounds.LemmaK444.folgerungK1"),
    ("LemmaKStatement, every field (LemmaK444.lean)", "YangBounds.LemmaK444.lemmaKStatement"),
    ("FolgerungK1Statement, every field (LemmaK444.lean)", "YangBounds.LemmaK444.folgerungK1Statement"),
    ("Lemma K at the generic point over GField K (LemmaK444.lean)", "YangBounds.LemmaK444.lemmaK_generisch"),
    ("Lemma K at the generic point over GBar K (LemmaK444.lean)", "YangBounds.LemmaK444.lemmaK_generischL"),
    ("Folgerung K1 at the generic point over GField K (LemmaK444.lean)", "YangBounds.LemmaK444.folgerungK1_generisch"),
    ("Folgerung K1 at the generic point over GBar K (LemmaK444.lean)", "YangBounds.LemmaK444.folgerungK1_generischL"),
    # S4-09: single axiom report for the lemmas of the 3x2x7 basis (B-018, B-019).
    ("Lemma 15(b), abstract core (YangN4Haupt.lean)", "YangBounds.YangN4Haupt.lemma15b_core"),
    ("Lemma 15(b): rk L = d*rho implies rho = m (YangN4Haupt.lean)", "YangBounds.YangN4Haupt.lemma15b"),
    ("Lemma I: rk L + min(2, dim N) <= 2 rk H (YangN3Teil3.lean)", "YangBounds.YangN3Teil3.lemma_I"),
]
STANDARD = {"propext", "Classical.choice", "Quot.sound"}


def summary(text: str) -> None:
    path = os.environ.get("GITHUB_STEP_SUMMARY")
    if path:
        with open(path, "a", encoding="utf-8") as f:
            f.write(text + "\n")


def modules(lean_dir: Path) -> list[str]:
    # The root module `YangBounds` is not a build target (lakefile glob
    # `YangBounds.+` covers only submodules), so import every submodule instead.
    mods = []
    for p in sorted((lean_dir / "YangBounds").rglob("*.lean")):
        rel = p.relative_to(lean_dir).with_suffix("")
        mods.append(".".join(rel.parts))
    return mods


def gen_check(lean_dir: Path, out: Path) -> None:
    lines = [f"import {m}" for m in modules(lean_dir)]
    lines += ["", "open Lean Elab Command", "", "run_cmd do", "  let env ← getEnv"]
    for _, name in MAIN_THEOREMS:
        lines += [
            f"  if env.contains `{name} then",
            f"    elabCommand (← `(#print axioms $(mkIdent `{name})))",
            f"    let axs ← collectAxioms `{name}",
            f"    logInfo m!\"AXIOM-RESULT|{name}|{{\", \".intercalate (axs.toList.map toString)}}\"",
            "  else",
            f"    logInfo m!\"AXIOM-RESULT|{name}|MISSING\"",
        ]
    out.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(out.read_text(encoding="utf-8"))


def strip_comments(src: str) -> str:
    """Remove Lean comments (nested block comments and line comments) and
    string literals, keeping newlines so that line numbers stay correct."""
    out, i, depth, n = [], 0, 0, len(src)
    while i < n:
        two = src[i:i + 2]
        if depth == 0 and two == "--":
            j = src.find("\n", i)
            j = n if j < 0 else j
            i = j
            continue
        if two == "/-":
            depth += 1
            i += 2
            continue
        if depth > 0 and two == "-/":
            depth -= 1
            i += 2
            continue
        if depth == 0 and src[i] == '"':
            j = i + 1
            while j < n and src[j] != '"':
                j += 2 if src[j] == "\\" else 1
            i = j + 1
            continue
        ch = src[i]
        out.append(ch if (depth == 0 or ch == "\n") else " ")
        i += 1
    return "".join(out)


def sorry_report(lean_dir: Path, build_log: Path) -> None:
    log = build_log.read_text(encoding="utf-8", errors="replace")
    warns = []
    for line in log.splitlines():
        if "declaration uses 'sorry'" in line:
            m = re.search(r"([\w./-]+\.lean):(\d+):(\d+)", line)
            loc = f"lean/{os.path.normpath(m.group(1))}:{m.group(2)}" if m else line.strip()
            if loc not in warns:
                warns.append(loc)
    tokens = []
    for p in sorted(list(lean_dir.glob("*.lean")) + list((lean_dir / "YangBounds").rglob("*.lean"))):
        code = strip_comments(p.read_text(encoding="utf-8"))
        for k, line in enumerate(code.splitlines(), 1):
            if re.search(r"(?<![\w.'])sorry(?![\w'])", line):
                tokens.append(f"lean/{p.relative_to(lean_dir)}:{k}")
    print("=" * 72)
    print(f"SORRY: {len(warns)} declaration(s) with 'declaration uses sorry' in the build log")
    for w in warns:
        print(f"  {w}")
    print(f"SORRY: {len(tokens)} 'sorry' token(s) in the sources outside comments")
    for t in tokens:
        print(f"  {t}")
    print("=" * 72)
    for w in warns:
        print(f"::warning::declaration uses sorry: {w}")
    md = [f"### `sorry`: {len(warns)} declaration(s) in build, {len(tokens)} token(s) in sources", ""]
    if warns:
        md += ["Build warnings `declaration uses 'sorry'`:", ""] + [f"- `{w}`" for w in warns] + [""]
    if tokens:
        md += ["`sorry` in sources (outside comments):", ""] + [f"- `{t}`" for t in tokens] + [""]
    summary("\n".join(md))


def axiom_report(check_log: Path) -> None:
    log = check_log.read_text(encoding="utf-8", errors="replace")
    found = {}
    for m in re.finditer(r"AXIOM-RESULT\|([^|\n]+)\|([^\n]*)", log):
        found[m.group(1).strip()] = m.group(2).strip()
    rows, counts = [], {}
    for label, name in MAIN_THEOREMS:
        raw = found.get(name)
        if raw is None or raw == "MISSING":
            status, axs, note = "MISSING", [], "theorem not found in the environment"
        else:
            axs = sorted({a.strip() for a in raw.split(",") if a.strip()})
            extra = [a for a in axs if a not in STANDARD and a != "sorryAx"]
            if extra:
                status, note = "OTHER", "non-standard axioms: " + ", ".join(extra)
            elif "sorryAx" in axs:
                status, note = "SORRY", "depends on sorryAx (open proof)"
            else:
                status, note = "STANDARD", "only propext, Classical.choice, Quot.sound"
        counts[status] = counts.get(status, 0) + 1
        rows.append((label, name, status, axs, note))
    icon = {"STANDARD": "✅", "SORRY": "⚠️", "OTHER": "❌", "MISSING": "❌"}
    print("=" * 72)
    print("AXIOM RESULT PER MAIN THEOREM")
    for label, name, status, axs, note in rows:
        print(f"  [{status:8s}] {name}")
        print(f"             {label}")
        print(f"             axioms: {axs}  -- {note}")
    print("TOTAL: " + ", ".join(f"{k}={v}" for k, v in sorted(counts.items())))
    print("=" * 72)
    for label, name, status, axs, note in rows:
        if status == "SORRY":
            print(f"::warning title=SORRY {name}::{label}: {note}")
        elif status in ("OTHER", "MISSING"):
            print(f"::error title={status} {name}::{label}: {note}")
        else:
            print(f"::notice title=STANDARD {name}::{label}: {note}")
    md = ["### Axioms of the main theorems", "",
          "| | Result | Theorem | Lean name | Axioms |", "|---|---|---|---|---|"]
    for label, name, status, axs, note in rows:
        md.append(f"| {icon[status]} | **{status}** | {label} | `{name}` | {', '.join(f'`{a}`' for a in axs) or '–'} |")
    md += ["", "STANDARD = only `propext`, `Classical.choice`, `Quot.sound`. "
           "SORRY = additionally `sorryAx`. OTHER = further axioms. MISSING = name not found.", ""]
    summary("\n".join(md))


def main() -> None:
    cmd, args = sys.argv[1], sys.argv[2:]
    if cmd == "gen-check":
        gen_check(Path(args[0]), Path(args[1]))
    elif cmd == "sorry-report":
        sorry_report(Path(args[0]), Path(args[1]))
    elif cmd == "axiom-report":
        axiom_report(Path(args[0]))
    else:
        sys.exit(f"unknown command {cmd}")


if __name__ == "__main__":
    main()
