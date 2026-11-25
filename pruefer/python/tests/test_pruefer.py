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
        doc["ring"] = "GF(%d)" % (2 ** 89 - 1)  # prime, but p >= 2^64 (section 9.6.2)
        self.assertMalformed(doc, fragment="2^64")


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
        self.assertTrue(res.stdout.startswith(b"FEHLERHAFT - "))
        res = self.run_cli(STRASSEN, STRASSEN)
        self.assertEqual(res.returncode, 2)
        self.assertTrue(res.stdout.startswith(b"FEHLERHAFT - "))

# ====================================================================
# Section 9 of verfahren/README.md (task S1-07): one test per rule.
# Every malformed case below must give FEHLERHAFT with exit code 2 and
# exactly one output line (9.7.6); every accepted case ANGENOMMEN.
# ====================================================================

STRASSEN_NAME = "2x2x2-r7-strassen69.json"


def raw_strassen():
    """Strassen as JSON text with a stable layout, for byte-level edits."""
    return json.dumps(load(STRASSEN), ensure_ascii=False)


class Section9(Base):
    def assertMalformed(self, doc=None, name=None, raw=None, fragment=""):
        code, lines = self.check(doc, name, raw)
        self.assertEqual(code, 2, lines)
        self.assertTrue(lines[0].startswith("FEHLERHAFT "), lines)
        self.assertIn(fragment, lines[0])
        self.assertEqual(len(lines), 1, lines)  # 9.7.6: no hint lines
        return lines

    def assertAccepted(self, doc=None, name=None, raw=None):
        code, lines = self.check(doc, name, raw)
        self.assertEqual(code, 0, lines)
        self.assertTrue(lines[0].startswith("ANGENOMMEN "), lines)
        return lines

    def write_bytes(self, data, name=STRASSEN_NAME):
        path = os.path.join(self.tmp.name, name)
        with open(path, "wb") as fh:
            fh.write(data)
        return pruefer.check_file(path)


