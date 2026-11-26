# S3-08: Einschätzung für 3×2×7 bei Länge 34

- Auftrag: S3-08 (Stufe 3, Runde 2, Erkundung nach Protokoll 0.5, Abschnitt 3), im Auftrag des Orchestrators. Rolle: Erkunder.
- Datum: 26.11.2026
- Zweck: die Einschätzung, die das Fertig-Kriterium von Stufe 3 für das Format 3×2×7 verlangt. Die Datei fasst die Berichte aus Runde 1 zusammen und schätzt ein. Sie beweist nichts Neues und prüft nichts.
- **Status aller Aussagen:** behauptet (aus den Berichten übernommen oder eigene Kontrollrechnung) oder ausdrücklich vermutet. Nichts hier ist geprüft. Den Status setzt nur der Orchestrator.
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md` (Abschnitte 1 bis 4), `STATUS.md`, `LOG.md` (Ende), `erkundung/s3-03-restfaelle-327.md`, `erkundung/s3-04-restfaelle-327.md`, `erkundung/s3-04-restfaelle-327.py`, `erkundung/s3-05-uebertragung.md`; in `versuche/`, `lit/QUELLEN.md` und `lit/WACHE.md` nach 3×2×7 gesucht (kein früherer Versuch zu dieser Frage, nur Tabellenzeilen). Keine Dateien s3-07 oder s3-09, keine Dateien zu 4×2×5 außer den Abschnitten von S3-05, die beide Formate gemeinsam behandeln.
- Kein Subagent, keine Fremdmodell-Anfrage, kein Kontakt nach außen, nichts ins Projektgedächtnis geschrieben. Eingeblendet wurden mir der Gedächtnisindex und zwei Einzeleinträge zu Verfahrensdateien und zur Lean-Datei für 3×2×6 (Datei- und Technikhinweise). Ich habe sie nicht benutzt.
- Rechenaufwand: drei Kontrollläufe (Abschnitt 1.4), zusammen unter 5 Sekunden auf einem Kern.

---

## 0. Ergebnis in Kürze

1. **Restfälle:** Beide Rechnungen (S3-03, S3-04) finden in der Rolle (n, m) = (3, 7) genau **einen** Restfall, (ρ, rk L, rk H) = **(4, 6, 4)**, und in der transponierten Rolle (7, 3) **201** Tripel, die nichts einschränken. Die Listen stimmen Tripel für Tripel überein (Kontrolle in 1.4). Ohne Yangs Lemma I für n = 3 sind es in beiden Rechnungen zwei Fälle, dazu (3, 5, 3).
2. **Lean-Kette:** Übertragbar ist der Unterbau (Normalform, Yangs Ungleichungen, Lemma 13, der Kern von Lemma 13′, Yangs Satz 1 als Minimalität), Lemma K, das Klassenzählen aus Lemma Z, der Gradsatz `deg_eq_one` und `transp`. Nicht übertragbar ist alles ab Satz B. Nach S3-05 sind etwa 7 200 der 8 753 Zeilen der Kette fest auf 4×2×4 oder auf n = m gebaut.
3. **Abzählargument:** Rechnerisch würde es aufgehen (17 verschiedene Punkte gegen höchstens 13 Schnittpunkte, Bedarf 14). Es kommt im Restfall aber **nicht zum Zug**, weil dort der gemeinsame Kern N dreidimensional ist und die Zählung N = 0 voraussetzt.
4. **Empfehlung: „Angriff lohnt“**, aber nur in einer engen Form: kein Übertrag der Kette, sondern ein neuer, kurzer Angriff auf den einen starren Restfall, in beide Richtungen (Widerspruch oder Verfahren mit 34), und erst, nachdem ein Prüfer die Restfall-Rechnung nach Abschnitt 5 bestätigt hat. Begründung in Abschnitt 4.

---

## 1. Restfälle: beide Rechnungen nebeneinander

### 1.1 Rahmen

Beide Rechnungen verallgemeinern die Ganzzahl-Bedingungen aus Satz A (Stufe 2, 4×2×4 bei 25) auf ⟨n,2,m⟩ bei Länge r, mit d = n − 1, q = dim Q = r − (n+1)m, und zählen alle ganzzahligen Tripel (ρ, rk L, rk H), die übrig bleiben. Beide nehmen für n = 3 Yangs Lemma I dazu und weisen die Zahl mit und ohne Lemma I aus. Beide haben eigene Programme:

| | S3-03 (PR 96) | S3-04 (PR 95) |
|---|---|---|
| Programm | im Bericht, Anhang A (`restfaelle.py`) | `erkundung/s3-04-restfaelle-327.py`, SHA-256 `83de52bc…a4711` (stimmt mit dem Bericht überein, nachgerechnet) |
| Probe an 4×2×4, r = 25 | genau die vier Fälle aus Satz A (B-008), mit s-Tabelle aus Lemma 13′ | dasselbe, dazu mit Satz-B-Filter genau die zwei Fälle aus B-009 |
| weitere Kontrollen | kein Fall bei 4×2×4/24, 3×2×7/33, 3×2×6/29, 4×2×5/30; gemessene Werte echter Verfahren für 3×2×5/25 und 3×2×6/30 liegen in der Liste | kleinste zulässige Länge gleich Yangs Schranke für 3×2×5, 3×2×6, 3×2×7, 4×2×4, 4×2×5, 5×2×5; Werte dreier Verfahren der Länge 26 für 4×2×4 und der Hopcroft-Kerr-Verfahren für 3×2×5 und 3×2×6 werden nicht verletzt |
| benutzte Bedingungen | (2), L8′, L15a, L15b, L14, L13, L11, triviale Schranken, LI | B1 bis B9 (dieselben wie links, L13 in der Form von Lemma 13′ mit s), für n = 3 zusätzlich C1 (rk H = ρ + s) und C2 (= LI) |

### 1.2 Rolle (n, m) = (3, 7), q = 6, d = 2

| | S3-03 | S3-04 | übereinstimmend? |
|---|---|---|---|
| Restfälle mit Lemma I | **1:** (ρ, rk L, rk H) = (4, 6, 4) | **1:** (4, 6, 4) | ja |
| Restfälle ohne Lemma I | 2: (3, 5, 3) und (4, 6, 4) | 2: (3, 5, 3) und (4, 6, 4) | ja |
| s | s = 0 | s = 0 | ja |
| dim N, Δ, dim S | 3, 2, 1 | 3, 2, 1 | ja |
| scharfe Stellen | (2) ist Gleichung, L surjektiv auf Q, Φ surjektiv, Lemma H und Lemma B mit Gleichheit | dasselbe, dazu: Yangs Schlussrechnung 5r = 170 = 24m + 2 mit Gleichheit | ja |
| ker jeder Kombination vom Rang 4 | = N, die F_i faktorisieren über U/N (Dimension 4) nach Q (Dimension 6) | ker F_1 = N, dieselbe Faktorisierung | ja |

**Liste der Restfälle in dieser Rolle:** R-327 = (ρ, rk L, rk H) = (4, 6, 4), mit s = 0, dim N = 3, Δ = 2, dim S = 1, dim ker L = 8.

Die Handrechnungen der beiden Berichte gehen verschiedene Wege. S3-03 schließt die Kandidaten (4, 2) und (6, 3) mit Lemma 15(b) aus, S3-04 mit Lemma I (dort ist Δ = 0). Das Ergebnis ist dasselbe. Die Ablation in S3-03 (Abschnitt 5.3) zeigt, was den einen Fall erzwingt: Lässt man (2), L13, L15a, L15b oder Lemma I einzeln weg, bleiben 40, 3, 2, 2 bzw. 2 Fälle. **Der eine Restfall hängt also an Lemma 15(b) bei d = 2 und an Lemma I**, den beiden Stellen, die die Probe an 4×2×4 nicht abdeckt (siehe 1.5).

### 1.3 Transponierte Rolle (n, m) = (7, 3), q = 10, d = 6

| | S3-03 | S3-04 | übereinstimmend? |
|---|---|---|---|
| Restfälle (Tripel) | 201 | 201 | ja, Tripel für Tripel (1.4) |
| mit s gezählt | Schranke s_max je Tripel | 666 Quadrupel | ja (Summe der s-Bereiche aus S3-03 ergibt ebenfalls 666, 1.4) |
| Verteilung | ρ ∈ {2, 3}, rk L ∈ {6, …, 10}, rk H von 18 bis 45 | dieselbe Tabelle | ja |
| kleinste Länge mit Restfall | 30 (11 Fälle) | 30 (11 Tripel) | ja |
| Grund | (2) hat Spielraum 42 und greift nie, Lemma 14 gilt nicht (m = 3 < d = 6), Lemma I gibt es nur für n = 3 | dasselbe | ja |

Beide Berichte folgern: Die Rolle (7, 3) liegt unter der bekannten Schranke 34 und liefert für Länge 34 keine Einschränkung. Ihre 201 Tripel gelten zusätzlich, sind aber ohne Information. S3-04 nennt die Restliste für das Paar beider Rollen 1 × 201, weil keine Kopplung zwischen den Kenngrößen beider Rollen bekannt ist. Die obere Grenze rk H ≤ 6·rk L, die die Zahl 201 mitbestimmt, steht nicht in Satz A. Beide Berichte nehmen sie als offensichtlich dazu. Ohne sie wären es mehr Tripel (S3-03: 225; meine Nachrechnung mit dem Code aus S3-05, der auch L11 nicht benutzt: 275). An der Aussage „Rolle (7, 3) trägt nichts“ ändert das nichts.

### 1.4 Eigene Kontrollrechnung

Ich habe beide Programme laufen lassen, das aus S3-03 aus dem Anhang des Berichts herausgeschnitten, und dazu die Kopfrechnung aus S3-05 (Abschnitt 4.4 dort), die keine der beiden Restfall-Rechnungen ist:

```
role (7,3): S3-03 201  S3-04 201  equal: True
role (3,7): S3-03 [(4, 6, 4)]
S3-05 (3,7,34): [(4, 6, 4, 0)]
S3-05 (7,3,34) without triv bounds: 275  superset of 201: True
r  S3-03 (3,7)  S3-03 (7,3)  S3-05 (3,7)
33   0          162          0
34   1          201          1
35  26          234         26
36  51          247         85
```

Dazu: Summe der s-Bereiche aus S3-03 in Rolle (7, 3) gleich 666 (wie S3-04), kleinste Länge mit Restfall 34 in Rolle (3, 7) und 30 in Rolle (7, 3) (wie beide Berichte). Die Abweichung bei r = 36 zwischen S3-03 und S3-05 kommt daher, dass die Kopfrechnung aus S3-05 L11 und die trivialen Schranken nicht benutzt. Für Länge 34 spielt sie keine Rolle.

Die Kontrolle zeigt nur, dass die Programme dasselbe ausgeben. Sie sagt nichts darüber, ob die Bedingungen richtig aus Prosa und Lean übertragen sind.

### 1.5 Offene Punkte der Restfall-Rechnung

Ich glätte hier nichts. Beide Rechnungen stimmen überein, aber:

1. **Sie sind nur im Programm unabhängig, nicht in der Quelle.** Beide haben die Bedingungen aus denselben Prosa-Dateien (`yang_n4.md`, `yang_n3.md`, `s2_444_spurA_r2.md`) und denselben Lean-Signaturen von Hand übertragen. Ein gemeinsamer Lesefehler würde in beiden Programmen gleich stehen.
2. **Lemma 15(b) bei d = 2** ist für den einen Restfall unverzichtbar (ohne: zusätzlich (3, 6, 4)). In der Kette zu 4×2×4 war es ohne Wirkung und wurde für d = 2 noch nirgends benutzt. Der Lean-Satz `YangN4Haupt.lemma15b` deckt d = 2 formal ab (`2 ≤ d`), braucht einen algebraisch abgeschlossenen Körper (S3-03, Abschnitt 7, Punkt 1).
3. **Lemma I** ist ebenfalls unverzichtbar (ohne: zusätzlich (3, 5, 3)). Es steht in einem anderen Rahmen (`yang_n3.md`, `YangN3Teil3.lean`, eigener Namensraum) als die übrigen Bedingungen (`yang_n4.md`, `YangN4Haupt.lean` mit d = 2). Eine Lean-Brücke zwischen beiden Rahmen gibt es nicht (S3-03, Abschnitt 7, Punkt 2; S3-05, Tabelle 2.1). Die Probe 3 aus S3-04 (kleinste zulässige Länge gleich Yangs Schranke für 3×2×5, 3×2×6, 3×2×7) stützt die Fassung von Lemma I zahlenmäßig, ersetzt aber keine Prüfung.
4. **Lesart der „Fallunterscheidung aus Stufe 2“.** Lemma I gehört nicht zu Satz A, sondern zu Yangs Beweis für n = 3. Wer nur die Bedingungen von Satz A zählt, erhält 2 Restfälle, mit Lemma I 1. Beide Berichte weisen beide Zahlen aus. Für die Einschätzung nehme ich 1, weil die Schranke 34 aus genau diesem Beweis kommt; die Zahl 2 gehört aber mit in die Liste:
   - mit Lemma I: {(4, 6, 4)}
   - nur mit den Bedingungen aus Satz A: {(3, 5, 3), (4, 6, 4)}
5. **Kein Prüfer** hat bisher eine der beiden Rechnungen gesehen.

---

## 2. Lean-Kette zu 4×2×4: was sich überträgt

Quelle ist allein S3-05 (Tabellen 2.1 bis 2.5 und Abschnitt 5). Die Angaben über den Inhalt der Lean-Dateien sind dort Lesebefunde, ich habe die Lean-Dateien nicht selbst gelesen.

### 2.1 Übertragbar

| Teil | Datei | Anmerkung für 3×2×7 |
|---|---|---|
| Rangbegriff, `tensorRank` | `Basic.lean` | allgemein |
| Normalform, Yangs Ungleichungen (`ineq1`, `lemma8'`, `lemma14`, `lemma15a`, `lemma15b`) | `YangN4Haupt.lean` | allgemein in d, m, r; mit d = 2 benutzbar |
| Lemma 13 | `YangN4Lemma13.lean` | allgemein in d |
| Kern von Lemma 13′ | `Lemma13Prime.lean` | allgemein in e + 2 Abbildungen, für 3×2×7 e = 0 einsetzen (gering) |
| Yangs Satz 1 als Minimalität (keine Zerlegung der Länge 33) | `Statements.lean` | allgemein; liefert die Voraussetzung (Z1) von Lemma Z |
| Satz A | `SatzA444.lean` | Beweise sind `omega` über allgemeinen Ungleichungen, Zahlen fest; neu instanziieren ist gering, **Lemma I aus `YangN3Teil3.lean` anbinden ist mittel** |
| Lemma K, Folgerung K1 | `LemmaK444.lean` (Kern) | allgemein in n, jeder Körper |
| Klassenzählen `viele_klassen`, `mergeAlg` | `LemmaZ444.lean` (Teil) | allgemein in r |
| Gradsatz `deg_eq_one` | `SatzF444.lean` (Teil) | allgemein in den Graden |
| Transposition `transp` | `Transponiert444.lean` (Teil) | allgemein in n, m, r |
| Basiswechsel R1, Technik des generischen Punkts | `Endsatz444.lean`, `SatzC444Generisch.lean` | Technik allgemein, Ausführung instanziiert mit n = m = 4 (mittel) |

