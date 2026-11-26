# S4-29: Rang von ⟨3,2,7⟩, unabhängiger Sucher, Runde 5

Rolle: unabhängiger Sucher (nicht blind, siehe Abschnitt 0). Gelesen im Repo: nur `CLAUDE.md`.
Alle eigenen Aussagen sind als **vermutet** oder **behauptet** gekennzeichnet. Status setzt der Orchestrator.

## 0. Offenlegung eingeblendeter Gedächtniseinträge

Beim Start eingeblendet: der Index `MEMORY.md` des Projektgedächtnisses („Projekt: Matrizen-Multiplikation“) mit den Verweisen `verfahren-datenformat` und `lean-project-ci` (nur Namen). Der Index enthält unter anderem die Formatliste des Projekts, die arXiv-Nummern 2609.14393 und 2609.22054, einen Hinweis auf die FMM-Lille-Seite zu 2x3x7 sowie Verfahrensregeln für Orchestrator und Prüfer.

Später während der Arbeit zusätzlich eingeblendet, vollständig: `gemini-bridge`, `aussagen-abgleich-n3`, `hk-verfahren-a10` (nennt Verfahrensdateien für 3x2x5 mit 25 und 3x2x6 mit 30 im Repo), `lean-upper-3x2x6` (nennt eine Lean-Datei für R(3x2x6) ≤ 30), `git-regeln`.

Ich habe nichts davon als Grundlage benutzt und keine der dort genannten Repo-Dateien geöffnet. Überschneidungen: Die beiden arXiv-Arbeiten und die FMM-Lille-Seite habe ich selbst über die Netzsuche bzw. die Startseite des Katalogs gefunden (Abschnitte 2 und 3). Wer meine Unabhängigkeit bewertet, sollte wissen, dass diese Quellen mir vorher als Namen bekannt waren. Ich habe keinen Gedächtniseintrag geschrieben. Netzsuchen liefen mit Ausschluss von github.com; Seiten dieses Repos sind dabei nicht erschienen.

## 1. Problemstellung

Gesucht ist R(⟨3,2,7⟩), der Tensorrang der Multiplikation einer 3×2- mit einer 2×7-Matrix, über einem beliebigen Körper K. Der Rang ist invariant unter Vertauschung der drei Formate, also R(⟨3,2,7⟩) = R(⟨2,3,7⟩) = R(⟨7,2,3⟩) usw.

**Ergebnis dieses Berichts:** 34 ≤ R(⟨3,2,7⟩) ≤ 35 über jedem Körper. Beide Schranken stammen aus der Literatur; ich habe sie nachgerechnet (Abschnitte 3 und 4.1). Eigener Beitrag: Eingrenzung des Falls R = 34 (Abschnitt 4.2), der den Fall nicht schließt. Die genaue Zahl bleibt offen.

## 2. Literatur


Gefunden über eine allgemeine Netzsuche (Suchanfragen wörtlich: „lower bound bilinear complexity multiplication n×2 by 2×m matrices Hopcroft Kerr optimal“ und „tensor rank 2x3x7 matrix multiplication 35 multiplications lower bound“, github.com ausgeschlossen, damit keine Seiten dieses Repos erscheinen). Offenlegung: Die beiden folgenden arXiv-Nummern stehen auch im eingeblendeten Gedächtnisindex (Abschnitt 0). Ich habe sie unabhängig davon über die Suche gefunden und lese sie als öffentliche Literatur.

- A. Tsyganov, U. Parkina, S. Samsonov, M. Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054v1 (18.9.2026). Satz 1: über jedem Körper ist R(⟨3,2,m⟩) > 24m/5. Ich habe den Beweis vollständig gelesen und Schritt für Schritt nachvollzogen (Abschnitt 4.1). Für m = 7 folgt R ≥ ⌈33,6⌉ = 34.
- J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393 (laut Tsyganov et al.: R(⟨3,2,m⟩) ≥ ⌈24m/5⌉, R(⟨n,2,m⟩) ≥ (n+2)m für n ≥ 4). Nicht selbst gelesen, nur aus dem Zitat bei Tsyganov et al. und der Suchzusammenfassung bekannt.
- J. E. Hopcroft, L. R. Kerr, SIAM J. Appl. Math. 20 (1971) 30–36: obere Schranke R(⟨p,2,n⟩) ≤ ⌈(3pn + max(p,n))/2⌉, für ⟨3,2,7⟩ also 35.
- Ja'Ja' und Takche (1985): über F₂ R(⟨3,2,m⟩) ≥ ⌈105m/23⌉, für m = 7 also 32. Bläser (1999): allgemeine Schranke, schwächer.