class Test91Json(Section9):
    """9.1: JSON and encoding."""

    def test_911_invalid_utf8(self):
        code, lines = self.write_bytes(raw_strassen().encode("utf-8").replace(b'"Z"', b'"Z\xc3"'))
        self.assertEqual(code, 2, lines)
        code, lines = self.write_bytes(b"\xed\xa0\x80")  # UTF-8 encoded surrogate
        self.assertEqual(code, 2, lines)

    def test_911_byte_order_mark(self):
        code, lines = self.write_bytes(b"\xef\xbb\xbf" + raw_strassen().encode("utf-8"))
        self.assertEqual(code, 2, lines)
        self.assertIn("Byte-Order-Mark", lines[0])
        self.assertEqual(len(lines), 1)

    def test_911_trailing_content(self):
        self.assertMalformed(name=STRASSEN_NAME, raw=raw_strassen() + " {}")
        self.assertMalformed(name=STRASSEN_NAME, raw=raw_strassen() + "x")
        self.assertMalformed(name=STRASSEN_NAME, raw=raw_strassen() + "\x00")

    def test_911_trailing_whitespace_allowed(self):
        self.assertAccepted(name=STRASSEN_NAME, raw=" \t\r\n" + raw_strassen() + " \t\r\n")

    def test_911_non_json_whitespace(self):
        # Only space, tab, LF, CR are JSON whitespace (RFC 8259).
        self.assertMalformed(name=STRASSEN_NAME, raw=raw_strassen() + " ")
        self.assertMalformed(name=STRASSEN_NAME, raw="\f" + raw_strassen())

    def test_911_nan_infinity(self):
        for const in ("NaN", "Infinity", "-Infinity"):
            raw = raw_strassen().replace('"rank": 7', '"rank": %s' % const)
            self.assertMalformed(name=STRASSEN_NAME, raw=raw)
            raw = raw_strassen().replace('"format_version": 1', '"format_version": 1, "notes": %s' % const)
            self.assertMalformed(name=STRASSEN_NAME, raw=raw)

    def test_911_comments(self):
        self.assertMalformed(name=STRASSEN_NAME, raw="// x\n" + raw_strassen())
        self.assertMalformed(name=STRASSEN_NAME, raw="/* x */" + raw_strassen())
        self.assertMalformed(name=STRASSEN_NAME, raw=raw_strassen().replace('"rank": 7,', '"rank": 7, /* x */'))

    def test_911_trailing_commas(self):
        self.assertMalformed(name=STRASSEN_NAME, raw=raw_strassen()[:-1] + ",}")
        raw = raw_strassen().replace('["1", "0"], ["0", "1"]]', '["1", "0"], ["0", "1"],]', 1)
        self.assertMalformed(name=STRASSEN_NAME, raw=raw)
        raw = raw_strassen().replace('["1", "0"]', '["1", "0",]', 1)
        self.assertMalformed(name=STRASSEN_NAME, raw=raw)

    def test_912_duplicate_keys_everywhere(self):
        raw = raw_strassen().replace('"rank": 7', '"rank": 7, "rank": 7')
        self.assertMalformed(name=STRASSEN_NAME, raw=raw, fragment="doppelter Schlüssel")
        raw = raw_strassen().replace('"method":', '"method": "x", "method":')
        self.assertMalformed(name=STRASSEN_NAME, raw=raw, fragment="doppelter Schlüssel")
        raw = raw_strassen().replace('{"u":', '{"u": [], "u":', 1)
        self.assertMalformed(name=STRASSEN_NAME, raw=raw, fragment="doppelter Schlüssel")
        # The same key, once escaped: duplicates are judged on decoded keys (9.1.4).
        raw = raw_strassen().replace('"rank": 7', '"rank": 7, "\\u0072ank": 7')
        self.assertMalformed(name=STRASSEN_NAME, raw=raw, fragment="doppelter Schlüssel")

    def test_913_lone_surrogates(self):
        for esc in ("\\ud800", "\\udfff", "\\ud83d", "\\ude00", "\\ude00\\ud83d", "x\\ud800y"):
            raw = raw_strassen().replace('"format_version": 1', '"format_version": 1, "notes": "%s"' % esc)
            self.assertMalformed(name=STRASSEN_NAME, raw=raw, fragment="Surrogat")
        # in a key (that would be unknown anyway, but must not crash)
        raw = raw_strassen().replace('"format_version": 1', '"format_version": 1, "\\ud800": "x"')
        self.assertMalformed(name=STRASSEN_NAME, raw=raw)
        # in a coefficient
        raw = raw_strassen().replace('"-1"', '"-1\\udc00"', 1)
        self.assertMalformed(name=STRASSEN_NAME, raw=raw)

    def test_913_valid_surrogate_pair_allowed(self):
        raw = raw_strassen().replace('"format_version": 1', '"format_version": 1, "notes": "\\ud83d\\ude00"')
        self.assertAccepted(name=STRASSEN_NAME, raw=raw)

    def test_914_escapes_are_decoded(self):
        raw = raw_strassen()
        raw = raw.replace('"u":', '"\\u0075":').replace('"1"', '"\\u0031"').replace('"Z"', '"\\u005a"')
        raw = raw.replace('"2x2x2-r7-strassen69"', '"2x2x2\\u002dr7-strassen69"')
        raw = raw.replace('"format_version": 1', '"format_version": 1, "notes": "a\\nb\\t\\"\\\\\\/"')
        self.assertAccepted(name=STRASSEN_NAME, raw=raw)

    def test_915_top_level_not_object(self):
        for raw in ("[]", "[" + raw_strassen() + "]", '"x"', "7", "null", "true", ""):
            self.assertMalformed(name=STRASSEN_NAME, raw=raw)


