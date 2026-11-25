#!/usr/bin/env python3
"""Generate the shared test files for the cross-check of both verifiers (task S1-20).

Every case lives in its own directory faelle/<case>/ and contains exactly one
procedure file, because the file name is part of what is checked (id must equal
the file name). The list of cases with the expectation according to
verfahren/README.md is written to faelle/LISTE.tsv.

Expectation = what the format (verfahren/README.md, sections 6 and 9) demands:
ANGENOMMEN (exit 0), ABGELEHNT (exit 1) or FEHLERHAFT (exit 2).

Run from anywhere: python3 gen_cases.py   (rewrites faelle/ completely)
"""

import copy
import json
import os
import re
import shutil

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "faelle")

EXIT = {"ANGENOMMEN": 0, "ABGELEHNT": 1, "FEHLERHAFT": 2}

# Strassen exactly as in verfahren/README.md section 7.
STRASSEN_PRODUCTS = [
    {"u": [["1", "0"], ["0", "1"]], "v": [["1", "0"], ["0", "1"]], "w": [["1", "0"], ["0", "1"]]},
    {"u": [["0", "0"], ["1", "1"]], "v": [["1", "0"], ["0", "0"]], "w": [["0", "0"], ["1", "-1"]]},
    {"u": [["1", "0"], ["0", "0"]], "v": [["0", "1"], ["0", "-1"]], "w": [["0", "1"], ["0", "1"]]},
    {"u": [["0", "0"], ["0", "1"]], "v": [["-1", "0"], ["1", "0"]], "w": [["1", "0"], ["1", "0"]]},
    {"u": [["1", "1"], ["0", "0"]], "v": [["0", "0"], ["0", "1"]], "w": [["-1", "1"], ["0", "0"]]},
    {"u": [["-1", "0"], ["1", "0"]], "v": [["1", "1"], ["0", "0"]], "w": [["0", "0"], ["0", "1"]]},
    {"u": [["0", "1"], ["0", "-1"]], "v": [["0", "0"], ["1", "1"]], "w": [["1", "0"], ["0", "0"]]},
]

ORIGIN = {
    "source": "V. Strassen, Gaussian elimination is not optimal, Numer. Math. 13 (1969), 354-356",
    "method": "von Hand übertragen",
    "created": "2026-11-25",
    "created_by": "Prüfer, S1-20 (Abgleich)",
}


def strassen(ring="Z", kurz="strassen69"):
    return {
        "format_version": 1,
        "id": "2x2x2-r7-" + kurz,
        "n": 2, "k": 2, "m": 2,
        "rank": 7,
        "ring": ring,
        "origin": dict(ORIGIN),
        "products": copy.deepcopy(STRASSEN_PRODUCTS),
    }


def naive(n, k, m, ring="Z", kurz="naiv"):
    """Standard algorithm with n*k*m products."""
    prods = []
    for i in range(n):
        for j in range(k):
            for l in range(m):
                u = [["0"] * k for _ in range(n)]
                v = [["0"] * m for _ in range(k)]
                w = [["0"] * m for _ in range(n)]
                u[i][j] = "1"
                v[j][l] = "1"
                w[i][l] = "1"
                prods.append({"u": u, "v": v, "w": w})
    r = len(prods)
    return {
        "format_version": 1,
        "id": "%dx%dx%d-r%d-%s" % (n, k, m, r, kurz),
        "n": n, "k": k, "m": m, "rank": r, "ring": ring,
        "origin": {"source": "eigene Suche", "method": "Schulmethode, Testfall S1-20",
                   "created": "2026-11-25", "created_by": "Prüfer, S1-20 (Abgleich)"},
        "products": prods,
    }


def one(coef="1", ring="Z", kurz="eins"):
    return {
        "format_version": 1, "id": "1x1x1-r1-" + kurz, "n": 1, "k": 1, "m": 1, "rank": 1,
        "ring": ring,
        "origin": {"source": "eigene Suche", "method": "Testfall S1-20",
                   "created": "2026-11-25", "created_by": "Prüfer, S1-20 (Abgleich)"},
        "products": [{"u": [[coef]], "v": [["1"]], "w": [["1"]]}],
    }


def dump(obj):
    return (json.dumps(obj, ensure_ascii=False, indent=1) + "\n").encode("utf-8")


def raw_with(obj, old, new, count=1):
    """Serialise and then replace a text fragment (for things json.dumps cannot write)."""
    text = json.dumps(obj, ensure_ascii=False, indent=1) + "\n"
    assert text.count(old) >= count, (old, text[:200])
    return text.replace(old, new, count).encode("utf-8")


CASES = []  # (name, rule, expected, filename, bytes, description)


def add(name, rule, expected, filename, data, desc):
    assert expected in EXIT
    assert all(c[0] != name for c in CASES), name
    if isinstance(data, dict):
        data = dump(data)
    CASES.append((name, rule, expected, filename, data, desc))


S = "2x2x2-r7-strassen69.json"


def mod(fn, ring="Z", kurz="strassen69"):
    d = strassen(ring, kurz)
    fn(d)
    return d


# ---------------------------------------------------------------- correct procedures
add("strassen-z", "7", "ANGENOMMEN", S, strassen(), "Strassen wie in Abschnitt 7")
add("strassen-q", "4", "ANGENOMMEN", S, strassen("Q"), "Strassen über Q")
add("strassen-gf2", "4", "ANGENOMMEN", S, strassen("GF(2)"), "Strassen über GF(2)")
add("strassen-gf3", "4", "ANGENOMMEN", S, strassen("GF(3)"), "Strassen über GF(3)")
add("strassen-gf-gross", "9.6.2", "ANGENOMMEN", S, strassen("GF(18446744073709551557)"),
    "Strassen über GF(2^64-59), größte Primzahl unter 2^64")
add("strassen-gf-m61", "9.6.2", "ANGENOMMEN", S, strassen("GF(2305843009213693951)"),
    "Strassen über GF(2^61-1)")


def halves(d):
    # scale u of M1 by 2 and w of M1 by 1/2: still correct over Q, denominators 2
    d["products"][0]["u"] = [["2", "0"], ["0", "2"]]
    d["products"][0]["w"] = [["1/2", "0"], ["0", "1/2"]]


add("strassen-q-brueche", "4", "ANGENOMMEN", S, mod(halves, "Q"),
    "Strassen über Q, M1 mit u·2 und w·1/2, Nenner 2")