Bilanz nach S3-05: Unterbau 2 261 Zeilen ganz allgemein; von den 8 753 Zeilen der Kette von `SatzA444` bis `Transponiert444` etwa 1 500 formatfrei.

### 2.2 Nicht übertragbar

| Teil | Grund (nach S3-05) |
|---|---|
| Satz B (Lemma V, Lemma S) | Symmetrie als Isomorphismus K⁴ ≅ K⁴ zwischen a- und b-Seite, setzt n = m voraus; Lemma S rechnet in `K[x₀,…,x₃]`. Bei 3×2×7 liefert ein gemeinsamer Kernvektor nur eine injektive Abbildung g : K³ → K⁷ („halbsymmetrisch“). S3-03 (7.6) und S3-04 (6.1) sagen dasselbe unabhängig: Lemma V braucht dim U = n und m − ρ = 1, im Restfall ist n = 3 ≠ 7 = m und m − ρ = 3 |
| Satz C | Quadrikzählung bräuchte dim Ĵ < dim Sym²(K³) = 6, im Restfall ist dim Ĵ = m + rk L = 13. Trägt nicht |
| Lemma P, Satz E | leben davon, dass der Kern von F_γ eindimensional ist (dim U − ρ = 1); im Restfall 7 − 4 = 3 |
| Satz F (außer `deg_eq_one`) | Kubiken auf beiden Seiten, `Sym³`, ein G ∈ GL₄, braucht n = m |
| Brücke | überträgt gerade die Nichtsymmetrie von Satz B |
| `Transponiert444` (außer `transp`) | wendet Satz A bis Lemma P auf die Transponierte im selben Format an. Bei 3×2×7 ist die Transponierte ⟨7,2,3⟩, dort fehlt sogar Lemma 14, und die Fallliste hat 201 Tripel (1.3) |