class Test92KeysTypes(Section9):
    """9.2: keys and types."""

    def test_921_unknown_keys(self):
        doc = load(STRASSEN)
        doc["status"] = "geprüft"
        self.assertMalformed(doc, fragment="unbekannter Schlüssel")
        doc = load(STRASSEN)
        doc["origin"]["url"] = "https://example.org"
        self.assertMalformed(doc, fragment="unbekannter Schlüssel 'url' in origin")
        doc = load(STRASSEN)
        doc["products"][6]["comment"] = "x"
        self.assertMalformed(doc, fragment="unbekannter Schlüssel 'comment'")

    def test_921_all_known_keys_accepted(self):
        doc = load(STRASSEN)
        doc["claim"] = "B-999"
        doc["notes"] = "Test"
        doc["origin"]["derived_from"] = "2x2x2-r7-original"
        self.assertAccepted(doc)

    def test_922_integer_fields(self):
        bad_values = ("2.0", "2e0", "2E0", "20e-1", "-0.0", '"2"', "true", "false", "null", "[2]", "{}")
        for key, good in (("format_version", 1), ("n", 2), ("k", 2), ("m", 2), ("rank", 7)):
            for bad in bad_values:
                raw = raw_strassen().replace('"%s": %d' % (key, good), '"%s": %s' % (key, bad), 1)
                self.assertNotEqual(raw, raw_strassen())
                self.assertMalformed(name=STRASSEN_NAME, raw=raw)

    def test_922_values_below_one(self):
        for key in ("format_version", "n", "k", "m", "rank"):
            for bad in (0, -1, -0):
                doc = load(STRASSEN)
                doc[key] = bad
                self.assertMalformed(doc)
        raw = raw_strassen().replace('"n": 2', '"n": -0', 1)
        self.assertMalformed(name=STRASSEN_NAME, raw=raw)

    def test_922_huge_integer_no_crash(self):
        raw = raw_strassen().replace('"n": 2', '"n": %s' % ("9" * 5000), 1)
        self.assertMalformed(name=STRASSEN_NAME, raw=raw)

    def test_923_origin_type(self):
        for bad in ("x", ["a"], None, 1):
            doc = load(STRASSEN)
            doc["origin"] = bad
            self.assertMalformed(doc, fragment="origin ist kein Objekt")

    def test_923_origin_values_are_strings(self):
        for key in ("source", "method", "created", "created_by", "derived_from"):
            for bad in (None, 1, True, ["x"], {"a": "b"}):
                doc = load(STRASSEN)
                doc["origin"][key] = bad
                self.assertMalformed(doc, fragment="origin.%s ist keine Zeichenkette" % key)

    def test_923_claim_notes_types_and_null(self):
        for key in ("claim", "notes"):
            for bad in (None, 1, False, ["x"], {"a": "b"}):
                doc = load(STRASSEN)
                doc[key] = bad
                self.assertMalformed(doc, fragment="%s ist keine Zeichenkette" % key)

    def test_923_optional_keys_may_be_absent(self):
        doc = load(STRASSEN)
        for key in ("claim", "notes"):
            self.assertNotIn(key, doc)
        self.assertNotIn("derived_from", doc["origin"])
        self.assertAccepted(doc)

    def test_923_required_keys(self):
        for key in pruefer.TOP_REQUIRED:
            doc = load(STRASSEN)
            del doc[key]
            self.assertMalformed(doc, name=STRASSEN_NAME, fragment="Pflichtfeld %s fehlt" % key)
        for key in pruefer.ORIGIN_REQUIRED:
            doc = load(STRASSEN)
            del doc["origin"][key]
            self.assertMalformed(doc, fragment="Pflichtfeld origin.%s fehlt" % key)

    def test_924_blank_strings(self):
        for blank in ("", " ", "\t", "\n", "\r", " \t\r\n "):
            for key in ("claim", "notes"):
                doc = load(STRASSEN)
                doc[key] = blank
                self.assertMalformed(doc, fragment="leer")
            for key in ("source", "method", "created_by", "derived_from"):
                doc = load(STRASSEN)
                doc["origin"][key] = blank
                self.assertMalformed(doc, fragment="leer")
            doc = load(STRASSEN)
            doc["origin"]["created"] = blank
            self.assertMalformed(doc)

    def test_924_other_whitespace_counts_as_content(self):
        # Only the four listed characters count as blank.
        for text in (" ", " ", "\f", "\v", "x", " x "):
            doc = load(STRASSEN)
            doc["notes"] = text
            self.assertAccepted(doc)

    def test_925_derived_from_form(self):
        for good in ("2x2x2-r7-strassen69", "4x2x4-r25-s001", "1x1x1-r1-a-b-c"):
            doc = load(STRASSEN)
            doc["origin"]["derived_from"] = good
            self.assertAccepted(doc)
        for bad in ("strassen", "2x2x2-r7-strassen69.json", "2x2x2-r7-", "2x2x2-r7--a", "2x2x2-r7-A",
                    "02x2x2-r7-a", "2x2x2-r07-a", "2x2x2-r7-a-", "2x2x2-r7-a\n", "2x2x2-r٧-a"):
            doc = load(STRASSEN)
            doc["origin"]["derived_from"] = bad
            self.assertMalformed(doc, fragment="derived_from")

    def test_926_products_structure(self):
        cases = []
        doc = load(STRASSEN); doc["products"] = {"0": doc["products"][0]}; cases.append(doc)
        doc = load(STRASSEN); doc["products"] = None; cases.append(doc)
        doc = load(STRASSEN); doc["products"][0] = ["u", "v", "w"]; cases.append(doc)
        doc = load(STRASSEN); doc["products"][0] = None; cases.append(doc)
        doc = load(STRASSEN); del doc["products"][0]["w"]; cases.append(doc)
        doc = load(STRASSEN); doc["products"][0]["u"] = None; cases.append(doc)
        doc = load(STRASSEN); doc["products"][0]["u"] = "1,0;0,1"; cases.append(doc)
        doc = load(STRASSEN); doc["products"][0]["u"][0] = None; cases.append(doc)
        doc = load(STRASSEN); doc["products"][0]["u"][0] = "10"; cases.append(doc)
        doc = load(STRASSEN); doc["products"][0]["u"][0][1] = None; cases.append(doc)
        doc = load(STRASSEN); doc["products"][0]["u"][0][1] = 0; cases.append(doc)
        doc = load(STRASSEN); doc["products"][0]["u"][0][1] = ["0"]; cases.append(doc)
        doc = load(STRASSEN); doc["products"][0]["u"][0].append("0"); cases.append(doc)   # ragged
        doc = load(STRASSEN); doc["products"][0]["u"][1].pop(); cases.append(doc)        # ragged
        doc = load(STRASSEN); doc["products"][0]["v"].append(["0", "0"]); cases.append(doc)
        doc = load(STRASSEN); doc["products"][0]["w"] = []; cases.append(doc)
        for doc in cases:
            self.assertMalformed(doc)

    def test_926_null_coefficient_in_otherwise_failing_scheme(self):
        # Even if the equations would also fail, the type error wins (9.7.4).
        doc = load(STRASSEN_WRONG)
        doc["id"] = "2x2x2-r7-strassen69"
        doc["products"][6]["w"][1][1] = None
        self.assertMalformed(doc)