def big_q(d):
    # u * 10^5000, w / 10^5000 (rule 9.5.4: no size limit)
    big = "1" + "0" * 5000
    d["products"][0]["u"] = [[big, "0"], ["0", big]]
    d["products"][0]["w"] = [["1/" + big, "0"], ["0", "1/" + big]]


add("strassen-q-riesig", "9.5.4", "ANGENOMMEN", S, mod(big_q, "Q"),
    "Strassen über Q, M1 mit Faktor 10^5000 und 1/10^5000 (5001 Stellen)")


def big_z(d):
    # 8th product cancelling a huge 7th one is not needed; just add the huge
    # coefficient twice with opposite signs in two extra-zero places:
    big = "1" + "0" * 5000
    d["products"].append({"u": [[big, "0"], ["0", "0"]], "v": [["1", "0"], ["0", "0"]],
                          "w": [["1", "0"], ["0", "0"]]})
    d["products"].append({"u": [["-" + big, "0"], ["0", "0"]], "v": [["1", "0"], ["0", "0"]],
                          "w": [["1", "0"], ["0", "0"]]})
    d["rank"] = 9
    d["id"] = "2x2x2-r9-riesig"


add("strassen-z-riesig", "9.5.4", "ANGENOMMEN", "2x2x2-r9-riesig.json", mod(big_z),
    "Strassen über Z plus zwei Produkte mit ±10^5000, die sich aufheben")


def nenner_q(d):
    # two big primes 1000003 * 1000033 as denominator (rule 9.7.7)
    p = 1000003 * 1000033
    d["products"][0]["u"] = [[str(p), "0"], ["0", str(p)]]
    d["products"][0]["w"] = [["1/%d" % p, "0"], ["0", "1/%d" % p]]


add("strassen-q-nenner-gross", "9.7.7", "ANGENOMMEN", S, mod(nenner_q, "Q"),
    "Strassen über Q, Nenner 1000003·1000033 (Hinweis Primteiler)")


def zero_forms(d):
    # replace zeros of M3.u by the other spellings of zero (9.5.2) and 1 by "1/1"
    d["products"][2]["u"] = [["1/1", "-0"], ["0/5", "-0/5"]]
    d["products"][1]["w"] = [["0", "-0"], ["2/2", "-1/1"]]


add("strassen-q-nullformen", "9.5.2", "ANGENOMMEN", S, mod(zero_forms, "Q"),
    "Strassen über Q mit -0, 0/5, -0/5, 1/1, 2/2")


def zero_forms_z(d):
    d["products"][2]["u"] = [["1", "-0"], ["0", "-0"]]


add("strassen-z-minusnull", "9.5.2", "ANGENOMMEN", S, mod(zero_forms_z),
    "Strassen über Z mit -0")


def zero_product(d):
    d["products"].append({"u": [["0", "0"], ["0", "0"]], "v": [["1", "0"], ["0", "1"]],
                          "w": [["1", "1"], ["1", "1"]]})
    d["rank"] = 8
    d["id"] = "2x2x2-r8-nullprodukt"


add("strassen-nullprodukt", "6", "ANGENOMMEN", "2x2x2-r8-nullprodukt.json", mod(zero_product),
    "Strassen plus ein Produkt mit u ganz null (Hinweiszeile)")

add("naiv-2x2x2", "7", "ANGENOMMEN", "2x2x2-r8-naiv.json", naive(2, 2, 2), "Schulmethode 2x2x2")
add("naiv-3x2x5", "7", "ANGENOMMEN", "3x2x5-r30-naiv.json", naive(3, 2, 5), "Schulmethode 3x2x5")
add("naiv-1x3x2-q", "4", "ANGENOMMEN", "1x3x2-r6-naiv.json", naive(1, 3, 2, "Q"),
    "Schulmethode 1x3x2 über Q, k ungleich 2")
add("eins-z", "7", "ANGENOMMEN", "1x1x1-r1-eins.json", one(), "1x1x1 mit einem Produkt")
add("eins-gf2-drei", "4", "ANGENOMMEN", "1x1x1-r1-eins.json", one("3", "GF(2)"),
    "1x1x1 über GF(2), Koeffizient 3 ≡ 1")
add("eins-gf5-minusvier", "4", "ANGENOMMEN", "1x1x1-r1-eins.json", one("-4", "GF(5)"),
    "1x1x1 über GF(5), Koeffizient -4 ≡ 1")


def sign_gf2(d):
    d["products"][1]["w"] = [["0", "0"], ["1", "1"]]


add("strassen-gf2-vorzeichen", "4", "ANGENOMMEN", S, mod(sign_gf2, "GF(2)"),
    "Vorzeichenfehler aus Abschnitt 7 über GF(2): -1 ≡ 1, also richtig")

# optional fields, escapes, whitespace
d = strassen()
d["claim"] = "B-999"
d["notes"] = "Testfall mit allen optionalen Feldern"
d["origin"]["derived_from"] = "2x2x2-r7-strassen69"
add("optional-alle", "9.2.3", "ANGENOMMEN", S, d, "claim, notes und derived_from gesetzt")

d = strassen()
d["notes"] = " "
add("notes-nbsp", "9.2.4", "ANGENOMMEN", S, d,
    "notes nur aus geschütztem Leerzeichen U+00A0 (nicht eines der vier Leerraumzeichen)")

add("escape-koeffizient", "9.1.4", "ANGENOMMEN", S,
    raw_with(strassen(), '"1"', '"\\u0031"'), 'Koeffizient als "\\u0031"')
add("escape-schluessel", "9.1.4", "ANGENOMMEN", S,
    raw_with(strassen(), '"u":', '"\\u0075":'), 'Schlüssel "\\u0075" statt "u"')
d = strassen()
d["notes"] = "Emoji \U0001F600 als Paar"
add("surrogat-paar", "9.1.3", "ANGENOMMEN", S,
    raw_with(d, "\U0001F600", "\\ud83d\\ude00"), "gültiges Surrogat-Paar in notes")
add("leerraum-danach", "9.1.1", "ANGENOMMEN", S, dump(strassen()) + b" \t\r\n\n",
    "Leerraum nach dem JSON-Wert")
add("kompakt", "9.1.1", "ANGENOMMEN", S,
    json.dumps(strassen(), separators=(",", ":")).encode(), "JSON ohne jeden Leerraum")