Stand der Literatur nach meiner Suche: 34 ≤ R(⟨3,2,7⟩) ≤ 35 über jedem Körper. Einen Beleg für die genaue Zahl habe ich nicht gefunden.

## 3. Obere Schranke: R(⟨3,2,7⟩) ≤ 35 über jedem Körper (behauptet)

**Eigenbau gescheitert** (Abschnitt 5, Ansatz A). Ich habe deshalb das öffentliche Verfahren ⟨2×3×7:35⟩ aus dem Katalog von A. Sedoglavic, https://fmm.univ-lille.fr/2x3x7.html, Datei `2x3x7_tensor.mpl.bz2` (abgerufen 26.11.2026, 13:04 UTC), geladen und selbst geprüft. Laut Katalogseite ist es die Summe ⟨2×3×3:15⟩ + ⟨2×3×4:20⟩, also eine Zerlegung entlang der 7 Spalten in 3 + 4 im Sinn von Hopcroft–Kerr.

Prüfung (eigenes Skript, unten vollständig): Die Datei wird nur als Text gelesen, die Zahlen werden per regulärem Ausdruck herausgezogen, nichts wird ausgeführt. Ergebnis:

```
rank 35 coefficients [-1, 0, 1]
exact identity over Z: True
```

Das heißt: Σ_{r=1}^{35} U_r ⊗ V_r ⊗ W_r = Σ A_ij B_jl C_li als Identität ganzzahliger Tensoren (A 2×3, B 3×7, C 7×2). Weil alle Koeffizienten in {−1,0,1} liegen und die Identität über ℤ gilt, gilt sie nach dem Ringhomomorphismus ℤ → K über jedem Körper K, jeder Charakteristik. Also R_K(⟨2,3,7⟩) ≤ 35 und damit R_K(⟨3,2,7⟩) ≤ 35. Status: **behauptet**, rechnerisch geprüft.

Die Daten selbst lege ich nicht ins Repo, weil ich die Lizenzregel (Protokoll 11.3) als Sucher nicht lesen darf. Wer prüft, lädt die Datei neu und lässt das Skript laufen.

```python
import re, sys, itertools, numpy as np
txt=open(sys.argv[1]).read()
body=txt[txt.index('TriadSet'):]
mats=re.findall(r'Matrix\((\d+), (\d+), (\[\[[-0-9,\[\] ]*\]\])\)',body)
M=[np.array([int(t) for t in re.findall(r'-?\d+',s)],dtype=np.int64).reshape(int(r),int(c)) for r,c,s in mats]
assert len(M)%3==0; R=len(M)//3
print('rank',R,'coefficients',sorted(set(int(x) for m in M for x in m.ravel())))
U,V,W=M[0::3],M[1::3],M[2::3]
T=np.zeros((2,3,3,7,7,2),dtype=np.int64)
for r in range(R): T+=np.einsum('ij,kl,mn->ijklmn',U[r],V[r],W[r])
E=np.einsum('jk,lm,ni->ijklmn',np.eye(3,dtype=np.int64),np.eye(7,dtype=np.int64),np.eye(2,dtype=np.int64))
print('exact identity over Z:',np.array_equal(T,E))
```

Aufruf: `python3 -I verify237.py 2x3x7_tensor.mpl` (nach `bunzip2`).

## 4. Untere Schranke

### 4.1 R(⟨3,2,7⟩) ≥ 34 über jedem Körper (behauptet, aus der Literatur nachvollzogen)

Satz 1 bei Tsyganov et al. (arXiv:2609.22054v1): R_K(⟨3,2,m⟩) > 24m/5. Ich habe jeden Schritt des Beweises gelesen und nachgerechnet. Er geht so (Bezeichnungen wie dort):