class Test93Date(Section9):
    """9.3: origin.created is a valid Gregorian date, years 0001 to 9999."""

    def test_valid_dates(self):
        for date in ("2026-11-25", "2024-02-29", "2000-02-29", "0001-01-01", "9999-12-31",
                     "2026-01-31", "2026-04-30", "1582-10-10"):
            doc = load(STRASSEN)
            doc["origin"]["created"] = date
            self.assertAccepted(doc)

    def test_future_date_is_fine(self):
        doc = load(STRASSEN)
        doc["origin"]["created"] = "2999-01-01"
        self.assertAccepted(doc)

    def test_invalid_calendar_dates(self):
        for date in ("2026-02-30", "2026-02-29", "1900-02-29", "2100-02-29", "2026-04-31",
                     "2026-13-01", "2026-00-10", "2026-11-00", "2026-11-32", "0000-01-01"):
            doc = load(STRASSEN)
            doc["origin"]["created"] = date
            self.assertMalformed(doc, fragment="kein gültiges Kalenderdatum")

    def test_invalid_date_forms(self):
        for date in ("2026-1-5", "26-11-25", "2026-11-25T10:00", "2026-11-25 ", " 2026-11-25",
                     "2026-11-25\n", "2026/11/25", "25.11.2026", "20261125", "+2026-11-25",
                     "-2026-11-25", "12026-11-25", "٢٠٢٦-١١-٢٥", "２０２６-11-25", "2026‐11‐25",
                     "2026-11-2a"):
            doc = load(STRASSEN)
            doc["origin"]["created"] = date
            self.assertMalformed(doc, fragment="origin.created")


