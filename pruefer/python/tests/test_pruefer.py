"""Tests for pruefer.py (task A-08). Run: python3 -m unittest discover -s tests"""

import copy
import json
import os
import subprocess
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.dirname(HERE))

import pruefer  # noqa: E402

DATA = os.path.join(HERE, "daten")
STRASSEN = os.path.join(DATA, "2x2x2-r7-strassen69.json")
STRASSEN_WRONG = os.path.join(DATA, "2x2x2-r7-strassen69-falsch.json")


def load(path):
    with open(path, encoding="utf-8") as fh:
        return json.load(fh)


def unit(rows, cols, i, j):
    return [["1" if (a, b) == (i, j) else "0" for b in range(cols)] for a in range(rows)]


def naive(n, k, m, short="naiv"):
    """Standard algorithm with n*k*m products: A[i][j] * B[j][l] -> C[i][l]."""
    products = []
    for i in range(n):
        for j in range(k):
            for l in range(m):
                products.append({"u": unit(n, k, i, j), "v": unit(k, m, j, l), "w": unit(n, m, i, l)})
    rank = n * k * m
    return {
        "format_version": 1,
        "id": "%dx%dx%d-r%d-%s" % (n, k, m, rank, short),
        "n": n, "k": k, "m": m, "rank": rank, "ring": "Z",
        "origin": {"source": "Schulmethode", "method": "Testfall", "created": "2026-11-25",
                   "created_by": "Verfahrenssucher, A-08 (Test)"},
        "products": products,
    }


class Base(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)

    def write(self, doc, name=None, raw=None):
        name = name or (doc["id"] + ".json")
        path = os.path.join(self.tmp.name, name)
        with open(path, "w", encoding="utf-8") as fh:
            fh.write(raw if raw is not None else json.dumps(doc, ensure_ascii=False))
        return path

    def check(self, doc=None, name=None, raw=None):
        return pruefer.check_file(self.write(doc, name, raw))

    def assertMalformed(self, doc=None, name=None, raw=None, fragment=""):
        code, lines = self.check(doc, name, raw)
        self.assertEqual(code, 2, lines)
        self.assertTrue(lines[0].startswith("FEHLERHAFT "), lines)
        self.assertIn(fragment, lines[0])


class TestStrassen(Base):
    def test_strassen_accepted(self):
        code, lines = pruefer.check_file(STRASSEN)
        self.assertEqual(code, 0)
        self.assertEqual(lines, ["ANGENOMMEN 2x2x2-r7-strassen69 2x2x2 rank=7 ring=Z"])

    def test_wrong_sign_rejected(self):
        code, lines = pruefer.check_file(STRASSEN_WRONG)
        self.assertEqual(code, 1)
        self.assertEqual(
            lines[0],
            "ABGELEHNT 2x2x2-r7-strassen69-falsch 2 von 64 Gleichungen verletzt, erste: "
            "i=1 j=0 j'=0 l=0 i'=1 l'=1 Wert=2 erwartet=0",
        )
        self.assertEqual(lines[1], "VERLETZT i=1 j=1 j'=0 l=0 i'=1 l'=1 Wert=2 erwartet=0")
        self.assertEqual(len(lines), 2)

    def test_strassen_over_gf2_and_gf3(self):
        for p in (2, 3):
            doc = load(STRASSEN)
            doc["ring"] = "GF(%d)" % p
            self.assertEqual(self.check(doc)[0], 0)

    def test_wrong_sign_is_fine_mod_2(self):
        # 2 = 0 in GF(2): the sign error vanishes there, correctly.
        doc = load(STRASSEN_WRONG)
        doc["ring"] = "GF(2)"
        self.assertEqual(self.check(doc)[0], 0)
        doc["ring"] = "GF(3)"
        self.assertEqual(self.check(doc)[0], 1)

    def test_strassen_scaled_over_q(self):
        # u of M1 times 2, w of M1 times 1/2: same scheme, denominators 2.
        doc = load(STRASSEN)
        doc["ring"] = "Q"
        doc["products"][0]["u"] = [["2", "0"], ["0", "4/2"]]
        doc["products"][0]["w"] = [["1/2", "0"], ["0", "2/4"]]
        code, lines = self.check(doc)
        self.assertEqual(code, 0, lines)
        self.assertEqual(lines[1], "HINWEIS Primteiler der Nenner: 2")

    def test_q_with_wrong_fraction_rejected(self):
        doc = load(STRASSEN)
        doc["ring"] = "Q"
        doc["products"][0]["w"] = [["1/3", "0"], ["0", "1"]]
        code, lines = self.check(doc)
        self.assertEqual(code, 1)
        self.assertIn("Wert=1/3", lines[0])
        self.assertIn("HINWEIS Primteiler der Nenner: 3", lines)