**Zusammengefasst:** Übertragbar ist das, was zu Yangs Satz und zu Satz A gehört, dazu einige allgemeine Werkzeuge. Alles, was bei 4×2×4 die Restfälle tatsächlich ausgeschlossen hat, ist nicht übertragbar.

---

## 3. Das Abzählargument (Schnittpunkte gegen verschiedene Punkte)

Quelle: S3-05, Abschnitte 3 und 4.3. Alles dort behauptet, Teile vermutet.

### 3.1 Die Zahlen

| | 4×2×4, r = 25 | 3×2×7, r = 34 |
|---|---|---|
| unten: verschiedene Punkte ⌈r/2⌉ nach Lemma Z | 13 | **17** |
| oben: Schnittpunkte (n−1)(m−1) + 1 nach Satz F | 10 | **13** |
| Bedarf in der Lean-Form (`VielePunkte`) | 11 | 14 |
| Reserve | 2 | 3 |

**Rechnerisch geht die Zählung auf**, mit mehr Reserve als bei 4×2×4. Ohne Lemma Z (nur dim span{a_t ⊗ b_t} ≤ 13) ginge sie nicht auf.

### 3.2 Voraussetzungen und Lage je Restfall

Die Zählung braucht an derselben Normalform: (Z1) Minimalität der Länge, (Z2) Lemma K, (Z3) rk L = dim Q, dazu für Satz F: kein gemeinsamer Kern (N = 0) und ein „enges Paar“ (ein F_γ vom Rang 1) auf der a-Seite und auf der b-Seite.