class Test94Name(Section9):
    """9.4: file name and id."""

    def test_941_extension_exactly_json(self):
        for name in ("2x2x2-r7-strassen69.JSON", "2x2x2-r7-strassen69.Json", "2x2x2-r7-strassen69.json.txt",
                     "2x2x2-r7-strassen69", "2x2x2-r7-strassen69.jsn", "2x2x2-r7-strassen69.json "):
            self.assertMalformed(load(STRASSEN), name=name)

    def test_941_id_equals_stem_bytewise(self):
        doc = load(STRASSEN)
        doc["id"] = "2x2x2-r7-strassen69 "
        self.assertMalformed(doc, name=STRASSEN_NAME, fragment="nicht gleich dem Dateinamen")
        doc["id"] = "2x2x2-r7-strassen69.json"
        self.assertMalformed(doc, name=STRASSEN_NAME, fragment="nicht gleich dem Dateinamen")
        doc["id"] = "2x2x2-r7-Strassen69"
        self.assertMalformed(doc, name=STRASSEN_NAME, fragment="nicht gleich dem Dateinamen")
        doc["id"] = 7
        self.assertMalformed(doc, name=STRASSEN_NAME, fragment="id ist keine Zeichenkette")

    def test_941_last_path_component(self):
        sub = os.path.join(self.tmp.name, "unter", "ordner")
        os.makedirs(sub)
        path = os.path.join(sub, STRASSEN_NAME)
        with open(path, "w", encoding="utf-8") as fh:
            json.dump(load(STRASSEN), fh)
        self.assertEqual(pruefer.check_file(path)[0], 0)
        # directory names that look wrong do not matter
        sub2 = os.path.join(self.tmp.name, "9x9x9-r1-x.json")
        os.makedirs(sub2)
        path2 = os.path.join(sub2, STRASSEN_NAME)
        with open(path2, "w", encoding="utf-8") as fh:
            json.dump(load(STRASSEN), fh)
        self.assertEqual(pruefer.check_file(path2)[0], 0)

    def test_942_id_pattern(self):
        bad_ids = (
            "02x2x2-r7-a", "2x02x2-r7-a", "2x2x02-r7-a", "2x2x2-r07-a", "0x2x2-r7-a",  # leading zero / zero
            "2x2x2-r7-", "2x2x2-r7", "2x2x2-7-a", "2X2X2-r7-a", "2x2x2-R7-a",          # structure
            "2x2x2-r7--a", "2x2x2-r7-a-", "2x2x2-r7-a--b", "2x2x2-r7-A", "2x2x2-r7-a_b",  # short name
            "2x2x2-r7-ä", "2x2x2-r7-a.b", "2x2x2-r7-a b", "٢x2x2-r7-a", "2x2x2-r7-١",      # non-ASCII etc.
        )
        for bad in bad_ids:
            doc = load(STRASSEN)
            doc["id"] = bad
            self.assertMalformed(doc, name=bad + ".json")

    def test_942_numbers_must_match(self):
        for bad in ("3x2x2-r7-strassen69", "2x3x2-r7-strassen69", "2x2x3-r7-strassen69", "2x2x2-r8-strassen69"):
            doc = load(STRASSEN)
            doc["id"] = bad
            self.assertMalformed(doc, fragment="Dateiname nennt")

    def test_942_good_short_names(self):
        for short in ("a", "0", "s001", "hk71", "a-b", "a-b-c-1", "x2x"):
            doc = load(STRASSEN)
            doc["id"] = "2x2x2-r7-" + short
            self.assertAccepted(doc)