class TestOrientation(Base):
    def test_naive_rectangular(self):
        for n, k, m in ((1, 1, 1), (2, 2, 3), (3, 2, 2), (2, 3, 4)):
            self.assertEqual(self.check(naive(n, k, m))[0], 0, (n, k, m))

    def test_w_must_not_be_transposed(self):
        doc = naive(2, 2, 2)
        for prod in doc["products"]:
            prod["w"] = [list(col) for col in zip(*prod["w"])]
        code, lines = self.check(doc)
        self.assertEqual(code, 1, lines)

    def test_missing_product_rejected(self):
        doc = naive(2, 2, 3)
        doc["products"][5] = {"u": unit(2, 2, 0, 0), "v": [["0"] * 3] * 2, "w": unit(2, 3, 0, 0)}
        code, lines = self.check(doc)
        self.assertEqual(code, 1)
        self.assertIn("HINWEIS products[5].v ist ganz null (das Verfahren käme mit weniger Produkten aus)", lines)

    def test_zero_product_hint_on_accepted(self):
        doc = load(STRASSEN)
        doc["rank"] = 8
        doc["id"] = "2x2x2-r8-strassen69"
        doc["products"].append({"u": [["0", "0"], ["0", "0"]], "v": [["1", "0"], ["0", "0"]],
                                "w": [["1", "0"], ["0", "0"]]})
        code, lines = self.check(doc)
        self.assertEqual(code, 0)
        self.assertEqual(lines[1:], ["HINWEIS products[7].u ist ganz null (das Verfahren käme mit weniger Produkten aus)"])


