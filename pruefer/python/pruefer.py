#!/usr/bin/env python3
"""Checker 1 (task A-08): verifies a bilinear matrix multiplication scheme.

Reads one scheme file in the format of verfahren/README.md (format version 1)
and checks with exact arithmetic (integers, fractions.Fraction, or integers
mod p; never floating point) that the products compute C = A * B.

Usage:   python3 pruefer.py <file.json>

Output (stdout), first line exactly one of
    ANGENOMMEN <id> <n>x<k>x<m> rank=<rank> ring=<ring>
    ABGELEHNT <id> <reason>
    FEHLERHAFT <file name> <reason>
followed by optional hint lines. Exit code 0 / 1 / 2 respectively; exit
code 3 means a bug in this program itself, not a verdict on the file.

Standard library only. Messages are German, as the project requires.
Edge cases follow section 9 of verfahren/README.md (task S1-07).
"""

import datetime
import fractions
import json
import os
import re
import sys

# Section 9.5.4: no size limit for integers. Python limits str -> int
# conversion (also inside json) to 4300 digits by default and would raise
# ValueError; lift the limit for this process.
if hasattr(sys, "set_int_max_str_digits"):
    sys.set_int_max_str_digits(0)

ACCEPTED, REJECTED, MALFORMED = 0, 1, 2
INTERNAL_ERROR = 3   # program bug, not a verdict on the file

TOP_REQUIRED = ("format_version", "id", "n", "k", "m", "rank", "ring", "origin", "products")
TOP_OPTIONAL = ("claim", "notes")
ORIGIN_REQUIRED = ("source", "method", "created", "created_by")
ORIGIN_OPTIONAL = ("derived_from",)
PRODUCT_KEYS = ("u", "v", "w")

# All patterns are used with fullmatch() and spell digits as [0-9], so that
# neither a trailing newline nor non-ASCII digits can match (sections 9.3,
# 9.4.2, 9.5.1, 9.6.1). re.ASCII is set for good measure.
COEFF_RE = re.compile(r"-?(0|[1-9][0-9]*)(/[1-9][0-9]*)?", re.ASCII)
RING_GF_RE = re.compile(r"GF\(([1-9][0-9]*)\)", re.ASCII)
ID_RE = re.compile(r"([1-9][0-9]*)x([1-9][0-9]*)x([1-9][0-9]*)-r([1-9][0-9]*)-([a-z0-9]+(-[a-z0-9]+)*)", re.ASCII)
DATE_RE = re.compile(r"([0-9]{4})-([0-9]{2})-([0-9]{2})", re.ASCII)

# Section 9.2.4: a string must contain a character other than these four.
BLANK_CHARS = " \t\n\r"
# Section 9.6.2: GF(p) only for p < 2**64.
GF_P_LIMIT = 2 ** 64

MAX_LISTED_VIOLATIONS = 10
# Miller-Rabin with the first 13 primes as bases is deterministic below this
# bound, which is far above GF_P_LIMIT (section 9.6.2: no randomised test).
MR_DETERMINISTIC_LIMIT = 3317044064679887385961981
MR_BASES = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41)


class Malformed(Exception):
    """File unusable (steps 1 to 6 of verfahren/README.md, section 6)."""


# ---------------------------------------------------------------- number theory

def is_prime(p):
    """Exact primality test for p < MR_DETERMINISTIC_LIMIT; raises above it."""
    if p < 2:
        return False
    for q in MR_BASES:
        if p % q == 0:
            return p == q
    if p >= MR_DETERMINISTIC_LIMIT:
        raise ValueError("zu groß für einen sicheren Primzahltest")
    d, s = p - 1, 0
    while d % 2 == 0:
        d //= 2
        s += 1
    for a in MR_BASES:
        x = pow(a, d, p)
        if x in (1, p - 1):
            continue
        for _ in range(s - 1):
            x = x * x % p
            if x == p - 1:
                break
        else:
            return False
    return True


def prime_factors(n):
    """Prime factors of n >= 1 by trial division up to 10**6.

    Returns (sorted set of primes, leftover). leftover is 1 if fully factored,
    otherwise a cofactor whose factors are all > 10**6 (reported as is).
    """
    primes = set()
    d = 2
    while d * d <= n and d <= 10 ** 6:
        while n % d == 0:
            primes.add(d)
            n //= d
        d += 1 if d == 2 else 2
    if n > 1:
        if n <= 10 ** 12:
            # no factor <= 10**6 and n <= 10**12, so n is prime
            primes.add(n)
            n = 1
        else:
            try:
                if is_prime(n):
                    primes.add(n)
                    n = 1
            except ValueError:
                pass
    return sorted(primes), n


# ---------------------------------------------------------------- JSON loading

