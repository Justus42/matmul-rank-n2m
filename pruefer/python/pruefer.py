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
followed by optional hint lines. Exit code 0 / 1 / 2 respectively.

Standard library only. Messages are German, as the project requires.
"""

import fractions
import json
import os
import re
import sys

ACCEPTED, REJECTED, MALFORMED = 0, 1, 2

TOP_REQUIRED = ("format_version", "id", "n", "k", "m", "rank", "ring", "origin", "products")
TOP_OPTIONAL = ("claim", "notes")
ORIGIN_REQUIRED = ("source", "method", "created", "created_by")
ORIGIN_OPTIONAL = ("derived_from",)
PRODUCT_KEYS = ("u", "v", "w")

# Patterns use \Z instead of $ so that a trailing newline never matches.
COEFF_RE = re.compile(r"-?(0|[1-9][0-9]*)(/[1-9][0-9]*)?\Z")
RING_GF_RE = re.compile(r"GF\(([1-9][0-9]*)\)\Z")
FILE_RE = re.compile(r"([1-9][0-9]*)x([1-9][0-9]*)x([1-9][0-9]*)-r([1-9][0-9]*)-([a-z0-9-]+)\.json\Z")
DATE_RE = re.compile(r"[0-9]{4}-[0-9]{2}-[0-9]{2}\Z")

MAX_LISTED_VIOLATIONS = 10
# Miller-Rabin with the first 13 primes as bases is deterministic below this.
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


def load_json(path):
    try:
        with open(path, "rb") as fh:
            raw = fh.read()
    except OSError as exc:
        raise Malformed("Datei nicht lesbar: %s" % exc.strerror)
    try:
        text = raw.decode("utf-8", errors="strict")
    except UnicodeDecodeError:
        raise Malformed("kein gültiges UTF-8")
    try:
        return json.loads(
            text,
            object_pairs_hook=_no_duplicates,
            parse_constant=_reject_constant,
            parse_float=_reject_float,
        )
    except json.JSONDecodeError as exc:
        raise Malformed("kein gültiges JSON (Zeile %d, Spalte %d): %s" % (exc.lineno, exc.colno, exc.msg))
    except RecursionError:
        raise Malformed("JSON zu tief verschachtelt")


def _is_int(x):
    return isinstance(x, int) and not isinstance(x, bool)


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
        if key in doc and not isinstance(doc[key], str):
            raise Malformed("%s ist keine Zeichenkette" % key)

    origin = doc["origin"]
    if not isinstance(origin, dict):
        raise Malformed("origin ist kein Objekt")
    for key in ORIGIN_REQUIRED:
        if key not in origin:
            raise Malformed("Pflichtfeld origin.%s fehlt" % key)
    for key, value in origin.items():
        if key not in ORIGIN_REQUIRED and key not in ORIGIN_OPTIONAL:
            raise Malformed("unbekannter Schlüssel %r in origin" % key)
        if not isinstance(value, str):
            raise Malformed("origin.%s ist keine Zeichenkette" % key)
    if not DATE_RE.match(origin["created"]):
        raise Malformed("origin.created ist nicht im Format JJJJ-MM-TT")

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
    """Step 3: id equals file name, file name matches n, k, m, rank."""
    if not file_name.endswith(".json"):
        raise Malformed("Dateiendung ist nicht .json")
    stem = file_name[: -len(".json")]
    if doc["id"] != stem:
        raise Malformed("id %r ist nicht gleich dem Dateinamen ohne .json (%r)" % (doc["id"], stem))
    match = FILE_RE.match(file_name)
    if not match:
        raise Malformed("Dateiname passt nicht zum Muster <n>x<k>x<m>-r<rank>-<kurzname>.json")
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
    match = RING_GF_RE.match(ring)
    if not match:
        raise Malformed("unbekannter Zahlbereich %r (erlaubt: Z, Q, GF(p))" % ring)
    p = int(match.group(1))
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
                    if not COEFF_RE.match(entry):
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
        sys.stdout.reconfigure(encoding="utf-8")
    if len(argv) != 2:
        name = argv[1] if len(argv) > 1 else "-"
        print("FEHLERHAFT %s Aufruf: pruefer.py <datei.json> (genau ein Argument)" % os.path.basename(name))
        return MALFORMED
    code, lines = check_file(argv[1])
    for line in lines:
        print(line)
    return code


if __name__ == "__main__":
    sys.exit(main(sys.argv))