class Test95Coefficients(Section9):
    """9.5: coefficients."""

    def test_951_full_match(self):
        for bad in ("1\n", "\n1", "1\r", "1 ", " 1", "1\t", "1_0", "1/2_0", "１", "١", "۱", "𝟏", "²",
                    "1/", "/2", "-", "", "0x1", "1.0", "1e0", "+1", "01", "-01", "1/01", "1/-2", "1//2",
                    "--1", "1/2/3", "Infinity", "NaN", "½"):
            doc = load(STRASSEN)
            doc["ring"] = "Q"
            doc["products"][1]["v"][0][0] = bad
            self.assertMalformed(doc, fragment="kein erlaubter Koeffizient")

    def test_952_zero_forms_and_unreduced(self):
        doc = load(STRASSEN)
        doc["ring"] = "Q"
        doc["products"][1]["v"][0][1] = "-0"
        doc["products"][1]["v"][1][0] = "0/5"
        doc["products"][1]["v"][1][1] = "-0/5"
        doc["products"][1]["v"][0][0] = "1/1"
        doc["products"][0]["u"][0][0] = "6/6"
        doc["products"][0]["w"][0][0] = "3/3"
        lines = self.assertAccepted(doc)
        self.assertIn("HINWEIS Primteiler der Nenner: keine", lines)
        for ring in ("Z", "GF(2)", "GF(7)"):
            doc = load(STRASSEN)
            doc["ring"] = ring
            doc["products"][1]["v"][0][1] = "-0"
            self.assertAccepted(doc)

    def test_952_minus_zero_is_zero(self):
        # "-0" in place of a "1" breaks the scheme: value 0, not something else.
        doc = load(STRASSEN)
        doc["products"][1]["v"][0][0] = "-0"
        code, lines = self.check(doc)
        self.assertEqual(code, 1, lines)

    def test_953_no_fraction_bar_outside_q(self):
        for ring in ("Z", "GF(2)", "GF(5)"):
            for frac in ("2/1", "1/1", "0/1", "-1/1", "4/2"):
                doc = load(STRASSEN)
                doc["ring"] = ring
                doc["products"][0]["u"][0][0] = frac
                self.assertMalformed(doc, fragment="Bruch im Zahlbereich")

    def test_954_huge_numbers(self):
        big = 10 ** 5000
        doc = load(STRASSEN)
        doc["ring"] = "Q"
        doc["products"][0]["u"] = [[str(big), "0"], ["0", str(big)]]
        doc["products"][0]["w"] = [["1/" + str(big), "0"], ["0", "%d/%d" % (big, big * big)]]
        lines = self.assertAccepted(doc)
        self.assertEqual(lines[1:], ["HINWEIS Primteiler der Nenner: 2 5"])
        # integers in Z: (b+1) - b == 1
        doc = naive(1, 1, 1)
        doc["products"] = [{"u": [[str(big + 1)]], "v": [["1"]], "w": [["1"]]},
                           {"u": [["-" + str(big)]], "v": [["1"]], "w": [["1"]]}]
        doc["rank"] = 2
        doc["id"] = "1x1x1-r2-gross"
        self.assertAccepted(doc)
        # and in GF(p)
        doc["ring"] = "GF(7)"
        self.assertAccepted(doc)
        doc["products"][0]["u"] = [[str(big)]]
        code, lines = self.check(doc)
        self.assertEqual(code, 1, lines)