1. Reduktion auf unendliches K (Koeffizienten nach K(t) heben). Normierung (Lemma 1): Nach Spaltenwechsel [x, y+τx] und geeigneter Basis von K³ gilt α_i(E11) = 1 für alle i, und für jede „Klasse“ gleicher Paare (s_i, t_i) = (α_i(E21), α_i(E31)) spannen die α_i höchstens einen 2-dimensionalen Raum.
2. S = diag(s_i), T = diag(t_i), Z = diag(α_i(E12)), W(z) = Σ z_i C_i, H = ker W mit dim H = r − 3m. J = {(β_i(0;v))_i} ⊂ H mit dim J = m, X: J → K^r, (β_i(0;v)) ↦ (β_i(v;0)).
3. Aus den Matrixeinheiten folgt: SJ, TJ, (X−Z)J ⊂ H, und Za + SXu + TXv ∈ H nur für a = u = v = 0.
4. Lemma 2: 5h ≥ 9m mit h = dim H; bei Gleichheit gibt es ein nichttriviales S,T-invariantes F ⊂ J. Lemma 3 liefert dann einen gemeinsamen Eigenvektor y ∈ J, dessen Träger in einer Klasse liegt; das widerspricht Rang 3 der Abbildung A ↦ A(0;v).

Für m = 7: r − 21 = h ≥ 63/5, also h ≥ 13 und r ≥ 34. Einen Fehler habe ich nicht gefunden. Die Lean-Formalisierung (github.com/fallnlove/mm325_proof) habe ich nicht angesehen.

### 4.2 Eigener Beitrag: der Fall r = 34 (behauptet, mit Beweis; schließt den Fall nicht)

Angenommen r = 34, also m = 7, h = 13. Setze Q = H/J (dim Q = 6), π: H → Q, und auf J die Abbildungen σ = π∘S, τ = π∘T, χ = π∘(X − Z) (wohldefiniert nach 4.1 Schritt 3). Weiter A_s = ker σ, A_t = ker τ, F = A_s ∩ A_t = {y ∈ J : Sy, Ty ∈ J}, f = dim F, und K1 = {(u,v) ∈ J² : σu + τv = 0}.

Die Abbildung L(u,v,c) = (σu + τv, χu + τc, χv − σc) von J³ nach Q³ hat nach dem Beweis von Lemma 2 genau den Kern 0×0×F.

**Hilfssatz 1 (behauptet).** dim K1 ≤ 5 + f, dim K1 ≥ 8 und 3 ≤ f ≤ 5.

*Beweis.* L eingeschränkt auf K1 × J hat denselben Kern 0×0×F, und dort ist die erste Komponente null. Die beiden anderen Komponenten landen in Q² (dim 12). Also dim K1 + 7 − f ≤ 12. Weiter ist dim K1 = 14 − rang(σ,τ) ≥ 14 − 6. Die Schranken für f stehen schon bei Tsyganov et al. (Ungleichungen (6), (7)). ∎

**Hilfssatz 2 (behauptet).** Die Abbildung y ↦ (Ty, −Sy) ist auf F injektiv und bildet F nach K1 ab.

*Beweis.* Für y ∈ F gilt Ty, Sy ∈ J und σ(Ty) + τ(−Sy) = π(STy − TSy) = 0, weil S und T diagonal sind. Ist Ty = Sy = 0 mit y ≠ 0, so liegt der Träger von y in der Klasse (s,t) = (0,0), Widerspruch wie in 4.1 Schritt 4. ∎

**Satz A (behauptet): f = 5 ist unmöglich.**

*Beweis.* Für f = 5 gibt Hilfssatz 1 dim K1 ≤ 10. Aber K1 ⊇ A_s × A_t ⊇ F × F hat Dimension ≥ 10. Also K1 = F × F. Nach Hilfssatz 2 liegt (Ty, −Sy) für y ∈ F in F × F, d. h. SF ⊂ F und TF ⊂ F. F ≠ 0 ist S,T-invariant; Lemma 3 und der Schluss aus 4.1 Schritt 4 geben einen Widerspruch. ∎

(Allgemein zeigt dasselbe Argument: Der Fall f = 2h − 3m, also der größtmögliche Wert von f, ist für jedes m ausgeschlossen. Das verallgemeinert den Gleichheitsfall von Tsyganov et al.)

**Basiswechsel.** Ersetzt man die Zeilen 2 und 3 von A durch eine andere Basis von span(e2, e3), so werden (S,T) durch (aS + bT, cS + dT) mit ad − bc ≠ 0 ersetzt. Die Normierung aus Lemma 1 und die Klasseneinteilung bleiben erhalten (die Abbildung (s,t) ↦ (as+bt, cs+dt) ist bijektiv). F hängt nicht von der Basis ab. Über unendlichem K kann man deshalb annehmen, dass dim A_s = dim A_t = κ, wobei κ die Dimension von ker(σ + λτ) für allgemeines λ ist.