def _no_duplicates(pairs):
    obj = {}
    for key, value in pairs:
        if key in obj:
            raise Malformed("doppelter Schlüssel %r" % key)
        obj[key] = value
    return obj


def _reject_constant(name):
    raise Malformed("ungültige JSON-Konstante %s" % name)


def _reject_float(text):
    raise Malformed("Gleitkommazahl %s nicht erlaubt" % text)


def _reject_lone_surrogates(value):
    """Section 9.1.3: json.loads lets "\\ud800" through; we do not.

    Valid surrogate pairs are already combined into one code point by the
    decoder, so any remaining code point U+D800..U+DFFF is a lone surrogate.
    Walks the tree iteratively (no recursion limit involved).
    """
    stack = [value]
    while stack:
        item = stack.pop()
        if isinstance(item, str):
            strings = (item,)
        elif isinstance(item, dict):
            strings = item.keys()
            stack.extend(item.values())
        elif isinstance(item, list):
            strings = ()
            stack.extend(item)
        else:
            continue
        for s in strings:
            if any("\ud800" <= c <= "\udfff" for c in s):
                raise Malformed("einzelnes Surrogat in einer Zeichenkette")


def load_json(path):
    try:
        with open(path, "rb") as fh:
            raw = fh.read()
    except OSError as exc:
        raise Malformed("Datei nicht lesbar: %s" % (exc.strerror or exc))
    if raw.startswith(b"\xef\xbb\xbf"):
        raise Malformed("Byte-Order-Mark am Anfang der Datei")
    try:
        text = raw.decode("utf-8", errors="strict")
    except UnicodeDecodeError:
        raise Malformed("kein gültiges UTF-8")
    try:
        doc = json.loads(
            text,
            object_pairs_hook=_no_duplicates,
            parse_constant=_reject_constant,
            parse_float=_reject_float,
        )
    except json.JSONDecodeError as exc:
        raise Malformed("kein gültiges JSON (Zeile %d, Spalte %d): %s" % (exc.lineno, exc.colno, exc.msg))
    except RecursionError:
        raise Malformed("JSON zu tief verschachtelt")
    _reject_lone_surrogates(doc)
    return doc


def _is_int(x):
    return isinstance(x, int) and not isinstance(x, bool)


def _check_text(value, where):
    """Sections 9.2.3 and 9.2.4: a string with at least one visible character."""
    if not isinstance(value, str):
        raise Malformed("%s ist keine Zeichenkette" % where)
    if all(c in BLANK_CHARS for c in value):
        raise Malformed("%s ist leer oder besteht nur aus Leerraum" % where)


def check_date(text):
    """Section 9.3: YYYY-MM-DD, ASCII digits, valid Gregorian date, year >= 1."""
    match = DATE_RE.fullmatch(text)
    if not match:
        raise Malformed("origin.created %r ist nicht im Format JJJJ-MM-TT" % text)
    year, month, day = (int(g) for g in match.groups())
    try:
        datetime.date(year, month, day)   # proleptic Gregorian, years 1..9999
    except ValueError:
        raise Malformed("origin.created %r ist kein gültiges Kalenderdatum" % text)


# ---------------------------------------------------------------- steps 1 to 6

def check_structure(doc):
    """Step 1: required fields present, types right, no unknown keys."""
    if not isinstance(doc, dict):
        raise Malformed("oberste Ebene ist kein JSON-Objekt")
    for key in TOP_REQUIRED:
        if key not in doc:
            raise Malformed("Pflichtfeld %s fehlt" % key)
    for key in doc:
        if key not in TOP_REQUIRED and key not in TOP_OPTIONAL:
            raise Malformed("unbekannter Schlüssel %r auf oberster Ebene" % key)
    if not _is_int(doc["format_version"]):
        raise Malformed("format_version ist keine Ganzzahl")
    if not isinstance(doc["id"], str):
        raise Malformed("id ist keine Zeichenkette")
    for key in ("n", "k", "m", "rank"):
        if not _is_int(doc[key]) or doc[key] < 1:
            raise Malformed("%s ist keine Ganzzahl >= 1" % key)
    if not isinstance(doc["ring"], str):
        raise Malformed("ring ist keine Zeichenkette")
    for key in TOP_OPTIONAL:
        if key in doc:
            _check_text(doc[key], key)

    origin = doc["origin"]
    if not isinstance(origin, dict):
        raise Malformed("origin ist kein Objekt")
    for key in ORIGIN_REQUIRED:
        if key not in origin:
            raise Malformed("Pflichtfeld origin.%s fehlt" % key)
    for key, value in origin.items():
        if key not in ORIGIN_REQUIRED and key not in ORIGIN_OPTIONAL:
            raise Malformed("unbekannter Schlüssel %r in origin" % key)
        _check_text(value, "origin.%s" % key)
    check_date(origin["created"])
    if "derived_from" in origin and not ID_RE.fullmatch(origin["derived_from"]):
        raise Malformed("origin.derived_from %r hat nicht die Form einer id" % origin["derived_from"])

    products = doc["products"]
    if not isinstance(products, list):
        raise Malformed("products ist keine Liste")
    for r, prod in enumerate(products):
        if not isinstance(prod, dict):
            raise Malformed("products[%d] ist kein Objekt" % r)
        for key in PRODUCT_KEYS:
            if key not in prod:
                raise Malformed("products[%d].%s fehlt" % (r, key))
        for key in prod:
            if key not in PRODUCT_KEYS:
                raise Malformed("unbekannter Schlüssel %r in products[%d]" % (key, r))