for name, date, exp, desc in [
    ("datum-zukunft", "2099-12-31", "ANGENOMMEN", "Datum in der Zukunft"),
    ("datum-schalttag", "2024-02-29", "ANGENOMMEN", "Schalttag 2024"),
    ("datum-2000-02-29", "2000-02-29", "ANGENOMMEN", "Schalttag 2000 (durch 400 teilbar)"),
    ("datum-0001", "0001-01-01", "ANGENOMMEN", "kleinstes Jahr 0001"),
    ("datum-9999", "9999-12-31", "ANGENOMMEN", "größtes Datum"),
    ("datum-1900-02-29", "1900-02-29", "FEHLERHAFT", "kein Schalttag 1900"),
    ("datum-02-30", "2026-02-30", "FEHLERHAFT", "30. Februar"),
    ("datum-monat-13", "2026-13-01", "FEHLERHAFT", "Monat 13"),
    ("datum-monat-00", "2026-00-10", "FEHLERHAFT", "Monat 00"),
    ("datum-tag-00", "2026-11-00", "FEHLERHAFT", "Tag 00"),
    ("datum-11-31", "2026-11-31", "FEHLERHAFT", "31. November"),
    ("datum-kurz", "2026-1-5", "FEHLERHAFT", "ohne führende Nullen"),
    ("datum-0000", "0000-01-01", "FEHLERHAFT", "Jahr 0000"),
    ("datum-uhrzeit", "2026-11-25T10:00", "FEHLERHAFT", "mit Uhrzeit"),
    ("datum-schraegstrich", "2026/11/25", "FEHLERHAFT", "Schrägstriche"),
    ("datum-arabisch", "٢٠٢٦-١١-٢٥",
     "FEHLERHAFT", "arabisch-indische Ziffern"),
    ("datum-vollbreit", "２０２６-11-25", "FEHLERHAFT", "Vollbreit-Ziffern im Jahr"),
    ("datum-leerzeichen", "2026-11-25 ", "FEHLERHAFT", "angehängtes Leerzeichen"),
]:
    d = strassen()
    d["origin"]["created"] = date
    add(name, "9.3", exp, S, d, desc)

# ---------------------------------------------------------------- wrong procedures (ABGELEHNT)


def sign_err(d):
    d["products"][1]["w"] = [["0", "0"], ["1", "1"]]


add("strassen-vorzeichen", "7", "ABGELEHNT", S, mod(sign_err),
    "Vorzeichenfehler aus Abschnitt 7 (M2, w[1][1] = 1)")
add("strassen-q-vorzeichen", "7", "ABGELEHNT", S, mod(sign_err, "Q"),
    "derselbe Fehler über Q")
add("strassen-gf3-vorzeichen", "7", "ABGELEHNT", S, mod(sign_err, "GF(3)"),
    "derselbe Fehler über GF(3)")


def drop7(d):
    d["products"].pop()
    d["rank"] = 6
    d["id"] = "2x2x2-r6-ohne-m7"


add("strassen-ohne-m7", "7", "ABGELEHNT", "2x2x2-r6-ohne-m7.json", mod(drop7),
    "Strassen ohne M7, rank 6")


def wrong_half(d):
    d["products"][0]["u"] = [["2", "0"], ["0", "2"]]
    d["products"][0]["w"] = [["1/3", "0"], ["0", "1/3"]]


add("strassen-q-falscher-bruch", "7", "ABGELEHNT", S, mod(wrong_half, "Q"),
    "Strassen über Q, M1 mit u·2 und w·1/3")


def transposed_w(d):
    # store w transposed (the literature convention warned about in section 2)
    for p in d["products"]:
        w = p["w"]
        p["w"] = [[w[0][0], w[1][0]], [w[0][1], w[1][1]]]


add("strassen-w-transponiert", "2", "ABGELEHNT", S, mod(transposed_w),
    "Strassen mit transponiert gespeichertem w")

add("eins-zwei", "7", "ABGELEHNT", "1x1x1-r1-eins.json", one("2"), "1x1x1 mit Koeffizient 2")
add("eins-gf3-zwei", "7", "ABGELEHNT", "1x1x1-r1-eins.json", one("2", "GF(3)"),
    "1x1x1 über GF(3) mit Koeffizient 2")
add("eins-null", "7", "ABGELEHNT", "1x1x1-r1-eins.json", one("0"),
    "1x1x1 mit Koeffizient 0 (Nullprodukt und falsch)")
add("eins-gf2-zwei", "7", "ABGELEHNT", "1x1x1-r1-eins.json", one("2", "GF(2)"),
    "1x1x1 über GF(2), Koeffizient 2 ≡ 0")


def gfbig_wrong(d):
    d["products"][1]["w"] = [["0", "0"], ["1", "18446744073709551556"]]  # = -1 mod p : correct!


add("strassen-gf-gross-minus1", "9.6.2", "ANGENOMMEN", S,
    mod(gfbig_wrong, "GF(18446744073709551557)"),
    "GF(2^64-59), -1 in M2 als p-1 geschrieben")


def gfbig_wrong2(d):
    d["products"][1]["w"] = [["0", "0"], ["1", "18446744073709551555"]]  # = -2 mod p


add("strassen-gf-gross-falsch", "7", "ABGELEHNT", S,
    mod(gfbig_wrong2, "GF(18446744073709551557)"),
    "GF(2^64-59), M2 mit p-2 statt -1")

for nm, base in [("hk71-3x2x5", "3x2x5-r25-hk71.json"), ("hk71-3x2x6", "3x2x6-r30-hk71.json")]:
    with open(os.path.join(HERE, "..", "..", "verfahren", base), "rb") as f:
        hk = json.loads(f.read().decode("utf-8"))
    hk2 = copy.deepcopy(hk)
    # flip one coefficient of w in the last product
    w = hk2["products"][-1]["w"]
    for i, row in enumerate(w):
        for l, c in enumerate(row):
            if c != "0":
                w[i][l] = "0"
                break
        else:
            continue
        break
    hk2["notes"] = "Abgleich S1-20: ein Koeffizient von w im letzten Produkt auf 0 gesetzt"
    add(nm + "-gestoert", "7", "ABGELEHNT", base, hk2,
        "Verfahren aus verfahren/%s mit einem auf 0 gesetzten w-Koeffizienten" % base)