| Restfall | (Z1) | (Z3) rk L = dim Q | N = 0 | Lage |
|---|---|---|---|---|
| (4, 6, 4), Rolle (3, 7) | ja (Yang Satz 1) | ja (6 = 6) | **nein, dim N = 3 an jeder Normalform** | Zählung kommt nicht zum Zug |
| (3, 5, 3), nur ohne Lemma I | ja | nein (5 < 6) | nein, dim N = 4 | Zählung kommt nicht zum Zug |
| 201 Tripel, Rolle (7, 3) | ja | nur bei rk L = 10 (37 Tripel) | **die Berichte sagen dazu nichts** | offen; S3-05 behandelt diese Rolle nur als Gegenseite für das enge Paar auf der b-Seite |

**Ergebnis zu Frage 3 (behauptet):** Die Rechnung am Ende der Kette würde für 3×2×7 aufgehen, aber das Argument trägt nicht, weil der einzige Restfall der Rolle (3, 7) einen dreidimensionalen gemeinsamen Kern hat. Damit liegt jede Zerlegung der Länge 34 in dem Zweig, den bei 4×2×4 Satz B und Satz C erledigt haben, und genau diese Sätze übertragen sich nicht. Die Hürde ist also nicht die Zählung, sondern der „halbsymmetrische“ Zweig. Das sagt S3-05 auch für 4×2×5 (Abschnitt 5, „Gemeinsame Stelle“).