def check_name(doc, file_name):
    """Step 3 and section 9.4: id equals file name, both match n, k, m, rank."""
    if not file_name.endswith(".json"):
        raise Malformed("Dateiendung ist nicht genau .json")
    stem = file_name[: -len(".json")]
    if doc["id"] != stem:
        raise Malformed("id %r ist nicht gleich dem Dateinamen ohne .json (%r)" % (doc["id"], stem))
    match = ID_RE.fullmatch(doc["id"])
    if not match:
        raise Malformed("id passt nicht zum Muster <n>x<k>x<m>-r<rank>-<kurzname> (Abschnitt 9.4.2)")
    n, k, m, rank = (int(g) for g in match.groups()[:4])
    if (n, k, m, rank) != (doc["n"], doc["k"], doc["m"], doc["rank"]):
        raise Malformed(
            "Dateiname nennt %dx%dx%d-r%d, Datei enthält n=%d k=%d m=%d rank=%d"
            % (n, k, m, rank, doc["n"], doc["k"], doc["m"], doc["rank"])
        )


def check_shapes(doc):
    """Step 5: u is n x k, v is k x m, w is n x m."""
    n, k, m = doc["n"], doc["k"], doc["m"]
    dims = {"u": (n, k), "v": (k, m), "w": (n, m)}
    for r, prod in enumerate(doc["products"]):
        for key in PRODUCT_KEYS:
            rows, cols = dims[key]
            mat = prod[key]
            if not isinstance(mat, list) or len(mat) != rows:
                raise Malformed("products[%d].%s hat nicht %d Zeilen" % (r, key, rows))
            for i, row in enumerate(mat):
                if not isinstance(row, list) or len(row) != cols:
                    raise Malformed("products[%d].%s[%d] hat nicht %d Einträge" % (r, key, i, cols))


def parse_ring(ring):
    """Returns ("Z", None), ("Q", None) or ("GF", p). Part of step 6."""
    if ring in ("Z", "Q"):
        return ring, None
    match = RING_GF_RE.fullmatch(ring)
    if not match:
        raise Malformed("unbekannter Zahlbereich %r (erlaubt: Z, Q, GF(p))" % ring)
    p = int(match.group(1))
    if p >= GF_P_LIMIT:
        raise Malformed("p in %s ist nicht kleiner als 2^64 (Abschnitt 9.6.2)" % ring)
    try:
        prime = is_prime(p)
    except ValueError as exc:
        raise Malformed("p in %s ist %s" % (ring, exc))
    if not prime:
        raise Malformed("p in %s ist keine Primzahl" % ring)
    return "GF", p


def parse_coefficients(doc, kind, p):
    """Step 6: every coefficient matches the pattern and fits the ring.

    Returns products as lists of (u, v, w) with values as int (Z), Fraction (Q)
    or int in range(p) (GF(p)).
    """
    out = []
    for r, prod in enumerate(doc["products"]):
        triple = []
        for key in PRODUCT_KEYS:
            mat = []
            for i, row in enumerate(prod[key]):
                vals = []
                for j, entry in enumerate(row):
                    where = "products[%d].%s[%d][%d]" % (r, key, i, j)
                    if not isinstance(entry, str):
                        raise Malformed("%s ist keine Zeichenkette" % where)
                    if not COEFF_RE.fullmatch(entry):
                        raise Malformed("%s = %r ist kein erlaubter Koeffizient" % (where, entry))
                    if "/" in entry:
                        if kind != "Q":
                            raise Malformed("%s = %r: Bruch im Zahlbereich %s nicht erlaubt" % (where, entry, doc["ring"]))
                        num, den = entry.split("/")
                        vals.append(fractions.Fraction(int(num), int(den)))
                    elif kind == "Q":
                        vals.append(fractions.Fraction(int(entry)))
                    elif kind == "GF":
                        vals.append(int(entry) % p)
                    else:
                        vals.append(int(entry))
                mat.append(vals)
            triple.append(mat)
        out.append(tuple(triple))
    return out