class TestMalformed(Base):
    def test_not_json(self):
        self.assertMalformed(name="2x2x2-r7-x.json", raw="{", fragment="kein gültiges JSON")

    def test_not_utf8(self):
        path = os.path.join(self.tmp.name, "2x2x2-r7-x.json")
        with open(path, "wb") as fh:
            fh.write(b'{"id": "\xff"}')
        code, lines = pruefer.check_file(path)
        self.assertEqual(code, 2)
        self.assertIn("UTF-8", lines[0])

    def test_missing_file(self):
        code, lines = pruefer.check_file(os.path.join(self.tmp.name, "fehlt.json"))
        self.assertEqual(code, 2)
        self.assertTrue(lines[0].startswith("FEHLERHAFT fehlt.json "))

    def test_missing_field(self):
        doc = load(STRASSEN)
        del doc["origin"]
        self.assertMalformed(doc, fragment="Pflichtfeld origin fehlt")

    def test_unknown_top_key(self):
        doc = load(STRASSEN)
        doc["status"] = "geprüft"
        self.assertMalformed(doc, fragment="unbekannter Schlüssel 'status'")

    def test_duplicate_key(self):
        raw = json.dumps(load(STRASSEN))
        raw = raw.replace('"rank": 7', '"rank": 7, "rank": 7')
        self.assertMalformed(name="2x2x2-r7-strassen69.json", raw=raw, fragment="doppelter Schlüssel")

    def test_float_and_bool(self):
        raw = json.dumps(load(STRASSEN)).replace('"rank": 7', '"rank": 7.0')
        self.assertMalformed(name="2x2x2-r7-strassen69.json", raw=raw, fragment="Gleitkommazahl")
        raw = json.dumps(load(STRASSEN)).replace('"rank": 7', '"rank": NaN')
        self.assertMalformed(name="2x2x2-r7-strassen69.json", raw=raw, fragment="NaN")
        doc = load(STRASSEN)
        doc["n"] = True
        self.assertMalformed(doc, fragment="n ist keine Ganzzahl")

    def test_format_version(self):
        doc = load(STRASSEN)
        doc["format_version"] = 2
        self.assertMalformed(doc, fragment="format_version ist 2")

    def test_id_and_file_name(self):
        doc = load(STRASSEN)
        self.assertMalformed(doc, name="anders.json", fragment="nicht gleich dem Dateinamen")
        doc["id"] = "2x2x2-r6-strassen69"
        self.assertMalformed(doc, fragment="Dateiname nennt 2x2x2-r6")
        doc["id"] = "2x2x2-r7-Strassen"
        self.assertMalformed(doc, fragment="Muster")
        doc["id"] = "02x2x2-r7-strassen"
        self.assertMalformed(doc, fragment="Muster")
        self.assertMalformed(load(STRASSEN), name="2x2x2-r7-strassen69.txt", fragment=".json")

    def test_rank_mismatch(self):
        doc = load(STRASSEN)
        doc["products"].pop()
        self.assertMalformed(doc, fragment="rank=7, aber products hat 6")

    def test_shapes(self):
        doc = load(STRASSEN)
        doc["products"][3]["v"] = [["1", "0"]]
        self.assertMalformed(doc, fragment="products[3].v hat nicht 2 Zeilen")
        doc = load(STRASSEN)
        doc["products"][3]["w"][1] = ["1"]
        self.assertMalformed(doc, fragment="products[3].w[1] hat nicht 2")
        doc = load(STRASSEN)
        doc["products"][0]["x"] = []
        self.assertMalformed(doc, fragment="unbekannter Schlüssel 'x'")

    def test_bad_coefficients(self):
        for bad in ("+1", "01", "1.5", "1e2", " 1", "1 ", "1/0", "1/02", "1\n", "--1", "", "½", "١"):
            doc = load(STRASSEN)
            doc["ring"] = "Q"
            doc["products"][2]["u"][0][0] = bad
            self.assertMalformed(doc, fragment="kein erlaubter Koeffizient")
        doc = load(STRASSEN)
        doc["products"][2]["u"][0][0] = 1
        self.assertMalformed(doc, fragment="keine Zeichenkette")

    def test_fraction_outside_q(self):
        for ring in ("Z", "GF(5)"):
            doc = load(STRASSEN)
            doc["ring"] = ring
            doc["products"][2]["u"][0][0] = "2/2"
            self.assertMalformed(doc, fragment="Bruch im Zahlbereich")

    def test_rings(self):
        for ring in ("GF(4)", "GF(1)", "GF(0)", "GF(02)", "R", "C", "gf(2)", "GF(2) ", "Z "):
            doc = load(STRASSEN)
            doc["ring"] = ring
            self.assertMalformed(doc)
        doc = load(STRASSEN)
        doc["ring"] = "GF(1000000007)"
        self.assertEqual(self.check(doc)[0], 0)
        doc["ring"] = "GF(%d)" % (2 ** 61 - 1)  # Mersenne prime, beyond trial division
        self.assertEqual(self.check(doc)[0], 0)
        doc["ring"] = "GF(%d)" % (2 ** 89 - 1)  # prime, but no exact test implemented
        self.assertMalformed(doc, fragment="zu groß")


class TestNumberTheory(unittest.TestCase):
    def test_is_prime(self):
        small = [p for p in range(2, 2000) if all(p % d for d in range(2, p))]
        self.assertEqual([p for p in range(2000) if pruefer.is_prime(p)], small)
        self.assertFalse(pruefer.is_prime(3215031751))  # strong pseudoprime to bases 2,3,5,7
        self.assertTrue(pruefer.is_prime(2 ** 61 - 1))

    def test_prime_factors(self):
        self.assertEqual(pruefer.prime_factors(1), ([], 1))
        self.assertEqual(pruefer.prime_factors(360), ([2, 3, 5], 1))
        self.assertEqual(pruefer.prime_factors(2 * (2 ** 61 - 1)), ([2, 2 ** 61 - 1], 1))


class TestCommandLine(unittest.TestCase):
    SCRIPT = os.path.join(os.path.dirname(HERE), "pruefer.py")

    def run_cli(self, *args):
        return subprocess.run([sys.executable, self.SCRIPT, *args], capture_output=True)

    def test_exit_codes(self):
        res = self.run_cli(STRASSEN)
        self.assertEqual(res.returncode, 0)
        self.assertEqual(res.stdout.decode("utf-8"), "ANGENOMMEN 2x2x2-r7-strassen69 2x2x2 rank=7 ring=Z\n")
        self.assertEqual(self.run_cli(STRASSEN_WRONG).returncode, 1)
        res = self.run_cli()
        self.assertEqual(res.returncode, 2)
        self.assertTrue(res.stdout.startswith(b"FEHLERHAFT "))
        self.assertEqual(self.run_cli(STRASSEN, STRASSEN).returncode, 2)


if __name__ == "__main__":
    unittest.main()