S3-05 vermutet zusätzlich (Abschnitt 3.4), dass man nach der Zählung statt Satz C eine Gradzählung n + m − 1 = 9 < 13 = dim ker W nehmen könnte. Für 3×2×7 ist das ohne Belang, solange N ≠ 0 erzwungen ist.

---

## 4. Empfehlung: Angriff lohnt (eng gefasst)

### 4.1 Was dafür spricht

1. **Ein einziger Restfall, und er ist starr.** Nach beiden Rechnungen bleibt in der Rolle (3, 7) genau ein Fall mit festen Kenngrößen. In ihm ist jede benutzte Ungleichung scharf, und die Berichte leiten daraus schon viel Struktur ab: L surjektiv auf Q, Ĵ = ker W, Φ surjektiv auf Q³, s = 0, N = ker G für jede Kombination G vom Rang 4 mit dim N = 3, F_1 und F_2 faktorisieren über U/N (Dimension 4) nach Q (Dimension 6), dim S = 1 und f_0(N) = span(f_0(v), f_1(v), f_2(v)). Bei 4×2×4 standen nach Satz A noch vier Fälle offen.
2. **Der Fall ist ein Entweder-oder.** Er schließt sich entweder durch einen Widerspruch aus (dann R(⟨3,2,7⟩) = 35, mit dem bekannten Verfahren der Länge 35), oder aus ihm entsteht ein Verfahren der Länge 34 (dann R(⟨3,2,7⟩) = 34). Beide Ausgänge bestimmen den Rang. Die Struktur aus Punkt 1 schränkt eine Verfahrenssuche stark ein, ein solcher Suchauftrag kostet wenig.
3. **Die Ausgangsrechnung steht schon in Lean.** Normalform, Ungleichungen, Yangs Satz 1, Satz A in der Form `omega` und Lemma K lassen sich nach S3-05 mit geringem bis mittlerem Aufwand übernehmen.