class Test96Ring(Section9):
    """9.6: ring."""

    def test_961_ring_spelling(self):
        for ring in ("GF(02)", "GF( 2)", "GF(2 )", "gf(2)", "Gf(2)", "GF(2) ", " GF(2)", "GF(2)\n",
                     "z", "q", "Z ", "Z\n", "ZZ", "GF2", "GF[2]", "GF(+2)", "GF(٢)", "GF(２)", "GF()",
                     "F_2", "GF(2^2)", "GF(4)", "Q(i)", "R", ""):
            doc = load(STRASSEN)
            doc["ring"] = ring
            self.assertMalformed(doc)
        for bad in (None, 2, ["Z"]):
            doc = load(STRASSEN)
            doc["ring"] = bad
            self.assertMalformed(doc, fragment="ring ist keine Zeichenkette")

    def test_962_small_and_large_primes_below_2_64(self):
        for p in (2, 3, 5, 7, 65537, 2 ** 31 - 1, 2 ** 61 - 1, 2 ** 64 - 59):
            doc = load(STRASSEN)
            doc["ring"] = "GF(%d)" % p
            self.assertAccepted(doc)

    def test_962_p_from_2_64_on_rejected(self):
        for p in (2 ** 64, 2 ** 64 + 13, 2 ** 89 - 1, 2 ** 127 - 1, 10 ** 5000 + 1):
            doc = load(STRASSEN)
            doc["ring"] = "GF(%d)" % p
            self.assertMalformed(doc, fragment="2^64")

    def test_962_composites_and_non_primes(self):
        # 0 and 1 have a leading-zero-free spelling problem only for 0; both are not prime.
        for p in (0, 1, 4, 9, 561, 3215031751, 3825123056546413051, 2 ** 64 - 1, 2 ** 64 - 3):
            doc = load(STRASSEN)
            doc["ring"] = "GF(%d)" % p
            self.assertMalformed(doc)

    def test_962_primality_test_exact_below_2_64(self):
        # Strong pseudoprimes to several small bases must be recognised.
        for c in (2047, 1373653, 25326001, 3215031751, 2152302898747, 3474749660383,
                  341550071728321, 3825123056546413051, 318665857834031151167461):
            self.assertFalse(pruefer.is_prime(c), c)
        for q in (2 ** 64 - 59, 2 ** 63 - 25, 4294967291):
            self.assertTrue(pruefer.is_prime(q), q)