**Satz B (behauptet): Im Fall f = 4 gilt nach geeignetem Basiswechsel S' = S + cT (c ≠ 0):**
(a) dim A_{S'} = 5, A_T = F, und A' := A_{S'} = F ⊕ K·ũ0 ist S'-invariant;
(b) S' wirkt auf A' als Skalar λ0; T bildet F nach A' ab, aber F ist nicht T-invariant;
(c) F_2 := {y ∈ F : Ty ∈ F} hat Dimension 3.

*Beweis.* Allgemeine Basis: a_s = a_t = κ ≥ 4 und nach Hilfssatz 1 2κ + i ≤ 9 mit i = dim(im σ ∩ im τ) (es gilt dim K1 = a_s + a_t + i). Also κ = 4, A_s = A_t = F, i ≤ 1. Bei i = 0 ist K1 = F × F und F invariant wie in Satz A, Widerspruch. Also i = 1, K1 = F × F ⊕ K·(ũ0, ṽ0) mit ũ0, ṽ0 ∉ F. Nach Hilfssatz 2 gibt es eine Linearform φ auf F mit Ty ≡ φ(y) ũ0 und Sy ≡ −φ(y) ṽ0 modulo F.

Fall 1: ũ0, ṽ0 linear unabhängig modulo F. Für y ∈ ker φ sind Sy, Ty ∈ F, und aus TSy = STy folgt φ(Sy) ũ0 + φ(Ty) ṽ0 ∈ F, also φ(Sy) = φ(Ty) = 0. Damit ist ker φ (Dimension ≥ 3) S,T-invariant, Widerspruch wie oben.

Fall 2: ṽ0 ≡ c ũ0 modulo F, c ≠ 0. Aus σũ0 = −τṽ0 = −cτũ0 folgt (σ + cτ)ũ0 = 0. Mit S' = S + cT ist A_{S'} ⊇ F ⊕ Kũ0, also a_{S'} ≥ 5. Hilfssatz 1 in der Basis (S', T): 5 + 4 + i' ≤ 9, also a_{S'} = 5 und i' = 0. Dann ist K1' = A' × F und Hilfssatz 2 gibt S'F ⊂ F, TF ⊂ A'. Schreibe Ty ≡ φ'(y) ũ0 mod F. Wäre φ' = 0, wäre F S',T-invariant: Widerspruch. Aus S'Ty = TS'y folgt φ'(y) S'ũ0 ≡ φ'(S'y) ũ0 mod F; mit φ'(y0) = 1 ist S'ũ0 ∈ A', also A' S'-invariant: (a).