### 4.2 Was dagegen spricht

1. **Die Kette hilft beim eigentlichen Schritt nicht.** Alles, was bei 4×2×4 Fälle ausgeschlossen hat (Satz B bis Satz F), überträgt sich nicht (Abschnitt 2.2). Für den halbsymmetrischen Zweig mit n < m gibt es keine Idee im Repo außer dem Hinweis in S3-05 (4.3, vermutet): Die Abbildung (x, u) ↦ g_x(u), N ⊗ K³ → K⁷, schickt nach Transposition jedes b_t auf einen Tensor vom Rang 1. Das ist ein Ansatzpunkt, kein Plan.
2. **Der Fall ist genau der Gleichheitsfall von Yangs eigenem Beweis** (5r = 24m + 2). Yangs Methode endet hier. Wer ihn ausschließen will, braucht ein neues Argument.
3. **Die transponierte Rolle hilft nicht**, anders als bei 4×2×4, wo die Gegenseite dasselbe Format hatte.
4. **Die Grundlage ist ungeprüft.** Der eine Restfall hängt an Lemma 15(b) bei d = 2 und an Lemma I in einem anderen Rahmen (1.5). Ist eins davon falsch übertragen, sind es zwei Fälle.

### 4.3 Abwägung

Als **Übertragung der Lean-Kette lohnt der Angriff nicht**. Darin sind sich S3-05 und diese Einschätzung einig. Als **neuer, eng begrenzter Angriff auf den einen Restfall R-327 lohnt er**, weil eine Fallunterscheidung kaum günstiger enden kann als mit einem starren Fall, und weil beide Ausgänge den Rang bestimmen. Ob ein Angriff Erfolg hat, kann diese Erkundung nicht sagen. Es gibt keinen Hinweis, in welche Richtung der Fall ausgeht.

Wenn Justus eine neue Stufe beschließt, schlage ich vor (vermutet, nur als Vorschlag):

1. **Zuerst Prüfung** der Restfall-Rechnung nach Abschnitt 5, mit Schwerpunkt auf Lemma 15(b) bei d = 2 und der Übertragung von Lemma I auf die Normalform aus `YangN4Haupt`.
2. **Zwei Spuren** wie in Stufe 2: ein Prosa-Versuch, R-327 auszuschließen (Einstieg über den halbsymmetrischen Zweig und die Struktur aus 4.1, Punkt 1), und eine Verfahrenssuche nach Länge 34, die die erzwungenen Kenngrößen als Vorgabe benutzt.
3. **Kurzes Budget mit klarer Abbruchregel.** Lean erst, wenn ein Prosa-Beweis geprüft ist.

---

## 5. Statusübersicht

| Aussage | Status |
|---|---|
| Beide Rechnungen geben in Rolle (3, 7) genau den Fall (4, 6, 4), ohne Lemma I zusätzlich (3, 5, 3) | behauptet (Berichte S3-03, S3-04; Programmausgaben von mir nachgerechnet) |
| Beide Rechnungen geben in Rolle (7, 3) dieselben 201 Tripel | behauptet (Kontrolle in 1.4) |
| Struktur des Restfalls (s = 0, dim N = 3, dim S = 1, Surjektivitäten) | behauptet (S3-03, S3-04) |
| Übertragbare und nicht übertragbare Teile der Lean-Kette | Lesebefund aus S3-05, behauptet |
| Zahlen 17 gegen 13 und Ausfall des Abzählarguments wegen dim N = 3 | behauptet (S3-05) |
| Gradzählung als Ersatz für Satz C, halbsymmetrischer Ansatzpunkt | vermutet (S3-05) |
| Empfehlung und Vorschlag in Abschnitt 4 | vermutet |