# ---------------------------------------------------------------- 9.1 JSON and encoding
add("utf8-ungueltig", "9.1.1", "FEHLERHAFT", S,
    dump(strassen()).replace(b"von Hand", b"von \xffHand"),
    "ungültiges UTF-8-Byte 0xFF in origin.method")
add("utf8-ueberlang", "9.1.1", "FEHLERHAFT", S,
    dump(strassen()).replace(b"von Hand", b"von \xc0\xafHand"),
    "überlange UTF-8-Folge C0 AF")
add("bom", "9.1.1", "FEHLERHAFT", S, b"\xef\xbb\xbf" + dump(strassen()), "Byte-Order-Mark am Anfang")
add("utf16", "9.1.1", "FEHLERHAFT", S, json.dumps(strassen()).encode("utf-16-le"),
    "Datei in UTF-16LE ohne BOM")
add("nachlauf", "9.1.1", "FEHLERHAFT", S, dump(strassen()) + b"x\n", "Text nach dem JSON-Wert")
add("zwei-objekte", "9.1.1", "FEHLERHAFT", S, dump(strassen()) + dump(strassen()),
    "zwei JSON-Objekte hintereinander")
add("nan", "9.1.1", "FEHLERHAFT", S, raw_with(strassen(), '"n": 2', '"n": NaN'), "n = NaN")
add("infinity", "9.1.1", "FEHLERHAFT", S, raw_with(strassen(), '"m": 2', '"m": Infinity'),
    "m = Infinity")
add("minus-infinity", "9.1.1", "FEHLERHAFT", S, raw_with(strassen(), '"k": 2', '"k": -Infinity'),
    "k = -Infinity")
add("kommentar", "9.1.1", "FEHLERHAFT", S,
    raw_with(strassen(), '"rank": 7,', '"rank": 7, // Kommentar\n'), "Zeilenkommentar")
add("kommentar-block", "9.1.1", "FEHLERHAFT", S,
    raw_with(strassen(), '"rank": 7,', '"rank": 7, /* x */'), "Blockkommentar")
add("komma-hinten-objekt", "9.1.1", "FEHLERHAFT", S,
    raw_with(strassen(), '"created_by": "Prüfer, S1-20 (Abgleich)"\n',
             '"created_by": "Prüfer, S1-20 (Abgleich)",\n'), "nachgestelltes Komma im Objekt")
add("komma-hinten-liste", "9.1.1", "FEHLERHAFT", S,
    raw_with(strassen(), '"0"\n    ]\n   ]\n  }\n ]', '"0"\n    ]\n   ]\n  },\n ]'),
    "nachgestelltes Komma in products")
add("leer", "9.1.1", "FEHLERHAFT", S, b"", "leere Datei")
add("nur-leerraum", "9.1.1", "FEHLERHAFT", S, b"  \n", "nur Leerraum")
_full = dump(strassen())
add("abgeschnitten", "9.1.1", "FEHLERHAFT", S, _full[:_full.index(b'"origin"')],
    "abgeschnittene Datei (endet vor origin)")
add("einfache-anfuehrung", "9.1.1", "FEHLERHAFT", S,
    raw_with(strassen(), '"ring": "Z"', "'ring': 'Z'"), "einfache Anführungszeichen")
add("steuerzeichen-roh", "9.1.1", "FEHLERHAFT", S,
    raw_with(strassen(), "von Hand", "von\tHand"), "rohes Tabulatorzeichen in einer Zeichenkette")

add("doppelt-oben", "9.1.2", "FEHLERHAFT", S,
    raw_with(strassen(), '"ring": "Z",', '"ring": "Z", "ring": "Z",'), "ring doppelt (gleicher Wert)")
add("doppelt-oben-anders", "9.1.2", "FEHLERHAFT", S,
    raw_with(strassen(), '"rank": 7,', '"rank": 6, "rank": 7,'), "rank doppelt, zweiter Wert richtig")
add("doppelt-origin", "9.1.2", "FEHLERHAFT", S,
    raw_with(strassen(), '"method": "von Hand übertragen",',
             '"method": "a", "method": "von Hand übertragen",'), "origin.method doppelt")
add("doppelt-produkt", "9.1.2", "FEHLERHAFT", S,
    raw_with(strassen(), '"u": [', '"u": [["9","9"],["9","9"]], "u": ['), "u im ersten Produkt doppelt")
add("doppelt-escape", "9.1.2", "FEHLERHAFT", S,
    raw_with(strassen(), '"n": 2,', '"n": 2, "\\u006e": 2,'), 'n doppelt, einmal als "\\u006e"')

d = strassen()
d["notes"] = "X"
add("surrogat-hoch", "9.1.3", "FEHLERHAFT", S, raw_with(d, '"notes": "X"', '"notes": "\\ud800"'),
    "einzelnes hohes Surrogat in notes")
add("surrogat-tief", "9.1.3", "FEHLERHAFT", S, raw_with(d, '"notes": "X"', '"notes": "a\\udc00b"'),
    "einzelnes tiefes Surrogat in notes")
add("surrogat-vertauscht", "9.1.3", "FEHLERHAFT", S,
    raw_with(d, '"notes": "X"', '"notes": "\\ude00\\ud83d"'), "Surrogat-Paar in falscher Reihenfolge")
add("surrogat-schluessel", "9.1.3", "FEHLERHAFT", S,
    raw_with(strassen(), '"ring": "Z",', '"ring": "Z", "\\ud800": "x",'),
    "einzelnes Surrogat in einem (unbekannten) Schlüssel")

add("oben-liste", "9.1.5", "FEHLERHAFT", S, b"[]\n", "oberster Wert Liste")
add("oben-liste-objekt", "9.1.5", "FEHLERHAFT", S, b"[" + dump(strassen()) + b"]",
    "Strassen in eine Liste gepackt")
add("oben-string", "9.1.5", "FEHLERHAFT", S, b'"x"\n', "oberster Wert Zeichenkette")
add("oben-zahl", "9.1.5", "FEHLERHAFT", S, b"7\n", "oberster Wert Zahl")
add("oben-null", "9.1.5", "FEHLERHAFT", S, b"null\n", "oberster Wert null")
add("oben-true", "9.1.5", "FEHLERHAFT", S, b"true\n", "oberster Wert true")

# deep nesting: a type error, but tests the parser's recursion handling
deep = 100000
add("tief-verschachtelt", "9.2.3", "FEHLERHAFT", S,
    raw_with(strassen(), '"ring": "Z",', '"ring": "Z", "notes": ' + "[" * deep + "]" * deep + ","),
    "notes als Liste mit 100000 Ebenen")