Zerlege nach den Eigenräumen E'_λ des Diagonaloperators S' (die Projektionen darauf sind Polynome in S', also zerfallen invariante Teilräume): F = ⊕ F_λ, A' = ⊕ A'_λ. T vertauscht mit S', also T F_λ ⊂ A'_λ. Wegen dim A' − dim F = 1 ist A'_λ = F_λ für alle λ bis auf eines, λ0. Für λ ≠ λ0 ist F_λ dann T-invariant, S' wirkt dort skalar, und jedes F_λ ≠ 0 enthielte einen gemeinsamen Eigenvektor von S' und T, also von S und T: Widerspruch. Also F = F_{λ0}, und dann auch A' = A'_{λ0}: (b). (c) ist ker φ' in Dimension 4 − 1. ∎

**Was fehlt (Lücken, ausdrücklich).**
1. Der Fall f = 4 ist mit Satz B nur auf eine starre Gestalt gebracht, nicht ausgeschlossen. Es fehlt ein Argument, dass J ∩ E'_{λ0} einen nichttrivialen T-invarianten Teilraum enthält. Benutzt habe ich bisher nur die Daten (S, T, Z, X, J, H) aus Tsyganov et al.; die Diagonaloperatoren zu E22, E32 und die Räume ZXJ, PXJ, QXJ ⊂ H (P, Q wie Z für E22, E32) gehen noch gar nicht ein. Vermutet: Mit ihnen lässt sich Satz B zum Widerspruch führen.
2. Der Fall f = 3 ist offen. Dort ist dim K1 = 8, rang(σ,τ) = 6, die zweite und dritte Zeile von L sind surjektiv auf Q², und ker φ hat Dimension ≥ 3 − i. Mögliche Verteilungen (a_s, a_t, i) ∈ {(3,3,2), (3,4,1), (4,3,1), (4,4,0), (3,5,0), (5,3,0)}; nach Basiswechsel nur noch a_s = a_t = κ ∈ {3,4}. Keiner dieser Fälle ist ausgeschlossen.
3. Satz A und Satz B setzen ein unendliches K voraus; das ist wie bei Tsyganov et al. durch Übergang zu K(t) gedeckt.

**Vermutung (vermutet):** R(⟨3,2,7⟩) = 35 über jedem Körper. Grund: Die Schranke 24m/5 ist für m = 5 scharf und für m = 7 nur um 1,4 unter der Hopcroft–Kerr-Zahl; der Fall f = 5 fällt nach Satz A, und der Fall f = 4 wird nach Satz B sehr starr. Das ist kein Beweis.

## 5. Gescheiterte Ansätze

- **Ansatz A, eigenes ganzzahliges Verfahren mit 35 (aufgegeben).** Plan: ⟨3,2,7⟩ = ⟨3,2,3⟩ ⊕ ⟨3,2,4⟩ entlang der Spalten von B, also 15 + 20, Teilverfahren numerisch finden und auf {−1,0,1} runden. Exakte reelle Zerlegungen von ⟨3,2,3⟩ mit Rang 15 fand Levenberg-Marquardt bei etwa jedem 20. Startwert, aber das schrittweise Runden (auf {−1,0,1}, auch mit vorherigem Nullsetzen kleiner Einträge und mit Z/3-symmetrischem Ansatz mit 5 Bahnen) blieb in jedem Lauf stecken. Simuliertes Abkühlen über Produkte mit höchstens zwei Variablen je Faktor fand zur Kontrolle nicht einmal Strassens ⟨2,2,2⟩ mit 7; die Methode ist zu schwach. Grund des Scheiterns: Die Lösungsmenge ist stark entartet, und einfache Rundung findet die ganzzahligen Punkte nicht. Ersetzt durch das geprüfte Katalogverfahren (Abschnitt 3).
- **Ansatz B, Hopcroft–Kerr von Hand herleiten (aufgegeben).** Versuche mit Strassen-Blöcken auf dem 3×3-Ausgaberaster (höchstens 17 statt 15), mit der Gauß-Dreiprodukt-Idee (keine Ersparnis) und mit der Determinantenform det(a,b) = (φ_s(a)φ_t(b) − φ_t(a)φ_s(b))/(t − s) (keine Ersparnis). Grund: Die Ersparnis bei Hopcroft–Kerr entsteht nur aus Teilung über das ganze Raster; ich habe die Konstruktion in der Zeit nicht rekonstruiert.
- **Ansatz C, Fall r = 34 vollständig ausschließen (nicht abgeschlossen).** Siehe 4.2: f = 5 fällt, f = 4 nur eingegrenzt, f = 3 offen.

## 6. Rechenblöcke und Verbrauch
- Block 1 (12:35–12:50 UTC, 1 Kern): numerische Suche (Levenberg-Marquardt mit Rundung auf {−1,0,1}) nach ganzzahligen Teilverfahren für ⟨3,2,3⟩ mit Rang 15. Exakte reelle Lösungen gefunden (etwa 1 von 20 Startwerten), das Runden auf ganze Zahlen ist in keinem Lauf gelungen. Kein Ergebnis.
- Block 2 (12:51–13:02 UTC, bis 4 Kerne): (a) simuliertes Abkühlen über Produkte mit Faktoren aus höchstens zwei Variablen und Koeffizienten ±1, (b) Levenberg-Marquardt mit Ansatz zyklischer Symmetrie (Z/3 auf Zeilen von A und Spalten von B, 5 Bahnen) und schrittweisem Runden. Keine ganzzahlige Lösung für ⟨3,2,3⟩ mit Rang 15 gefunden; Methode (a) fand zur Kontrolle nicht einmal Strassens ⟨2,2,2⟩ mit 7, ist also zu schwach. Ergebnis: Eigenbau der Teilverfahren aufgegeben, siehe Abschnitt 5.
- Block 3 (13:04 UTC, unter 1 Minute, 1 Kern): Prüfung des Katalogverfahrens, Ergebnis in Abschnitt 3.
- Verbrauch: keine Subagenten, keine Fremdmodell-Anfragen. Netzzugriffe: zwei Websuchen, ein Volltextabruf von arXiv:2609.22054 über alphaXiv, Abruf von fmm.univ-lille.fr (Startseite, 2x3x3.html, 2x3x4.html, 2x3x7.html, 2x3x7_tensor.mpl.bz2).