class Test97Output(Section9):
    """9.7: invocation and output."""

    SCRIPT = os.path.join(os.path.dirname(HERE), "pruefer.py")

    def run_cli(self, *args):
        return subprocess.run([sys.executable, self.SCRIPT, *args], capture_output=True)

    def test_971_argument_count(self):
        for args in ((), (STRASSEN, STRASSEN), (STRASSEN, STRASSEN, STRASSEN)):
            res = self.run_cli(*args)
            self.assertEqual(res.returncode, 2)
            out = res.stdout.decode("utf-8").splitlines()
            self.assertTrue(out[0].startswith("FEHLERHAFT - "), out)
            self.assertEqual(len(out), 1)

    def test_972_unreadable(self):
        res = self.run_cli(os.path.join(self.tmp.name, "2x2x2-r7-fehlt.json"))
        self.assertEqual(res.returncode, 2)
        self.assertEqual(res.stdout.decode("utf-8").split(" ")[:2], ["FEHLERHAFT", "2x2x2-r7-fehlt.json"])
        os.makedirs(os.path.join(self.tmp.name, "2x2x2-r7-ordner.json"))
        res = self.run_cli(os.path.join(self.tmp.name, "2x2x2-r7-ordner.json"))
        self.assertEqual(res.returncode, 2)
        self.assertTrue(res.stdout.startswith(b"FEHLERHAFT 2x2x2-r7-ordner.json "))

    def test_973_file_name_without_path(self):
        doc = load(STRASSEN)
        doc["origin"]["created"] = "2026-02-30"
        sub = os.path.join(self.tmp.name, "a", "b")
        os.makedirs(sub)
        path = os.path.join(sub, STRASSEN_NAME)
        with open(path, "w", encoding="utf-8") as fh:
            json.dump(doc, fh)
        res = self.run_cli(path)
        self.assertEqual(res.returncode, 2)
        self.assertTrue(res.stdout.startswith(b"FEHLERHAFT 2x2x2-r7-strassen69.json "), res.stdout)

    def test_974_malformed_beats_wrong_equations(self):
        base = load(STRASSEN_WRONG)
        base["id"] = "2x2x2-r7-strassen69"
        self.assertEqual(self.check(copy.deepcopy(base))[0], 1)  # sanity: ABGELEHNT when clean
        edits = [
            lambda d: d["origin"].__setitem__("created", "2026-02-30"),
            lambda d: d["origin"].__setitem__("extra", "x"),
            lambda d: d.__setitem__("notes", " "),
            lambda d: d.__setitem__("ring", "GF(%d)" % 2 ** 64),
            lambda d: d["products"][0]["u"][0].__setitem__(0, "1\n"),
            lambda d: d["origin"].__setitem__("derived_from", "x"),
        ]
        for edit in edits:
            doc = copy.deepcopy(base)
            edit(doc)
            self.assertMalformed(doc)

    def test_975_accepted_line_exact(self):
        for ring in ("Z", "Q", "GF(2)", "GF(%d)" % (2 ** 64 - 59)):
            doc = load(STRASSEN)
            doc["ring"] = ring
            lines = self.assertAccepted(doc)
            self.assertEqual(lines[0], "ANGENOMMEN 2x2x2-r7-strassen69 2x2x2 rank=7 ring=%s" % ring)

    def test_976_no_hints_on_malformed(self):
        # A Q scheme with a zero product would produce two hint lines if accepted.
        doc = load(STRASSEN)
        doc["ring"] = "Q"
        doc["rank"] = 8
        doc["id"] = "2x2x2-r8-strassen69"
        doc["products"].append({"u": [["0", "0"], ["0", "0"]], "v": [["1/3", "0"], ["0", "0"]],
                                "w": [["1", "0"], ["0", "0"]]})
        lines = self.assertAccepted(doc)
        self.assertEqual(len(lines), 3, lines)
        doc["origin"]["created"] = "2026-02-30"
        self.assertMalformed(doc)

    def test_976_hints_on_rejected(self):
        doc = load(STRASSEN)
        doc["ring"] = "Q"
        doc["products"][0]["w"] = [["1/3", "0"], ["0", "1"]]
        code, lines = self.check(doc)
        self.assertEqual(code, 1)
        self.assertIn("HINWEIS Primteiler der Nenner: 3", lines)

    def test_977_prime_factor_hint_names_rest(self):
        # Denominator = product of two primes > 10**12: not factored, named as rest.
        p1, p2 = 1000000000039, 1000000000061
        doc = load(STRASSEN)
        doc["ring"] = "Q"
        d = 6 * p1 * p2
        doc["products"][0]["u"] = [[str(d), "0"], ["0", str(d)]]
        doc["products"][0]["w"] = [["1/%d" % d, "0"], ["0", "1/%d" % d]]
        lines = self.assertAccepted(doc)
        self.assertEqual(lines[1], "HINWEIS Primteiler der Nenner: 2 3 (nicht zerlegter Restfaktor %d)" % (p1 * p2))
        # a single large prime is recognised as prime
        d = 2 ** 61 - 1
        doc["products"][0]["u"] = [[str(d), "0"], ["0", str(d)]]
        doc["products"][0]["w"] = [["1/%d" % d, "0"], ["0", "1/%d" % d]]
        lines = self.assertAccepted(doc)
        self.assertEqual(lines[1], "HINWEIS Primteiler der Nenner: %d" % d)

    def test_internal_error_is_not_rejected(self):
        # A crash must not exit with 1 (ABGELEHNT); main() maps it to 3.
        import io
        from unittest import mock
        buf = io.StringIO()
        with mock.patch.object(pruefer, "check_file", side_effect=RuntimeError("kaputt")), \
                mock.patch.object(sys, "stdout", buf):
            code = pruefer.main(["pruefer.py", STRASSEN])
        self.assertEqual(code, 3)
        self.assertTrue(buf.getvalue().startswith("INTERNER-FEHLER 2x2x2-r7-strassen69.json RuntimeError"))


class TestProjectSchemes(unittest.TestCase):
    """The two scheme files in verfahren/ (A-10) under the S1-07 rules."""

    ROOT = os.path.dirname(os.path.dirname(os.path.dirname(HERE)))

    def test_hk71_schemes(self):
        cases = (("3x2x5-r25-hk71.json", "ANGENOMMEN 3x2x5-r25-hk71 3x2x5 rank=25 ring=Z"),
                 ("3x2x6-r30-hk71.json", "ANGENOMMEN 3x2x6-r30-hk71 3x2x6 rank=30 ring=Z"))
        for name, expected in cases:
            path = os.path.join(self.ROOT, "verfahren", name)
            if not os.path.exists(path):
                self.skipTest("verfahren/ not present")
            code, lines = pruefer.check_file(path)
            self.assertEqual((code, lines), (0, [expected]))


if __name__ == "__main__":
    unittest.main()