add("tief-verschachtelt-offen", "9.1.1", "FEHLERHAFT", S, b"[" * deep,
    "100000 öffnende Klammern ohne Ende")

# ---------------------------------------------------------------- 9.2 keys and types
for name, key, desc in [
    ("fehlt-format_version", "format_version", "format_version fehlt"),
    ("fehlt-id", "id", "id fehlt"),
    ("fehlt-n", "n", "n fehlt"),
    ("fehlt-k", "k", "k fehlt"),
    ("fehlt-m", "m", "m fehlt"),
    ("fehlt-rank", "rank", "rank fehlt"),
    ("fehlt-ring", "ring", "ring fehlt"),
    ("fehlt-origin", "origin", "origin fehlt"),
    ("fehlt-products", "products", "products fehlt"),
]:
    d = strassen()
    del d[key]
    add(name, "6.1", "FEHLERHAFT", S, d, desc)
for name, key in [("fehlt-source", "source"), ("fehlt-method", "method"),
                  ("fehlt-created", "created"), ("fehlt-created_by", "created_by")]:
    d = strassen()
    del d["origin"][key]
    add(name, "6.1", "FEHLERHAFT", S, d, "origin.%s fehlt" % key)
for key in "uvw":
    d = strassen()
    del d["products"][3][key]
    add("fehlt-produkt-" + key, "6.1", "FEHLERHAFT", S, d, "%s fehlt in products[3]" % key)

d = strassen(); d["extra"] = "x"
add("zusatz-oben", "9.2.1", "FEHLERHAFT", S, d, "unbekannter Schlüssel oben")
d = strassen(); d["origin"]["url"] = "https://example.org"
add("zusatz-origin", "9.2.1", "FEHLERHAFT", S, d, "unbekannter Schlüssel in origin")
d = strassen(); d["products"][0]["name"] = "M1"
add("zusatz-produkt", "9.2.1", "FEHLERHAFT", S, d, "unbekannter Schlüssel in einem Produkt")
d = strassen(); d["Ring"] = "Z"
add("zusatz-grossschreibung", "9.2.1", "FEHLERHAFT", S, d, "Schlüssel Ring zusätzlich zu ring")
d = strassen(); d["status"] = "geprüft"
add("zusatz-status", "9.2.1", "FEHLERHAFT", S, d, "Schlüssel status (Abschnitt 1)")

for name, field, raw, desc in [
    ("int-punkt", "n", "2.0", "n = 2.0"),
    ("int-exponent", "n", "2e0", "n = 2e0"),
    ("int-exponent-gross", "m", "2E0", "m = 2E0"),
    ("int-string", "k", '"2"', 'k = "2"'),
    ("int-true", "n", "true", "n = true"),
    ("int-false", "m", "false", "m = false"),
    ("int-null", "rank", "null", "rank = null"),
    ("int-null-n", "n", "null", "n = null"),
    ("int-null-fv", "format_version", "null", "format_version = null"),
    ("int-true-fv", "format_version", "true", "format_version = true (true == 1 in Python)"),
    ("int-liste", "n", "[2]", "n = [2]"),
    ("int-objekt", "n", '{"v": 2}', "n als Objekt"),
    ("int-null-wert", "n", "0", "n = 0"),
    ("int-negativ", "m", "-2", "m = -2"),
    ("int-minus-null", "n", "-0", "n = -0 (JSON-Ganzzahl, Wert 0)"),
    ("rank-null", "rank", "0", "rank = 0"),
    ("fv-2", "format_version", "2", "format_version = 2 (Schritt 2)"),
    ("fv-0", "format_version", "0", "format_version = 0"),
    ("fv-punkt", "format_version", "1.0", "format_version = 1.0"),
    ("int-riesig", "n", "1" + "0" * 30, "n = 10^30 (Form passt nicht)"),
    ("int-1e400", "n", "1e400", "n = 1e400"),
]:
    d = strassen()
    pat = '"%s": %s' % (field, json.dumps(d[field]))
    add(name, "9.2.2", "FEHLERHAFT", S, raw_with(d, pat, '"%s": %s' % (field, raw)), desc)

# n = 2 written as 2 but leading zero is invalid JSON
add("int-fuehrende-null", "9.1.1", "FEHLERHAFT", S, raw_with(strassen(), '"n": 2', '"n": 02'),
    "n = 02 (in JSON ungültig)")
add("int-plus", "9.1.1", "FEHLERHAFT", S, raw_with(strassen(), '"n": 2', '"n": +2'),
    "n = +2 (in JSON ungültig)")

d = strassen(); d["origin"] = "Strassen 1969"
add("origin-string", "9.2.3", "FEHLERHAFT", S, d, "origin als Zeichenkette")
d = strassen(); d["origin"] = [ORIGIN]
add("origin-liste", "9.2.3", "FEHLERHAFT", S, d, "origin als Liste")
d = strassen(); d["origin"] = None
add("origin-null", "9.2.3", "FEHLERHAFT", S, d, "origin = null")
d = strassen(); d["origin"]["source"] = 1969
add("origin-zahl", "9.2.3", "FEHLERHAFT", S, d, "origin.source als Zahl")
d = strassen(); d["origin"]["method"] = None
add("origin-wert-null", "9.2.3", "FEHLERHAFT", S, d, "origin.method = null")
d = strassen(); d["origin"]["created_by"] = ["Prüfer"]
add("origin-wert-liste", "9.2.3", "FEHLERHAFT", S, d, "origin.created_by als Liste")
d = strassen(); d["origin"]["created"] = 20261125
add("origin-datum-zahl", "9.2.3", "FEHLERHAFT", S, d, "origin.created als Zahl")
d = strassen(); d["claim"] = None
add("claim-null", "9.2.3", "FEHLERHAFT", S, d, "claim = null")
d = strassen(); d["notes"] = None
add("notes-null", "9.2.3", "FEHLERHAFT", S, d, "notes = null")
d = strassen(); d["origin"]["derived_from"] = None
add("derived-null", "9.2.3", "FEHLERHAFT", S, d, "origin.derived_from = null")
d = strassen(); d["claim"] = 5
add("claim-zahl", "9.2.3", "FEHLERHAFT", S, d, "claim als Zahl")
d = strassen(); d["notes"] = ["a", "b"]
add("notes-liste", "9.2.3", "FEHLERHAFT", S, d, "notes als Liste")
d = strassen(); d["notes"] = True
add("notes-true", "9.2.3", "FEHLERHAFT", S, d, "notes = true")
d = strassen(); d["ring"] = None
add("ring-null", "9.2.3", "FEHLERHAFT", S, d, "ring = null")
d = strassen(); d["id"] = None
add("id-null", "9.2.3", "FEHLERHAFT", S, d, "id = null")