# ---------------------------------------------------------------- step 7

def find_violations(n, k, m, products, p):
    """Checks all (nk)(km)(nm) equations of section 2.

    Returns the list of violations as (i, j, j2, l, i2, l2, value, expected),
    in lexicographic order of the six indices. p is None outside GF(p).
    """
    violations = []
    for i in range(n):
        for j in range(k):
            for j2 in range(k):
                for l in range(m):
                    for i2 in range(n):
                        for l2 in range(m):
                            total = 0
                            for u, v, w in products:
                                total += u[i][j] * v[j2][l] * w[i2][l2]
                            if p is not None:
                                total %= p
                            expected = 1 if (i == i2 and j == j2 and l == l2) else 0
                            if total != expected:
                                violations.append((i, j, j2, l, i2, l2, total, expected))
    return violations


def describe_violation(viol):
    i, j, j2, l, i2, l2, value, expected = viol
    return "i=%d j=%d j'=%d l=%d i'=%d l'=%d Wert=%s erwartet=%d" % (i, j, j2, l, i2, l2, value, expected)


def hints(doc, kind, products):
    lines = []
    for r, triple in enumerate(products):
        for key, mat in zip(PRODUCT_KEYS, triple):
            if all(x == 0 for row in mat for x in row):
                lines.append("HINWEIS products[%d].%s ist ganz null (das Verfahren käme mit weniger Produkten aus)" % (r, key))
    if kind == "Q":
        dens = 1
        for triple in products:
            for mat in triple:
                for row in mat:
                    for x in row:
                        # lcm of all reduced denominators
                        dens = dens * x.denominator // _gcd(dens, x.denominator)
        primes, rest = prime_factors(dens)
        text = " ".join(str(q) for q in primes) if primes else "keine"
        line = "HINWEIS Primteiler der Nenner: %s" % text
        if rest != 1:
            line += " (nicht zerlegter Restfaktor %d)" % rest
        lines.append(line)
    return lines


def _gcd(a, b):
    while b:
        a, b = b, a % b
    return a


# ---------------------------------------------------------------- driver

def check_file(path):
    """Returns (exit code, list of output lines)."""
    file_name = os.path.basename(path)
    try:
        doc = load_json(path)                               # step 1
        check_structure(doc)                                # step 1
        if doc["format_version"] != 1:                      # step 2
            raise Malformed("format_version ist %d, erwartet 1" % doc["format_version"])
        check_name(doc, file_name)                          # step 3
        if doc["rank"] != len(doc["products"]):             # step 4
            raise Malformed("rank=%d, aber products hat %d Einträge" % (doc["rank"], len(doc["products"])))
        check_shapes(doc)                                   # step 5
        kind, p = parse_ring(doc["ring"])                   # step 6
        products = parse_coefficients(doc, kind, p)         # step 6
    except Malformed as exc:
        return MALFORMED, ["FEHLERHAFT %s %s" % (file_name, exc)]

    n, k, m = doc["n"], doc["k"], doc["m"]
    violations = find_violations(n, k, m, products, p)     # step 7
    extra = hints(doc, kind, products)
    if violations:
        total = n * k * k * m * n * m
        lines = ["ABGELEHNT %s %d von %d Gleichungen verletzt, erste: %s"
                 % (doc["id"], len(violations), total, describe_violation(violations[0]))]
        for viol in violations[1:MAX_LISTED_VIOLATIONS]:
            lines.append("VERLETZT " + describe_violation(viol))
        if len(violations) > MAX_LISTED_VIOLATIONS:
            lines.append("VERLETZT ... und %d weitere" % (len(violations) - MAX_LISTED_VIOLATIONS))
        return REJECTED, lines + extra
    head = "ANGENOMMEN %s %dx%dx%d rank=%d ring=%s" % (doc["id"], n, k, m, doc["rank"], doc["ring"])
    return ACCEPTED, [head] + extra


def main(argv):
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8", errors="backslashreplace")
    if len(argv) != 2:
        # Section 9.7.1: a dash instead of the file name.
        print("FEHLERHAFT - Aufruf: pruefer.py <datei.json> (genau ein Argument, erhalten: %d)" % (len(argv) - 1))
        return MALFORMED
    try:
        code, lines = check_file(argv[1])
    except Exception as exc:  # noqa: BLE001
        # A bug in this program must never look like ABGELEHNT (exit 1, the
        # default exit code of an uncaught Python exception).
        print("INTERNER-FEHLER %s %s: %s" % (os.path.basename(argv[1]), type(exc).__name__, exc))
        return INTERNAL_ERROR
    for line in lines:
        print(line)
    return code


if __name__ == "__main__":
    sys.exit(main(sys.argv))