for name, where, val, desc in [
    ("leer-source", "source", "", "origin.source leer"),
    ("leer-method", "method", " ", "origin.method nur Leerzeichen"),
    ("leer-created_by", "created_by", "\t\r\n", "origin.created_by nur Tab, CR, LF"),
    ("leer-derived", "derived_from", "", "origin.derived_from leer"),
]:
    d = strassen(); d["origin"][where] = val
    add(name, "9.2.4", "FEHLERHAFT", S, d, desc)
d = strassen(); d["claim"] = ""
add("leer-claim", "9.2.4", "FEHLERHAFT", S, d, "claim leer")
d = strassen(); d["notes"] = " \n \t \r "
add("leer-notes", "9.2.4", "FEHLERHAFT", S, d, "notes nur Leerraum")
d = strassen(); d["origin"]["created"] = ""
add("leer-created", "9.3", "FEHLERHAFT", S, d, "origin.created leer")

for name, val, exp, desc in [
    ("derived-form-falsch", "strassen", "FEHLERHAFT", "derived_from ohne id-Form"),
    ("derived-bindestrich", "2x2x2-r7-", "FEHLERHAFT", "derived_from ohne Kurzname"),
    ("derived-gross", "2x2x2-r7-Strassen", "FEHLERHAFT", "derived_from mit Großbuchstaben"),
    ("derived-endung", "2x2x2-r7-strassen69.json", "FEHLERHAFT", "derived_from mit .json"),
    ("derived-fuehrende-null", "02x2x2-r7-s", "FEHLERHAFT", "derived_from mit führender Null"),
    ("derived-unbekannt", "9x2x9-r99-gibt-es-nicht", "ANGENOMMEN",
     "derived_from in id-Form, Verfahren existiert nicht (9.2.5: nicht geprüft)"),
]:
    d = strassen(); d["origin"]["derived_from"] = val
    add(name, "9.2.5", exp, S, d, desc)

d = strassen(); d["products"] = {"0": STRASSEN_PRODUCTS[0]}
add("products-objekt", "9.2.6", "FEHLERHAFT", S, d, "products als Objekt")
d = strassen(); d["products"] = None
add("products-null", "9.2.6", "FEHLERHAFT", S, d, "products = null")
d = strassen(); d["products"][2] = [["1"]]
add("produkt-liste", "9.2.6", "FEHLERHAFT", S, d, "ein Produkt als Liste")
d = strassen(); d["products"][2] = None
add("produkt-null", "9.2.6", "FEHLERHAFT", S, d, "ein Produkt = null")
d = strassen(); d["products"][0]["u"] = [["1", "0"]]
add("form-u-zeilen", "6.5", "FEHLERHAFT", S, d, "u mit 1 statt 2 Zeilen")
d = strassen(); d["products"][0]["v"] = [["1", "0", "0"], ["0", "1", "0"]]
add("form-v-spalten", "6.5", "FEHLERHAFT", S, d, "v mit 3 statt 2 Spalten")
d = strassen(); d["products"][0]["w"] = [["1", "0"], ["0", "1"], ["0", "0"]]
add("form-w-zeilen", "6.5", "FEHLERHAFT", S, d, "w mit 3 statt 2 Zeilen")
d = strassen(); d["products"][0]["u"] = [["1", "0"], ["1"]]
add("form-ungleich", "9.2.6", "FEHLERHAFT", S, d, "ungleich lange Zeilen in u")
d = strassen(); d["products"][0]["u"] = [["1", "0"], []]
add("form-leere-zeile", "9.2.6", "FEHLERHAFT", S, d, "leere Zeile in u")
d = strassen(); d["products"][0]["u"] = []
add("form-leer", "9.2.6", "FEHLERHAFT", S, d, "u leer")
d = strassen(); d["products"][0]["u"] = ["1", "0", "0", "1"]
add("form-flach", "9.2.6", "FEHLERHAFT", S, d, "u als flache Liste")
d = strassen(); d["products"][0]["u"] = "1"
add("form-string", "9.2.6", "FEHLERHAFT", S, d, "u als Zeichenkette")
d = strassen(); d["products"][0]["u"] = [[["1"], "0"], ["0", "1"]]
add("form-tiefer", "9.2.6", "FEHLERHAFT", S, d, "Koeffizient als Liste")
add("koeff-zahl", "9.2.6", "FEHLERHAFT", S, raw_with(strassen(), '"1"', "1"), "Koeffizient als JSON-Zahl 1")
add("koeff-zahl-0", "9.2.6", "FEHLERHAFT", S, raw_with(strassen(), '"0"', "0"), "Koeffizient als JSON-Zahl 0")
add("koeff-null", "9.2.6", "FEHLERHAFT", S, raw_with(strassen(), '"0"', "null"), "Koeffizient null")
add("koeff-true", "9.2.6", "FEHLERHAFT", S, raw_with(strassen(), '"1"', "true"), "Koeffizient true")
d = strassen(); d["products"][0]["u"] = None
add("u-null", "9.2.6", "FEHLERHAFT", S, d, "u = null")
d = strassen(); d["products"][0]["v"] = [None, ["0", "1"]]
add("zeile-null", "9.2.6", "FEHLERHAFT", S, d, "Zeile von v = null")

# rank vs products
d = strassen(); d["products"].append(copy.deepcopy(STRASSEN_PRODUCTS[0]))
add("rank-zu-klein", "6.4", "FEHLERHAFT", S, d, "rank 7, aber 8 Produkte")
d = strassen(); d["products"].pop()
add("rank-zu-gross", "6.4", "FEHLERHAFT", S, d, "rank 7, aber 6 Produkte")
d = strassen(); d["products"] = []
add("products-leer", "6.4", "FEHLERHAFT", S, d, "products leer, rank 7")

# ---------------------------------------------------------------- 9.3 date (above), 9.4 file name and id
add("endung-gross", "9.4.1", "FEHLERHAFT", "2x2x2-r7-strassen69.JSON", strassen(), "Endung .JSON")
add("endung-keine", "9.4.1", "FEHLERHAFT", "2x2x2-r7-strassen69", strassen(), "keine Endung")
add("endung-txt", "9.4.1", "FEHLERHAFT", "2x2x2-r7-strassen69.txt", strassen(), "Endung .txt")
add("endung-doppelt", "9.4.1", "FEHLERHAFT", "2x2x2-r7-strassen69.json.json", strassen(),
    "Endung .json.json, id ohne zweite Endung")
d = strassen(); d["id"] = "2x2x2-r7-anders"
add("id-ungleich", "9.4.1", "FEHLERHAFT", S, d, "id anders als Dateiname")
d = strassen(); d["id"] = "2x2x2-r7-Strassen69"
add("id-gross-klein", "9.4.1", "FEHLERHAFT", S, d, "id unterscheidet sich in der Groß-/Kleinschreibung")
d = strassen(); d["id"] = "2x2x2-r7-strassen69 "
add("id-leerzeichen", "9.4.1", "FEHLERHAFT", S, d, "id mit angehängtem Leerzeichen")
for name, ident, n, rank, exp, desc in [
    ("id-fuehrende-null", "02x2x2-r7-strassen69", 2, 7, "FEHLERHAFT", "führende Null bei n"),
    ("id-rank-null", "2x2x2-r07-strassen69", 2, 7, "FEHLERHAFT", "führende Null bei rank"),
    ("id-kurz-anfang", "2x2x2-r7--strassen69", 2, 7, "FEHLERHAFT", "Kurzname beginnt mit Bindestrich"),
    ("id-kurz-ende", "2x2x2-r7-strassen69-", 2, 7, "FEHLERHAFT", "Kurzname endet mit Bindestrich"),
    ("id-kurz-doppel", "2x2x2-r7-stras--sen", 2, 7, "FEHLERHAFT", "zwei Bindestriche im Kurznamen"),
    ("id-kurz-gross", "2x2x2-r7-Strassen", 2, 7, "FEHLERHAFT", "Großbuchstabe im Kurznamen"),
    ("id-kurz-unterstrich", "2x2x2-r7-stras_sen", 2, 7, "FEHLERHAFT", "Unterstrich im Kurznamen"),
    ("id-kurz-umlaut", "2x2x2-r7-straßen", 2, 7, "FEHLERHAFT", "ß im Kurznamen"),
    ("id-kurz-leer", "2x2x2-r7-", 2, 7, "FEHLERHAFT", "leerer Kurzname"),
    ("id-ohne-kurz", "2x2x2-r7", 2, 7, "FEHLERHAFT", "ohne Kurzname"),
    ("id-n-falsch", "3x2x2-r7-strassen69", 2, 7, "FEHLERHAFT", "Dateiname sagt n = 3, Datei n = 2"),
    ("id-rank-falsch", "2x2x2-r8-strassen69", 2, 7, "FEHLERHAFT", "Dateiname sagt rank 8, Datei 7"),
    ("id-grosses-x", "2X2X2-r7-strassen69", 2, 7, "FEHLERHAFT", "großes X"),
    ("id-vollbreit", "２x2x2-r7-strassen69", 2, 7, "FEHLERHAFT", "Vollbreit-Ziffer für n"),
    ("id-kurz-ziffern", "2x2x2-r7-0", 2, 7, "ANGENOMMEN", "Kurzname nur Ziffer 0"),
    ("id-kurz-bindestriche", "2x2x2-r7-a-b-c", 2, 7, "ANGENOMMEN", "Kurzname mit einzelnen Bindestrichen"),
]:
    d = strassen(); d["id"] = ident
    add(name, "9.4.2", exp, ident + ".json", d, desc)

# ---------------------------------------------------------------- 9.5 coefficients
for name, c, ring, exp, desc in [
    ("koeff-newline", "1\n", "Z", "FEHLERHAFT", 'Koeffizient "1\\n"'),
    ("koeff-vollbreit", "１", "Z", "FEHLERHAFT", "Vollbreit-Ziffer 1"),
    ("koeff-arabisch", "١", "Z", "FEHLERHAFT", "arabisch-indische Ziffer 1"),
    ("koeff-unterstrich", "1_0", "Z", "FEHLERHAFT", 'Koeffizient "1_0"'),
    ("koeff-plus", "+1", "Z", "FEHLERHAFT", 'Koeffizient "+1"'),
    ("koeff-fuehrende-null", "01", "Z", "FEHLERHAFT", 'Koeffizient "01"'),
    ("koeff-dezimal", "1.0", "Q", "FEHLERHAFT", 'Koeffizient "1.0" über Q'),
    ("koeff-exponent", "1e0", "Q", "FEHLERHAFT", 'Koeffizient "1e0" über Q'),
    ("koeff-leerzeichen-vorn", " 1", "Z", "FEHLERHAFT", 'Koeffizient " 1"'),
    ("koeff-leerzeichen-hinten", "1 ", "Z", "FEHLERHAFT", 'Koeffizient "1 "'),
    ("koeff-leer", "", "Z", "FEHLERHAFT", "leerer Koeffizient"),
    ("koeff-minus-minus", "--1", "Z", "FEHLERHAFT", 'Koeffizient "--1"'),
    ("koeff-minus-allein", "-", "Z", "FEHLERHAFT", 'Koeffizient "-"'),
    ("koeff-nenner-null", "1/0", "Q", "FEHLERHAFT", 'Koeffizient "1/0"'),
    ("koeff-nenner-negativ", "1/-1", "Q", "FEHLERHAFT", 'Koeffizient "1/-1"'),
    ("koeff-nenner-fuehrend", "1/01", "Q", "FEHLERHAFT", 'Koeffizient "1/01"'),
    ("koeff-nenner-leer", "1/", "Q", "FEHLERHAFT", 'Koeffizient "1/"'),
    ("koeff-zaehler-leer", "/1", "Q", "FEHLERHAFT", 'Koeffizient "/1"'),
    ("koeff-doppelbruch", "1/1/1", "Q", "FEHLERHAFT", 'Koeffizient "1/1/1"'),
    ("koeff-nul-zeichen", "1\u0000", "Z", "FEHLERHAFT", 'Koeffizient "1\\u0000"'),
    ("koeff-hex", "0x1", "Z", "FEHLERHAFT", 'Koeffizient "0x1"'),
    ("koeff-bruch-z", "2/2", "Z", "FEHLERHAFT", 'Koeffizient "2/2" über Z (9.5.3)'),
    ("koeff-bruch-z-ganz", "1/1", "Z", "FEHLERHAFT", 'Koeffizient "1/1" über Z (9.5.3)'),
    ("koeff-bruch-gf", "1/1", "GF(2)", "FEHLERHAFT", 'Koeffizient "1/1" über GF(2) (9.5.3)'),
    ("koeff-bruch-q", "2/2", "Q", "ANGENOMMEN", 'Koeffizient "2/2" über Q'),
]:
    d = strassen(ring)
    d["products"][0]["u"][0][0] = c   # replaces the "1" of M1
    rule = "9.5.3" if "9.5.3" in desc else ("9.5.2" if exp == "ANGENOMMEN" else "9.5.1")
    add(name, rule, exp, S, d, desc)

# ---------------------------------------------------------------- 9.6 ring
for name, ring, exp, desc in [
    ("ring-gf02", "GF(02)", "FEHLERHAFT", "GF(02)"),
    ("ring-gf-leer", "GF( 2)", "FEHLERHAFT", "GF( 2)"),
    ("ring-klein", "gf(2)", "FEHLERHAFT", "gf(2)"),
    ("ring-leer-hinten", "GF(2) ", "FEHLERHAFT", "GF(2) mit Leerzeichen"),
    ("ring-z-klein", "z", "FEHLERHAFT", "z"),
    ("ring-r", "R", "FEHLERHAFT", "R (reelle Zahlen)"),
    ("ring-leer", "", "FEHLERHAFT", "leerer ring"),
    ("ring-gf", "GF()", "FEHLERHAFT", "GF()"),
    ("ring-gf-ohne-klammer", "GF2", "FEHLERHAFT", "GF2"),
    ("ring-zp", "Z/2", "FEHLERHAFT", "Z/2"),
    ("ring-gf4", "GF(4)", "FEHLERHAFT", "GF(4), keine Primzahl"),
    ("ring-gf1", "GF(1)", "FEHLERHAFT", "GF(1)"),
    ("ring-gf0", "GF(0)", "FEHLERHAFT", "GF(0)"),
    ("ring-gf-minus", "GF(-2)", "FEHLERHAFT", "GF(-2)"),
    ("ring-gf-561", "GF(561)", "FEHLERHAFT", "GF(561), Carmichael-Zahl"),
    ("ring-gf-spsp", "GF(3215031751)", "FEHLERHAFT",
     "GF(3215031751), starke Pseudoprimzahl zu den Basen 2, 3, 5, 7"),
    ("ring-gf-spsp-gross", "GF(3825123056546413051)", "FEHLERHAFT",
     "GF(3825123056546413051), starke Pseudoprimzahl zu den Basen 2 bis 23"),
    ("ring-gf-quadrat", "GF(18446744030759878681)", "FEHLERHAFT",
     "GF(4294967291^2), Quadrat einer Primzahl knapp unter 2^64"),
    ("ring-gf-2hoch64-minus1", "GF(18446744073709551615)", "FEHLERHAFT", "GF(2^64-1), keine Primzahl"),
    ("ring-gf-2hoch64", "GF(18446744073709551616)", "FEHLERHAFT", "GF(2^64)"),
    ("ring-gf-ueber-2hoch64", "GF(18446744073709551629)", "FEHLERHAFT",
     "GF(2^64+13), Primzahl über der Grenze"),
    ("ring-gf-riesig", "GF(" + "9" * 40 + ")", "FEHLERHAFT", "GF(10^40-1)"),
    ("ring-gf-arabisch", "GF(٢)", "FEHLERHAFT", "GF mit arabisch-indischer Ziffer 2"),
    ("ring-gf-vollbreit", "GF(２)", "FEHLERHAFT", "GF mit Vollbreit-Ziffer 2"),
    ("ring-q-klein", "q", "FEHLERHAFT", "q"),
    ("ring-gf2-klammer-eckig", "GF[2]", "FEHLERHAFT", "GF[2]"),
]:
    d = strassen(ring)
    rule = "9.6.2" if re.fullmatch(r"GF\([1-9][0-9]*\)", ring) else "9.6.1"
    add(name, rule, exp, S, d, desc)

# ---------------------------------------------------------------- 9.7.4 several errors at once
d = strassen(); d["ring"] = "R"; d["origin"]["created"] = "2026-02-30"; d["extra"] = 1
add("mehrere-fehler", "9.7.4", "FEHLERHAFT", S, d, "drei Formatfehler zugleich")
d = mod(sign_err); d["origin"]["created"] = "2026-02-30"
add("falsch-und-fehlerhaft", "9.7.4", "FEHLERHAFT", S, d,
    "Gleichungen verletzt und ungültiges Datum: FEHLERHAFT, nicht ABGELEHNT")
d = mod(sign_err); d["products"][6]["w"][0][0] = "1 "
add("falsch-und-koeff", "9.7.4", "FEHLERHAFT", S, d,
    "Gleichungen verletzt und ein Koeffizient \"1 \" im letzten Produkt")

# ---------------------------------------------------------------- 9.7.6 control characters in reasons
d = strassen(); d["products"][0]["u"][0][0] = "1\n2"
add("koeff-zeilenumbruch-mitte", "9.7.6", "FEHLERHAFT", S, d, 'Koeffizient "1\\n2" (Grund einzeilig?)')
d = strassen(); d["ring"] = "GF(2)\nANGENOMMEN"
add("ring-zeilenumbruch", "9.7.6", "FEHLERHAFT", S, d, "ring mit Zeilenvorschub und dem Wort ANGENOMMEN")


def main():
    if os.path.isdir(OUT):
        shutil.rmtree(OUT)
    os.makedirs(OUT)
    lines = ["# case\trule\texpected\texpected_exit\tfile\tdescription"]
    for name, rule, exp, fn, data, desc in CASES:
        os.makedirs(os.path.join(OUT, name))
        with open(os.path.join(OUT, name, fn), "wb") as f:
            f.write(data)
        lines.append("\t".join([name, rule, exp, str(EXIT[exp]), name + "/" + fn, desc]))
    with open(os.path.join(OUT, "LISTE.tsv"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    print("%d cases written to %s" % (len(CASES), OUT))


if __name__ == "__main__":
    main()
