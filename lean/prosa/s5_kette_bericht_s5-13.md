# Bericht S5-13: Prüfung der Glieder K-36 bis K-41

Rolle: Prüfer. Gegenstand: `lean/prosa/s5_327_kette.md`, Stand Commit `d6469d8`, Glieder K-36, K-37, K-38, K-39, K-40, K-41 und die „Prüfung der Quantoren“ (Zeilen 628 bis 752). Zeilenangaben beziehen sich auf diesen Stand. Die Glieder K-1 bis K-35 habe ich nach Auftrag mit ihrem Wortlaut als gegeben genommen und nicht geprüft. Dieser Bericht setzt keinen Status.

## 0. Offenlegung

**Aus dem Projektgedächtnis eingeblendet.** Zu Beginn der Sitzung war mir der Index des Projektgedächtnisses eingeblendet. Er enthält Projektregeln und Arbeitsanweisungen (Ziel des Projekts, Regeln für Orchestrator, Prüfer und unabhängige Sucher, Fremdmodell-Zugang, Literaturwache, Hinweise zum Mergen). Er enthält nach meiner Lesung kein Urteil und keinen Prüfstand zu einem Glied der Kette. Erwähnt sind die Begriffe „Stufe 4“ und „3×2×7“ als Gegenstand des Projekts. Im Lauf der Sitzung wurden mir zusätzlich zwei Einzeleinträge eingeblendet: einer über die Gemini-Bridge (Repo dort nicht freigegeben, Zeitlimit) und einer über die Bridge und einen lokalen Lean-Bau („Aussagen-Abgleich“, `import YangBounds.Statements`). Keiner davon enthält ein Urteil zu K-36 bis K-41.

**Aus dem Auftrag.** Der Auftrag nennt, dass andere Prüfer unabhängig an derselben Datei arbeiten, und nennt das Dateimuster `s5_kette_bericht_*`. Inhalte solcher Berichte habe ich nicht gesehen.

**Über die Positivliste hinaus gesehen.**
- Von `PROTOKOLL.md` habe ich zum Auffinden von Abschnitt 5 die Liste der Abschnittsüberschriften (Zeilen mit `## `) ausgegeben, also die Titel der Abschnitte 1 bis 11, nicht deren Inhalt.
- Um die Wortlaute der zitierten Glieder zu finden, habe ich aus den Zeilen 109 bis 627 die Überschriftenzeilen `### K-n (...)` aller Glieder K-1 bis K-35 mit Zeilennummern ausgegeben (nur diesen Zeilenbereich, nicht die gesperrten Zeilen). Ich habe also die Titel aller Glieder gesehen.
- Wortlaute (ohne Beweise) gelesen habe ich von K-1, K-2, K-4, K-5, K-6, K-8, K-11, K-12, K-18, K-22, K-23, K-24, K-30, K-32, K-33, K-34 (mit Bezeichnungen 𝒢_gen, 𝒢_3) und K-35. Davon werden K-2 (Polynome χ_ξ) nur in den Begriffen 1.4 und K-24 nur im Beweistext von K-36 (Zeile 648) genannt, nicht in einer Zeile „Voraussetzungen“ meines Blocks. Ich lege das offen, weil die Positivliste von „als Voraussetzung genannt“ spricht.
- Git: `git status`, `git fetch origin main` und das Anlegen meines Arbeitszweigs aus `origin/main`. Dabei erscheinen nur Zweigname und „up to date“, keine Historie. Kein `git log`, keine Liste von Commits, PRs oder Zweigen.
- Die Sitzungsumgebung zeigte die Namen der geteilten Projektdateien (`A-01/LIZENZEN.md`, `a07/verfahren-README.md`, `schranken/QUELLEN.md`), nicht deren Inhalt.

Keine Fremdmodell-Anfrage, kein Subagent.

## 1. Ergebnis in Kürze

| Glied | Urteil | Kurzbegründung |
|---|---|---|
| K-36 | bestätigt | Jeder Schritt nachgerechnet; nur kleine Ungenauigkeiten im Wortlaut (Abschnitt 2.4) |
| K-37 | bestätigt | Jeder Schritt nachgerechnet, Umformungen exakt per Programm geprüft; kleine Ungenauigkeiten (Abschnitt 3.5) |
| K-38 | bestätigt | Schluss passt nach Wortlaut von K-34, K-35, K-37 |
| K-39 | bestätigt | kleine Ungenauigkeit: dass K = F̄ unendlich ist, steht in keinem Glied |
| K-40 | offen | Mathematisch schlüssig, aber eine benutzte Tatsache steht in keinem zitierten Wortlaut: dass in jeder Normalform (mindestens für jedes (S, T) ∈ 𝒢* ∩ 𝒢_gen) ein v ∈ Ŝ mit v ≠ 0 existiert, also w und e erklärt sind (Abschnitt 6.3) |
| K-41 | bestätigt | Der Schluss aus K-38 und K-40 passt nach Wortlaut. In der „Prüfung der Quantoren“ hat der vierte Punkt dieselbe Lücke wie K-40 |

Dazu eine Beobachtung zur Struktur der Kette (Abschnitt 8): Nach den Wortlauten von K-35, K-37 und K-39 entsteht der Widerspruch schon in jeder Normalform aus 𝒢* ∩ 𝒢_gen, ohne Fallunterscheidung nach e. K-34, K-38 und K-40 wären dann für den Endsatz entbehrlich, und das ganze Gewicht liegt auf K-35 (G4) in beiden Fällen e = 2 und e = 3. Das ist kein Mangel meiner Glieder, aber für die Bewertung der Kette wichtig.

## 2. K-36 (Zeilen 632 bis 652)

### 2.1 Wortlaut und Voraussetzungen

Rahmen (Zeile 630): V ist ein Verfahren der Länge 34 für ⟨3,2,7⟩ über F, aufgefasst über K = F̄, (S, T) ∈ 𝒢* ∩ 𝒢_gen, V̂ die Normalform. Die Aussage hat drei Teile (a), (b), (c). Liste: K-6, K-22 (Teile), K-35 (G0), (G2), (GM).

### 2.2 Nachrechnung

**(a), Zeile 647.**
1. Nach (G0) liegt jede Faser ganz in Y oder ganz in Ω. Weil jedes t in genau einer Faser liegt, ist Y die Vereinigung der Fasern, die in Y liegen. Das ist die Voraussetzung „X ist eine Vereinigung von Fasern“ in K-6 (iii).
2. (GM) sagt: K″ ist ein 𝒜-Modul. K-6 (iii) mit M = K″, X = Y gibt: Die Einschränkung bildet ⊕_{T_ξ⊆Y} M_ξ bijektiv auf K″|_Y ab, und dim K″|_Y = Σ_{T_ξ⊆Y} d_ξ. Die Gleichheit „K″|_Y = ⊕ M_ξ als Unterraum von K^Y“ ist so zu lesen: Ein M_ξ mit T_ξ ⊆ Y liegt in K^{T_ξ} ⊆ K^Y und ändert sich beim Einschränken auf Y nicht. Das Bild von ⊕ M_ξ unter der Einschränkung ist also ⊕ M_ξ selbst. Ich habe das zusätzlich direkt geprüft: Für v ∈ K″ ist v = Σ_{ξ∈Π} χ_ξ·v (K-6 (ii)), und v|_Y = Σ_{T_ξ⊆Y} χ_ξ·v, weil die Summanden zu Fasern in Ω auf Y verschwinden.
3. (G2) gibt Σ_{T_ξ⊆Y} d_ξ = 13, also dim K″|_Y = 13.
4. K-6 (i): g ∈ 𝒜 wirkt auf K^{T_ξ}, also auf M_ξ, als Skalar g(ξ). Damit ist K″|_Y unter 𝒜 abgeschlossen. Die Wirkung auf K^Y ist die aus Zeile 630 und stimmt mit der auf K^34 überein.

**(b), Zeile 648.**
1. Ausgangspunkt ist K^34 = K″ + b_0·K′. Das steht in (GM) (Liste). Die Zeile nennt zusätzlich K-24, das nicht in der Liste steht; das ist unschädlich, weil (GM) dasselbe sagt.
2. Multiplikation mit χ_ξ (T_ξ ⊆ Y): χ_ξ·K^34 = K^{T_ξ} nach K-6 (i). χ_ξ·K″ = M_ξ (Definition). χ_ξ·(b_0·K′) = b_0·(χ_ξ·K′), weil das komponentenweise Produkt kommutativ ist. χ_ξ·K′ ⊆ χ_ξ·K″ = M_ξ, weil K′ ⊆ K″ (Definition von K″). Also K^{T_ξ} ⊆ M_ξ + b_0·M_ξ. Umgekehrt liegen beide Summanden in K^{T_ξ}. Also K^{T_ξ} = M_ξ + b_0·M_ξ.
3. Dimension: |T_ξ| = dim(M_ξ + b_0·M_ξ) ≤ dim M_ξ + dim b_0·M_ξ ≤ 2·d_ξ = |T_ξ| nach (G2). Also überall Gleichheit: dim b_0·M_ξ = d_ξ (also m ↦ b_0·m auf M_ξ injektiv) und M_ξ ∩ b_0·M_ξ = 0 (die Summe ist direkt).
4. b_0²·m liegt in K^{T_ξ} = M_ξ ⊕ b_0·M_ξ, hat also eine eindeutige Zerlegung b_0·m′ + m″; m′ ist eindeutig wegen der Injektivität. τ_ξ(m) := m′, ν_ξ(m) := −m″ sind linear, weil die Zerlegung linear ist. Das gibt b_0²·m = b_0·τ_ξ(m) − ν_ξ(m).

**(c) (i), (ii), Zeilen 649 bis 651.**
1. j ∈ K′: Das folgt aus K-22 (a_i·j ∈ K′ für i = 0) mit a_0 = 1 (1.4, K-12). Die Liste nennt diesen Teil von K-22 nicht ausdrücklich (Abschnitt 2.4). κ(j) ∈ K′ und b_0·π(j) ∈ K′ (der Fall i = 0 von b_i·π(j) ∈ K′) stehen in K-22 und in der Liste.
2. Wegen K′ ⊆ K″ liegen j_ξ := χ_ξ·j, κ_ξ := χ_ξ·κ(j) und χ_ξ·(b_0·π(j)) in M_ξ.
3. Mit π(j) = b_0·j + κ(j) (Definition von κ in K-22): χ_ξ·(b_0·π(j)) = b_0²·j_ξ + b_0·κ_ξ = b_0·τ_ξ(j_ξ) − ν_ξ(j_ξ) + b_0·κ_ξ. Das ist Zeile 650.
4. Umstellen: b_0·(τ_ξ(j_ξ) + κ_ξ) = χ_ξ·(b_0·π(j)) + ν_ξ(j_ξ) ∈ M_ξ. Die linke Seite liegt in b_0·M_ξ. Wegen M_ξ ∩ b_0·M_ξ = 0 ist sie 0, wegen der Injektivität ist τ_ξ(j_ξ) + κ_ξ = 0. Einsetzen gibt χ_ξ·(b_0·π(j)) = −ν_ξ(j_ξ).
5. Für jedes x ∈ K″ ist x|_Y = Σ_{T_ξ⊆Y} χ_ξ·x (Punkt (a) 2). Summieren über die Fasern in Y gibt κ(j)|_Y = −Σ τ_ξ(j_ξ) = −τ(j|_Y) und (b_0·π(j))|_Y = −ν(j|_Y), weil j|_Y = Σ j_ξ die Zerlegung in ⊕ M_ξ ist und τ, ν dort blockweise wirken.

**Vertauschung, Zeile 652.** Auf M_ξ wirkt g als Skalar g(ξ), und τ_ξ bildet M_ξ in M_ξ ab. Also τ(g·m) = g(ξ)·τ_ξ(m) = g·τ(m) für m ∈ M_ξ, und durch Summieren auf ganz K″|_Y. Ebenso für ν.

### 2.3 Gegenbeispielsuche und Rechnung

Der Schluss in (c) ist reine lineare Algebra auf einer Faser: Aus K^T = M ⊕ b_0·M, j, κ ∈ M und b_0·(b_0·j + κ) ∈ M folgt κ = −τ(j). Ich habe versucht, ein Modell zu bauen, in dem alle Voraussetzungen gelten und κ ≠ −τ(j) ist. Das Programm im Anhang (Teil 1) zählt über GF(2) und GF(3) für d = 1, 2 alle Paare (j, κ) ∈ M × M vollständig ab und bestimmt über GF(2), GF(5) und Q (d = 2, 3, 4) den Lösungsraum exakt. In keinem von 1050 Zufallsmodellen gab es ein Gegenbeispiel. Woran der Versuch scheitert: Gilt b_0·(b_0·j + κ) ∈ M, dann liegt b_0·(κ + τ(j)) in M ∩ b_0·M = 0. Kontrolle: Lässt man die Direktheit K^T = M ⊕ b_0·M weg, findet das Programm in jedem Körper Fälle, in denen κ durch j nicht bestimmt ist. Die Voraussetzung (G2), die die Direktheit liefert, ist also nötig. Charakteristik 2 spielt keine Rolle, weil nirgends durch eine ganze Zahl geteilt wird.

### 2.4 Kleine Ungenauigkeiten (keine Lücken)

1. Zeile 648 enthält einen verdoppelten Satzanfang: „Multipliziere K^34 = K″ + b_0·K′ (K-24) mit χ_ξ: K^34 = K″ + b_0·K′ (GM) mit χ_ξ: …“. Gemeint ist offenbar ein Satz mit Verweis auf (GM). K-24 steht nicht in der Liste; (GM) genügt.
2. Die Liste nennt nicht, woher j ∈ K′ kommt (K-22: a_0·j ∈ K′ mit a_0 = 1; für a_0 = 1 1.4 oder K-12).
3. Der Beweis von (c) (i), (ii) steht unter der Marke „(b)“, und unter „(c)“ steht nur die Vertauschung. Inhaltlich vollständig.
4. „K″|_Y = ⊕ M_ξ“ ist eine Gleichheit nach der Identifikation von K-6 (iii). Das ist richtig, aber im Wortlaut nur angedeutet („als Unterraum von K^Y“).

**Urteil K-36: bestätigt.**

## 3. K-37 (Zeilen 654 bis 698)

### 3.1 Wortlaut und Voraussetzungen

Rahmen wie in Zeile 630. Aussage: Für jedes z ∈ Ω ist w(z) = 0. Liste: K-12, K-22, K-23 (c), K-35 (G0) bis (G3), (GM), K-36.

### 3.2 Nachrechnung

**Fortsetzungsabbildung, Zeilen 667 bis 669.**
1. Y und Ω zerlegen {1, …, 34}: Nach Zeile 552 hat jedes α_t Rang 1 oder 2, und (G2) gibt |Y| + |Ω| = 26 + 8 = 34.
2. Kern der Einschränkung K′ → K^Y ist K′ ∩ K^Ω = 0 nach (G3). Das Bild liegt in K″|_Y, weil K′ ⊆ K″.
3. dim K′ = 13: Das folgt aus (G3) K″ = K′ ⊕ K^Ω, (GM) dim K″ = 21 und (G2) |Ω| = 8. Der Beweis schreibt „beide Räume haben Dimension 13 (K-36 (a))“; K-36 (a) liefert nur dim K″|_Y = 13 (Abschnitt 3.5).
4. Eine injektive lineare Abbildung zwischen Räumen gleicher endlicher Dimension ist bijektiv. Die Umkehrung E und η(y) := E(y)(z) sind linear, und für x ∈ K′ ist E(x|_Y) = x, also x(z) = η(x|_Y).
5. j ∈ J liegt in K′ (siehe 2.2 (c) 1) und κ(j) ∈ K′ (K-22). Also j(z) = η(j_Y) und κ(j)(z) = η(κ(j)|_Y) = −η(τ(j_Y)) nach K-36 (c) (i). Mit π(j) = b_0·j + κ(j) folgt π(j)(z) = β_z·η(j_Y) − η(τ(j_Y)) = η((β_z − τ)(j_Y)). Das ist Zeile 669.

**(P_i), Zeile 673.**
1. x := c_i·j − a_i·κ(j) liegt in K′ nach (C′) (K-22).
2. Auf Y ist c_i = 0 (G1), also x|_Y = −a_i·κ(j)|_Y = a_i·τ(j_Y). Dieser Vektor liegt in K″|_Y, weil K″|_Y unter 𝒜 abgeschlossen ist (K-36 (a)).
3. x(z) = c_i(z)·j(z) − z_i·κ(j)(z) = c_i(z)·η(j_Y) + z_i·η(τ(j_Y)).
4. x(z) = η(x|_Y) gibt c_i(z)·η(j_Y) = η(a_i·τ(j_Y)) − z_i·η(τ(j_Y)) = η((a_i − z_i)·τ(j_Y)). Das ist (P_i).

**(Q_0), Zeile 675.**
1. x := b_0·π(j) ∈ K′ (K-22, i = 0). x|_Y = −ν(j_Y) nach K-36 (c) (ii).
2. x(z) = β_z·π(j)(z) = β_z·η((β_z − τ)(j_Y)) = β_z²·η(j_Y) − β_z·η(τ(j_Y)).
3. x(z) = η(x|_Y) = −η(ν(j_Y)) gibt (Q_0).

**(Q_i), Zeile 677.**
1. x := b_i·π(j) ∈ K′ (K-22). Nach Definition c_i = b_i − a_i·b_0 ist b_i = c_i + a_i·b_0, also x = c_i·π(j) + a_i·(b_0·π(j)).
2. Auf Y ist c_i = 0, also x|_Y = a_i·(b_0·π(j))|_Y = −a_i·ν(j_Y).
3. x(z) = (c_i(z) + z_i·β_z)·π(j)(z) = (c_i(z) + z_i·β_z)·η((β_z − τ)(j_Y)).
4. x(z) = η(x|_Y) gibt c_i(z)·η((β_z − τ)j_Y) + z_i·β_z·η((β_z − τ)j_Y) + η(a_i·ν(j_Y)) = 0.
5. Nach (Q_0) ist β_z·η((β_z − τ)j_Y) = β_z²η(j_Y) − β_zη(τj_Y) = −η(ν(j_Y)). Einsetzen: c_i(z)·η((β_z − τ)j_Y) − z_i·η(ν(j_Y)) + η(a_i·ν(j_Y)) = 0. Das ist (Q_i).

**Richtung, Zeilen 679 bis 683.** (G1) gibt (c_1(z), c_2(z)) ≠ (0, 0). Dann gibt es (ε_1, ε_2) mit ε_1c_1(z) + ε_2c_2(z) = 1 (zum Beispiel ε_i = 1/c_i(z) für ein i mit c_i(z) ≠ 0, das andere 0). ℓ* := ε_1(a_1 − z_1) + ε_2(a_2 − z_2) ∈ P_1 hat an ξ(z) den Wert 0. Summe ε_1·(P_1) + ε_2·(P_2): (Σε_ic_i(z))·η(j_Y) = η(ℓ*·τ(j_Y)), also (P). Summe ε_1·(Q_1) + ε_2·(Q_2): η((β_z − τ)j_Y) + η(ℓ*·ν(j_Y)) = 0, also (Q). Beides benutzt nur die Linearität von η und dass a_i − z_i Polynome sind, die auf K″|_Y wirken.

**Einsetzen von j = w·G, Zeilen 685 bis 689.**
1. w ∈ J ⊆ K′ ⊆ K″ (K-23 (a), (c)), also ω := w|_Y ∈ K″|_Y.
2. Für G ∈ P_2 ist w·G ∈ J (K-23 (c)), und (w·G)|_Y = G·ω, weil Polynome komponentenweise wirken.
3. Für g ∈ P_3 ist w·g ∈ K′, also η(g·ω) = (w·g)(z) = g(ξ(z))·w(z). Im weiteren Beweis wird 𝔪 nur für g = G ∈ P_2 benutzt; dafür genügt schon w·P_2 ⊆ J ⊆ K′ (Abschnitt 3.5).
4. Weil τ, ν mit 𝒜 vertauschen (K-36 (c)): τ(G·ω) = G·τ(ω), ℓ*·τ(G·ω) = τ(ℓ*G·ω), ebenso für ν.
5. (P) mit j = w·G: 𝔪(G) = 𝔱(ℓ*·G), also (P′) 𝔱(ℓ*·G) = w(z)·G(z).
   (Q): β_z·𝔪(G) − 𝔱(G) + 𝔫(ℓ*·G) = 0, also (Q′).
   (Q_0): β_z²·𝔪(G) − β_z·𝔱(G) + 𝔫(G) = 0, also (Q_0′). Jeweils für alle G ∈ P_2.

**Vier Werte, Zeilen 691 bis 696.**
1. G = ℓ* ∈ P_1 ⊆ P_2 in (P′): 𝔱(ℓ*²) = w(z)·ℓ*(ξ(z)) = 0.
2. G = ℓ*² ∈ P_2 in (Q_0′): β_z²·w(z)·0 − β_z·𝔱(ℓ*²) + 𝔫(ℓ*²) = 0, mit 1 also 𝔫(ℓ*²) = 0.
3. G = ℓ* in (Q′): β_z·w(z)·0 − 𝔱(ℓ*) + 𝔫(ℓ*²) = 0, mit 2 also 𝔱(ℓ*) = 0.
4. G = 1 in (P′): 𝔱(ℓ*) = w(z).
Aus 3 und 4: w(z) = 0. Jeder Schritt benutzt nur Gleichungen mit G ∈ P_2; ℓ*² hat Grad ≤ 2. Richtig.

### 3.3 Rechnung in exakter Arithmetik

Programm im Anhang:
- **Teil 2b** prüft die Umformungen in den Zeilen 673 bis 677 als Identitäten. In Zufallsmodellen (Fasern mit M_ξ ⊕ b_0·M_ξ = K^{T_ξ}, τ und ν wie in K-36 berechnet, η beliebig, j_Y ∈ K″|_Y beliebig, Werte an z beliebig) gilt exakt: Rest(P_i) = −Defekt(C′_i), Rest(Q_0) = −Defekt(B_0), Rest(Q_i) = −Defekt(B_i) + z_i·Defekt(B_0). Dabei ist Defekt(X) := η(x|_Y) − x(z) für den Vektor x der jeweiligen Bedingung. Geprüft über GF(2), GF(3), GF(5) und Q, 270 Modelle, ohne Abweichung. Mitgeprüft: (b_0·π(j))|_Y = −ν(j_Y) und die Vertauschung von τ, ν mit a_1, a_2.
- **Teil 3** prüft den Schluss „Vier Werte“ in größerer Allgemeinheit: 𝔱 und 𝔫 werden als beliebige lineare Funktionale auf den Monomen vom Grad ≤ 4 behandelt, w(z) als Unbekannte. Für alle Wahlen von ξ(z), β_z und (ε_1, ε_2) ≠ 0 über GF(2) (24 Wahlen), GF(3) (216) und GF(5) (3000) erzwingen (P′), (Q′), (Q_0′) für alle G ∈ P_2 den Wert w(z) = 0. Kontrolle: Lässt man eine der drei Gruppen weg, ist w(z) ≠ 0 in jeder dieser Wahlen möglich. Alle drei Gruppen sind also nötig.
- **Teil 2** baut abstrakte Modelle aller in K-37 zitierten Voraussetzungen (Fasern auf Y, K′ als Graph von η, ein Index z mit beliebigen Werten und (c_1(z), c_2(z)) ≠ 0) und löst das lineare System in (η, w(z)). In allen 300 Modellen (GF(2), GF(3), GF(5), GF(7), GF(11), Q; darunter Modelle mit Σd_ξ = 13 und |Y| = 26 wie in (G2)) ist w(z) = 0 erzwungen. Kontrolle: Mit w·P_3 ⊆ K′ allein ist w(z) ≠ 0 in 86 der Modelle möglich; mit c(z) = 0, also ohne (G1), in 35 Modellen. Diese Modelle sind zufällig und stark überbestimmt; Teil 2 ist deshalb nur eine schwache Bestätigung. Die belastbaren Rechnungen sind Teil 2b und Teil 3.

### 3.4 Gegenbeispielsuche

Ich habe versucht, ein Modell aller zitierten Voraussetzungen mit w(z) ≠ 0 zu bauen: in Teil 3 mit möglichst freien Funktionalen 𝔱, 𝔫, in Teil 2 mit konkreten Fasern, auch über GF(2) und GF(3) und mit a-Punkten, die zusammenfallen. Der Versuch scheitert immer an derselben Stelle: Schritt 4 (G = 1 in (P′)) setzt 𝔱(ℓ*) = w(z), Schritt 3 erzwingt 𝔱(ℓ*) = 0 über 𝔫(ℓ*²) = 0, und das kommt aus Schritt 1 und 2. Die Charakteristik geht nicht ein; die einzige Division ist durch c_i(z) ≠ 0 bei der Wahl von ε. Ohne (G1) (c(z) = 0) bricht der Beweis tatsächlich zusammen, und das Programm findet dann Modelle mit w(z) ≠ 0.

### 3.5 Kleine Ungenauigkeiten (keine Lücken)

1. Zeile 667: „beide Räume haben Dimension 13 (K-36 (a))“. Für K′ kommt die 13 aus (G3), (GM) und (G2), nicht aus K-36 (a). Alle drei stehen in der Liste.
2. Die Voraussetzung w·P_3 ⊆ K′ wird nicht gebraucht: 𝔪 wird nur auf P_2 ausgewertet, und w·P_2 ⊆ J ⊆ K′ genügt. Teil 2 bestätigt das (ohne Grad 3 bleibt w(z) = 0 erzwungen). Unschädlich.
3. Der Wortlaut nennt den Rahmen (S, T) ∈ 𝒢* ∩ 𝒢_gen nicht selbst; er steht im Vorspann von Abschnitt 8 (Zeile 630). K-35 braucht ihn.
4. Zeile 685 schreibt „(w·G)_Y“ statt „(w·G)|_Y“.
5. Dass J ⊆ K′, steht nicht ausdrücklich im Wortlaut von K-22, folgt aber aus a_0·j ∈ K′ mit a_0 = 1.
6. Der „Hinweis zum Wortlaut“ (Zeile 698) ist richtig: Der Beweis benutzt e = 3 nicht. Siehe Abschnitt 8.

**Urteil K-37: bestätigt.**

## 4. K-38 (Zeilen 700 bis 706)

**Nachrechnung.**
1. Annahme 𝒢_3 ≠ ∅. K-34 gibt (S, T) ∈ 𝒢_3 ∩ 𝒢_gen. Nach Definition (K-34) ist 𝒢_3 ⊆ 𝒢*, also (S, T) ∈ 𝒢* ∩ 𝒢_gen.
2. Damit gilt der Rahmen von K-35 und K-37 (V wie in Abschnitt 7: nach K-8 und K-18 (c), beide in der Liste). Weil (S, T) ∈ 𝒢_3, ist e = 3 und damit w erklärt.
3. (G2): |Ω| = 8, also gibt es z ∈ Ω. (G4): w(z) ≠ 0. K-37: w(z) = 0. Beide Aussagen sind gegen Skalierung von w unempfindlich (K-23 (a)), es kommt also nicht darauf an, welches w gewählt ist.
4. Widerspruch, also 𝒢_3 = ∅.

**Voraussetzungen.** Alle benutzten Glieder stehen in der Liste. Die Quantoren passen: K-34 gilt für jedes V, aus dem Rahmen; K-35 und K-37 für jedes (S, T) ∈ 𝒢* ∩ 𝒢_gen. Gegenmodell: Ein Modell, das K-34, K-35 und K-37 nach Wortlaut erfüllt und 𝒢_3 ≠ ∅ hat, müsste in derselben Normalform w(z) ≠ 0 und w(z) = 0 haben; das ist unmöglich.

**Urteil K-38: bestätigt.**

## 5. K-39 (Zeilen 712 bis 719)

**Nachrechnung.**
1. K = F̄ ist unendlich, weil ein algebraisch abgeschlossener Körper unendlich ist (bei {k_1, …, k_n} hätte Π(x − k_i) + 1 keine Nullstelle). Das braucht K-1, K-5, K-11, K-32. Diese Tatsache steht in keinem Glied (Abschnitt 5, Ungenauigkeit 1).
2. Kein α_t ist die Nullform (K-18 (c)), und r = 34 ≥ 1. K-11 liefert Λ(s_0, p) ≠ 0, homogen in p.
3. Zerlegung Λ = Σ_μ c_μ(s_0)·p^μ: Weil Λ ≠ 0, ist ein c_μ ≠ 0. K-1 (a) in drei Variablen gibt s_* mit c_μ(s_*) ≠ 0. Dann hat Λ(s_*, ·) den Koeffizienten c_μ(s_*) ≠ 0 bei p^μ, ist also ≠ 0. Homogen in p ist es, weil jedes Monom von Λ denselben p-Grad hat.
4. K-1 (a) gibt p mit Λ(s_*, p) ≠ 0. K-11: Daraus folgt α_t(s_*p) ≠ 0 für alle t, insbesondere s_* ≠ 0. Also lässt sich s_* zu S ∈ GL_3(K) mit erster Spalte s_* ergänzen.
5. m_{tt′}: Für jedes Paar ohne (I), (II) ist m_{tt′} nach K-32 (2) ein von 0 verschiedenes, homogenes Polynom vom Grad 2 in p, das nur von α_t, α_{t′} und p abhängt, nicht von S. K-32 braucht α_t, α_{t′} ≠ 0; das gibt K-18 (c).
6. Q := Λ(s_*, ·)·Π m_{tt′} ist nach K-1 (b) ≠ 0 und als Produkt homogener Polynome homogen. K-5: {[p] : Q(p) ≠ 0} ist unendlich, und die Bedingung hängt nur von [p] ab.
7. Für [p] ∈ 𝒫 und einen Vertreter p (≠ 0) ergänze zu T_p mit erster Zeile p. Λ(s_*, p) ≠ 0 und K-11 geben (S, T_p) ∈ 𝒢*. m_{tt′}(p) ≠ 0 für alle Paare gibt (S, T_p) ∈ 𝒢_gen nach Definition in K-34.

Der Schluss gilt sogar für jeden Vertreter von [p], nicht nur für einen. Rechnerischer Inhalt fehlt bis auf das Abzählen in K-5; ich habe keine Rechnung angesetzt. Ein Gegenmodell müsste Q ≡ 0 haben; das schließen K-1 (b), K-11 (Λ ≠ 0) und K-32 (m_{tt′} ≠ 0) aus.

**Kleine Ungenauigkeiten.** (1) Dass F̄ unendlich ist, wird benutzt, aber nicht als Glied geführt (Standardtatsache, ein Satz genügt). (2) Der Umweg über die Koeffizienten c_μ ist nicht nötig; K-1 (a) in fünf Variablen gäbe (s_*, p) direkt. Unschädlich.

**Urteil K-39: bestätigt.**

## 6. K-40 (Zeilen 721 bis 730)

### 6.1 Nachrechnung

1. **Zeile 727.** Annahme 𝒢_3 = ∅. Ist für eine Normalform e erklärt, dann ist e ∈ {2, 3} (K-23 (e)), und e ≠ 3, weil sonst (S, T) ∈ 𝒢_3. Also e = 2. Siehe 6.3 zur Frage, ob e für jede Normalform erklärt ist.
2. S, 𝒫, T_p aus K-39: (S, T_p) ∈ 𝒢* ∩ 𝒢_gen für [p] ∈ 𝒫. Damit gelten K-35 und, wegen e = 2, K-30 für V̂_p. Σ_p hängt nicht von der Skalierung von w ab, g_0^{(p)} ist bis auf einen Faktor eindeutig (K-30 (a)). Y und Ω hängen nur vom Rang der α_t ab (K-35, Definition), also nicht von p.
3. **Schritt 1, Zeile 728.** 𝒫 ist unendlich, {1, …, 34} hat endlich viele Teilmengen. Die Abbildung [p] ↦ Σ_p hat eine unendliche Faser 𝒫*. Richtig.
4. **Schritt 2, Zeile 729.** K-33 (ii): Für t ∈ Y hängt ξ_p(t) nur von S ab. Also ist Π_1 = {ξ(t) : t ∈ Y ∩ Σ*} für alle [p] ∈ 𝒫* dieselbe Menge, und nach (G5) für (S, T_p) hat sie ≥ 7 Elemente. K-30 (a): g_0^{(p)} verschwindet in ξ_p(t) = ξ(t) für t ∈ Σ_p = Σ*, also auf Π_1. K-30 (a), (b): Grad genau 2, ĝ_0 irreduzibel. K-4 (b), angewandt auf ein festes g_0^{(p)}: Keine drei Nullstellen liegen auf einer affinen Geraden, also auch keine drei Punkte von Π_1. Fünf verschiedene Punkte von Π_1 erfüllen damit die Voraussetzung von K-4 (c). Der Raum der g ∈ P_2, die an diesen fünf Punkten verschwinden, hat Dimension ≤ 1 und enthält alle g_0^{(p)} ≠ 0. Er ist also K·g* mit g* := g_0^{(p_1)}, und g_0^{(p)} = λ_p·g* mit λ_p ≠ 0. g* hat Grad 2 und irreduzible Homogenisierung (K-30 für p_1).
5. **Schritt 3, Zeile 730.** z ∈ Ω existiert nach (G2). (G4) für (S, T_p) gibt w^{(p)}(z) ≠ 0, also z ∈ Σ_p = Σ*. K-30 (a): g_0^{(p)}(ξ_p(z)) = 0, also g*(ξ_p(z)) = 0. K-33 (iii) (α_z hat Rang 2): ξ_p(z) ∈ ℒ_z, und ℒ_z ist nach seiner Definition {ξ : (1, ξ)ᵀ ∈ Sᵀα_zK²} nur von S und α_z abhängig, und es ist eine affine Gerade im Sinn von K-4. Für [p] ≠ [p̃] in 𝒫* ist p̃ ∉ K·p; K-33 (iii) mit (S, T_p), (S, T_p̃) ∈ 𝒢* (gleiches S) gibt ξ_p(z) ≠ ξ_p̃(z). 𝒫* ist unendlich, also hat g* unendlich viele Nullstellen auf ℒ_z. Das widerspricht K-4 (b).

### 6.2 Gegenbeispielsuche

Ein Gegenmodell müsste eine unendliche Familie von e = 2-Normalformen haben, deren Kegelschnitte nicht in einem Büschel der Dimension 1 liegen, oder deren Punkte ξ_p(z) zusammenfallen. Das erste schließt K-4 (c) aus, sobald fünf Punkte von Π_1 ohne drei auf einer Geraden vorliegen; die fünf Punkte gibt (G5), die Lage K-4 (b). Das zweite schließt K-33 (iii) aus. In Charakteristik 2 ändert sich nichts: Die benutzten Wortlaute von K-4 und K-33 stellen keine Bedingung an die Charakteristik, und K ist unendlich.

### 6.3 Lücke in der Liste der Voraussetzungen

1. **Existenz von w (wesentlich für die Zitierkette).** Schritt 1 in 6.1 schließt aus 𝒢_3 = ∅, dass jede Normalform e = 2 hat. Das setzt voraus, dass in jeder Normalform, mindestens für jedes (S, T_p), ein v ∈ Ŝ mit v ≠ 0 existiert. Der Wortlaut von K-23 ist bedingt („In V̂ sei v ∈ Ŝ mit v ≠ 0“); er sagt nicht, dass es ein solches v gibt. Kein Glied der Liste von K-40 sagt es nach seinem Wortlaut ausdrücklich. Die Lesehinweise (Zeile 14) führen das auf K-19 zurück („in jeder Normalform liegt man im Restfall (K-19). Daraus entsteht ein Vektor w“). K-19 steht nicht in der Liste von K-40, und seinen Wortlaut durfte ich nach Positivliste nicht lesen. Man kann auch K-35 so lesen, dass sein Wortlaut für jedes (S, T) ∈ 𝒢* ∩ 𝒢_gen die Existenz von w einschließt, weil (G4) „w(z) ≠ 0“ behauptet. Das ist aber eine Lesart, kein Wortlaut. Zum Schließen genügt es, das Glied, das Ŝ ≠ 0 in jeder Normalform liefert (vermutlich K-19, eventuell mit K-21), in die Liste von K-40 aufzunehmen und den Satz „Dann hat nach K-23 (e) jede Normalform e = 2“ entsprechend zu begründen.
2. (G2) wird in Zeile 730 benutzt (Ω ≠ ∅), steht aber nicht in der Liste (dort nur (G4), (G5)). Klein.
3. Die Bezeichnung 𝒢_3 stammt aus K-34, das nicht in der Liste steht (K-39 nennt K-34 „Bezeichnung“, K-40 nicht). Klein.

**Urteil K-40: offen.** Was fehlt: ein zitiertes Glied, dessen Wortlaut sichert, dass in jeder Normalform (mindestens für jedes (S, T) ∈ 𝒢* ∩ 𝒢_gen) ein v ∈ Ŝ mit v ≠ 0 existiert. Im Übrigen ist jeder Schritt nachgerechnet und richtig.

## 7. K-41 und die Prüfung der Quantoren (Zeilen 736 bis 750)

### 7.1 Nachrechnung des Endsatzes

1. K-18 (b): Jedes Verfahren für ⟨3,2,7⟩ über F hat Länge ≥ 34.
2. Annahme: V hat Länge 34 über F. K-8: V ist ein Verfahren der Länge 34 über einem festen algebraischen Abschluss K = F̄. K-18 (c): Kein α_t ist die Nullform, und 𝒢* ≠ ∅. Damit ist der Rahmen von Abschnitt 7 erfüllt.
3. K-40 für dieses V (Wortlaut: „Sei V ein Verfahren der Länge 34 … über F, aufgefasst über K = F̄. Dann ist 𝒢_3 ≠ ∅“) und K-38 für dasselbe V und dasselbe K („Dann ist 𝒢_3 = ∅“). Beide Wortlaute haben dieselben Annahmen, dieselbe Menge 𝒢_3 (aus K-34, mit derselben Normalform aus 1.3 und demselben K). Widerspruch.
4. Also hat jedes Verfahren über F Länge ≥ 35, und R_F(⟨3,2,7⟩) ≥ 35 nach Definition (1.1).

**Körper.** Die Aussage über F folgt nicht über einen Vergleich R_F ≥ R_K, sondern direkt: Ein hypothetisches Verfahren über F wird über K aufgefasst, und der Widerspruch entsteht für dieses eine Verfahren über K. Das ist richtig. Die Wahl des algebraischen Abschlusses spielt keine Rolle, weil K-38 und K-40 für jeden gelten und man einen festen nimmt. Der Endsatz liefert damit insbesondere auch R_K ≥ 35 für den algebraischen Abschluss selbst (F = K).

**Voraussetzungen.** K-8, K-18 (b), (c), K-38, K-40: vollständig. Der Satz „alle Begriffe der Abschnitte 5 bis 9 sind erklärt“ (Zeile 742) ist für den Schluss nicht nötig, weil K-38 und K-40 ihre Begriffe selbst mitbringen; er berührt aber dieselbe Frage wie 6.3.

**Urteil K-41: bestätigt** (als Schluss aus den Wortlauten von K-38 und K-40; ob K-40 trägt, hängt an 6.3).

### 7.2 Prüfung der Quantoren, Punkt für Punkt

1. Zeile 746 (K-38): Richtig. „𝒢_3 = ∅“ ist genau „für jedes (S, T) ∈ 𝒢* hat die Normalform nicht e = 3“. Dass der Widerspruch in einer anderen Normalform desselben V entsteht, ist zulässig.
2. Zeile 747 (K-40): Richtig, mit dem Vorbehalt aus 6.3: „Alle Normalformen haben e = 2“ ist die Verneinung von „es gibt eine mit e = 3“ nur, wenn e in jeder Normalform erklärt ist.
3. Zeile 748 (K-41): Richtig.
4. Zeile 749 („Die Zahl e ist für jede einzelne Normalform erklärt (K-23 (a) …)“): K-23 (a) gibt die Eindeutigkeit von w bis auf einen Faktor, und daraus folgt richtig, dass w·P_2 und damit e nicht von der Wahl von v abhängt. Die **Existenz** eines v ∈ Ŝ mit v ≠ 0 gibt K-23 (a) nicht. Dieselbe Lücke wie 6.3.
5. Zeile 750 (Körper): Für meinen Block richtig: K-36, K-37 und K-38 brauchen keine Eigenschaft von K außer Körper; K-39 und K-40 brauchen, dass K unendlich ist (über K-1, K-4, K-5, K-11, K-32). Dass F̄ unendlich ist, steht in keinem Glied (Abschnitt 5). In meinem Block kommt keine Division durch eine ganze Zahl vor; geteilt wird nur durch c_i(z) ≠ 0 (K-37) und in den zitierten Gliedern. Die Aussagen über K-3 und K-20 liegen außerhalb meines Blocks; ich habe sie nicht geprüft.

## 8. Beobachtung zur Struktur (kein Urteil über andere Glieder)

Nach Wortlaut gilt K-35 für **jedes** (S, T) ∈ 𝒢* ∩ 𝒢_gen, ohne Bedingung an e, und enthält (G2) |Ω| = 8 und (G4) w(z) ≠ 0 für z ∈ Ω. K-37 gilt im Rahmen von Abschnitt 8 ebenfalls für jedes (S, T) ∈ 𝒢* ∩ 𝒢_gen und gibt w(z) = 0; der Hinweis in Zeile 698 sagt selbst, dass der Beweis e = 3 nicht benutzt. K-39 gibt ein (S, T_p) ∈ 𝒢* ∩ 𝒢_gen. Zusammen ergibt das sofort einen Widerspruch für jedes Verfahren der Länge 34, ohne K-34, K-38, K-40 und ohne die Fallunterscheidung nach e (mit demselben Vorbehalt zur Existenz von w wie in 6.3). Die Kette ist dadurch nicht falsch, aber:
- K-34, K-38 und K-40 sind für den Endsatz entbehrlich, wenn K-35 nach Wortlaut stimmt.
- Das ganze Gewicht liegt auf K-35, insbesondere auf (G3), (G4) und (GM) im Fall e = 2. Wer K-35 prüft, sollte wissen, dass K-35 im Fall e = 2 zusammen mit K-37 schon allein den Endsatz trägt.

## 9. Verbrauch und Zeiten

- Subagenten: 0. Fremdmodell-Anfragen: 0.
- Rechnung: ein Lauf des Programms im Anhang, Dauer etwa 17 Sekunden auf einem Kern (Python 3, nur Standardbibliothek). Mehrere kürzere Vorläufe während der Entwicklung, jeder unter 20 Sekunden.
- Die Commit-Zeiten stehen in Git.

## Anhang A: Programm `check_k36_k37.py`

Exakte Arithmetik: GF(p) mit ganzen Zahlen modulo p, Q mit `fractions.Fraction`. Keine Gleitkommazahlen. Aufruf: `python3 -I check_k36_k37.py` (Zufallssaat fest: 20261126). SHA-256 der Programmdatei: siehe Anhang B.

```python
#!/usr/bin/env python3
"""Exact checks for chain links K-36 and K-37 (assignment S5-13).

Arithmetic: GF(p) via Python ints mod p, Q via fractions.Fraction.
No floating point anywhere. Standard library only.

Part 1 (K-36): local linear algebra on one fibre.
Part 2 (K-37): abstract model of all hypotheses cited by K-37 at one
  rank-2 index z; the unknowns are eta (a functional on M = K''|_Y) and
  w(z). We check that every solution has w(z) = 0, and, as negative
  controls, that dropping single hypotheses allows w(z) != 0.
Part 3 (K-37, last step): the "four values" argument as a linear system
  in abstract unknowns t(g), n(g), w(z), exhaustively over GF(2), GF(3).
"""
import itertools
import random
import sys
from fractions import Fraction


class Fld:
    def __init__(self, p):
        self.p = p  # 0 means Q

    def c(self, x):
        return x % self.p if self.p else Fraction(x)

    def add(self, a, b):
        return (a + b) % self.p if self.p else a + b

    def sub(self, a, b):
        return (a - b) % self.p if self.p else a - b

    def mul(self, a, b):
        return (a * b) % self.p if self.p else a * b

    def neg(self, a):
        return (-a) % self.p if self.p else -a

    def inv(self, a):
        assert a != 0
        return pow(a, self.p - 2, self.p) if self.p else 1 / a

    def rnd(self):
        return random.randrange(self.p) if self.p else Fraction(random.randint(-4, 4))

    def elems(self):
        assert self.p
        return range(self.p)

    def name(self):
        return "GF(%d)" % self.p if self.p else "Q"


def rref(F, rows, ncols):
    """Reduced row echelon form; returns (rows, pivots)."""
    A = [list(r) for r in rows]
    piv = []
    r = 0
    for col in range(ncols):
        k = next((i for i in range(r, len(A)) if A[i][col] != 0), None)
        if k is None:
            continue
        A[r], A[k] = A[k], A[r]
        iv = F.inv(A[r][col])
        A[r] = [F.mul(iv, x) for x in A[r]]
        for i in range(len(A)):
            if i != r and A[i][col] != 0:
                f = A[i][col]
                A[i] = [F.sub(x, F.mul(f, y)) for x, y in zip(A[i], A[r])]
        piv.append(col)
        r += 1
        if r == len(A):
            break
    return A[:r], piv


def rank(F, rows, ncols):
    return len(rref(F, rows, ncols)[1])


def nullspace(F, rows, ncols):
    R, piv = rref(F, rows, ncols)
    free = [c for c in range(ncols) if c not in piv]
    basis = []
    for f in free:
        v = [F.c(0)] * ncols
        v[f] = F.c(1)
        for i, pc in enumerate(piv):
            v[pc] = F.neg(R[i][f])
        basis.append(v)
    return basis


def solve_coords(F, basis, y):
    """Coordinates x with sum x_k basis[k] = y; basis independent; None if y not in span."""
    n = len(y)
    m = len(basis)
    # columns = basis vectors, augmented with y
    rows = [[basis[k][i] for k in range(m)] + [y[i]] for i in range(n)]
    R, piv = rref(F, rows, m + 1)
    if m in piv:
        return None
    x = [F.c(0)] * m
    for i, pc in enumerate(piv):
        x[pc] = R[i][m]
    return x


def vmul(F, a, b):
    return [F.mul(x, y) for x, y in zip(a, b)]


def vadd(F, a, b):
    return [F.add(x, y) for x, y in zip(a, b)]


def vsc(F, s, a):
    return [F.mul(s, x) for x in a]


def lin(F, coeffs, vecs, n):
    out = [F.c(0)] * n
    for c_, v in zip(coeffs, vecs):
        out = vadd(F, out, vsc(F, c_, v))
    return out


# ---------------------------------------------------------------- Part 1
def random_fibre(F, d, tries=200):
    """Random M (dim d) in K^{2d} and b0 with K^{2d} = M (+) b0*M."""
    n = 2 * d
    for _ in range(tries):
        Mb = [[F.rnd() for _ in range(n)] for _ in range(d)]
        if rank(F, Mb, n) < d:
            continue
        b0 = [F.rnd() for _ in range(n)]
        if rank(F, Mb + [vmul(F, b0, m) for m in Mb], n) == n:
            return Mb, b0
    return None


def tau_nu(F, Mb, b0):
    """tau, nu as functions on coordinate vectors: b0^2 m = b0 tau(m) - nu(m)."""
    n = len(b0)
    d = len(Mb)
    big = [vmul(F, b0, m) for m in Mb] + Mb  # columns: b0*M then M
    T = []
    N = []
    for m in Mb:
        rhs = vmul(F, vmul(F, b0, b0), m)
        x = solve_coords(F, big, rhs)
        assert x is not None
        T.append(x[:d])                 # tau(m) coords
        N.append([F.neg(v) for v in x[d:]])  # nu(m) = -m''
    # T[k] = coords of tau(basis_k); as a matrix acting on coords: tau(sum c_k m_k) = sum c_k T[k]
    def tau(c):
        return lin(F, c, T, d)

    def nu(c):
        return lin(F, c, N, d)
    return tau, nu


def part1(F, d, trials, exhaustive):
    bad = 0
    fail_direct = 0
    for _ in range(trials):
        res = random_fibre(F, d)
        if res is None:
            fail_direct += 1
            continue
        Mb, b0 = res
        n = 2 * d
        tau, nu = tau_nu(F, Mb, b0)
        # set of pairs (j, kappa) in M x M with b0*(b0*j+kappa) in M, as a subspace of K^{2d} (coords)
        # unknown coords (cj, ck) in K^{2d}; condition: b0*(b0*J(cj) + K(ck)) in M
        # Compute via enumeration (finite field) or nullspace (any field).
        if exhaustive:
            for cj in itertools.product(F.elems(), repeat=d):
                for ck in itertools.product(F.elems(), repeat=d):
                    j = lin(F, cj, Mb, n)
                    k = lin(F, ck, Mb, n)
                    x = vmul(F, b0, vadd(F, vmul(F, b0, j), k))
                    if solve_coords(F, Mb, x) is not None:
                        # K-36 (c): kappa = -tau(j), and b0*pi(j) = -nu(j)
                        if list(ck) != [F.neg(v) for v in tau(list(cj))]:
                            bad += 1
                        if x != [F.neg(v) for v in lin(F, nu(list(cj)), Mb, n)]:
                            bad += 1
        else:
            # Linear map (cj, ck) -> class of b0*(b0 j + k) modulo M; compute kernel.
            # Build matrix columns: images of unit coords, then project away M by
            # adding M basis as extra unknowns.
            cols = []
            for idx in range(2 * d):
                c = [F.c(0)] * (2 * d)
                c[idx] = F.c(1)
                j = lin(F, c[:d], Mb, n)
                k = lin(F, c[d:], Mb, n)
                cols.append(vmul(F, b0, vadd(F, vmul(F, b0, j), k)))
            cols += [[F.neg(v) for v in m] for m in Mb]
            rows = [[cols[c][i] for c in range(len(cols))] for i in range(n)]
            ker = nullspace(F, rows, len(cols))
            if len(ker) != d:
                bad += 1
            for v in ker:
                cj, ck = v[:d], v[d:2 * d]
                if ck != [F.neg(x) for x in tau(cj)]:
                    bad += 1
        # commutation with scalars is trivial on one fibre (g acts as g(xi)).
    return bad, fail_direct


def part1_negative(F, d, trials):
    """Control: without K^{2d} = M (+) b0*M, kappa is not determined by j."""
    found = 0
    for _ in range(trials):
        n = 2 * d
        Mb = [[F.rnd() for _ in range(n)] for _ in range(d)]
        if rank(F, Mb, n) < d:
            continue
        b0 = [F.rnd() for _ in range(n)]
        if rank(F, Mb + [vmul(F, b0, m) for m in Mb], n) == n:
            continue
        cols = []
        for idx in range(2 * d):
            c = [F.c(0)] * (2 * d)
            c[idx] = F.c(1)
            j = lin(F, c[:d], Mb, n)
            k = lin(F, c[d:], Mb, n)
            cols.append(vmul(F, b0, vadd(F, vmul(F, b0, j), k)))
        cols += [[F.neg(v) for v in m] for m in Mb]
        rows = [[cols[c][i] for c in range(len(cols))] for i in range(n)]
        ker = nullspace(F, rows, len(cols))
        # pairs with j = 0 and kappa != 0?
        sub = [v[:2 * d] for v in ker]
        r_all = rank(F, sub, 2 * d)
        r_j = rank(F, [v[:d] for v in sub], d) if sub else 0
        if r_all > r_j:
            found += 1
    return found


# ---------------------------------------------------------------- Part 2
MONO = {deg: [(i, deg - i) for i in range(deg + 1)] for deg in range(6)}


def monos(maxdeg):
    return [m for dgr in range(maxdeg + 1) for m in MONO[dgr]]


def ev(F, mono, pt):
    i, k = mono
    if F.p:
        return (pow(pt[0], i, F.p) * pow(pt[1], k, F.p)) % F.p
    return Fraction(pt[0]) ** i * Fraction(pt[1]) ** k


def build_model(F, dims, zdata, same_point=False):
    """Y = union of fibres with sizes 2*d (d in dims), distinct points.
    Returns dict with M basis (on Y), b0|_Y, points, tau, nu (on Y vectors)."""
    pts = []
    while len(pts) < len(dims):
        pt = (F.rnd(), F.rnd())
        if pt not in pts:
            pts.append(pt)
    Ysize = sum(2 * d for d in dims)
    Mb = []
    b0 = []
    xi = []
    off = 0
    for d, pt in zip(dims, pts):
        res = random_fibre(F, d)
        if res is None:
            return None
        Mf, bf = res
        for m in Mf:
            v = [F.c(0)] * Ysize
            v[off:off + 2 * d] = m
            Mb.append(v)
        b0 += bf
        xi += [pt] * (2 * d)
        off += 2 * d
    D = len(Mb)
    tau_c, nu_c = tau_nu(F, Mb, b0)

    def coords(y):
        c = solve_coords(F, Mb, y)
        assert c is not None, "vector not in M"
        return c

    def tau(y):
        return lin(F, tau_c(coords(y)), Mb, Ysize)

    def nu(y):
        return lin(F, nu_c(coords(y)), Mb, Ysize)

    def act(mono, y):
        return [F.mul(ev(F, mono, xi[t]), y[t]) for t in range(Ysize)]
    return dict(Mb=Mb, b0=b0, xi=xi, D=D, Y=Ysize, coords=coords, tau=tau, nu=nu, act=act, pts=pts)


def part2_system(F, mdl, omega, z, use):
    """Unknowns: eta_0..eta_{D-1}, wz. Returns list of equation rows."""
    D = mdl["D"]
    coords = mdl["coords"]
    tau, nu, act = mdl["tau"], mdl["nu"], mdl["act"]
    b0 = mdl["b0"]
    z1, z2, bz, c1z, c2z = z
    zpt = (z1, z2)
    rows = []

    def row(yY, const_coeff_of_wz):
        # equation: eta(yY) - const*wz = 0
        c = coords(yY)
        return c + [F.neg(const_coeff_of_wz)]

    # (W3): w*g in K' for g in P_3 (contains P_2-part of K-23 (c) consequences)
    if use.get("W3", True):
        for g in monos(3):
            rows.append(row(act(g, omega), ev(F, g, zpt)))
    elif use.get("W2", False):
        for g in monos(2):
            rows.append(row(act(g, omega), ev(F, g, zpt)))
    for G in monos(2):
        jY = act(G, omega)
        jz = ev(F, G, zpt)  # times wz
        kY = [F.neg(v) for v in tau(jY)]          # K-36 (c)(i)
        # kappa(z) = eta(kY)  (kappa in K')  -> linear in eta; represent values as
        # (coeff vector on eta, coeff on wz)
        kz = (coords(kY), F.c(0))
        jzv = ([F.c(0)] * D, jz)
        piY = vadd(F, vmul(F, b0, jY), kY)
        piz = (kz[0], F.add(F.mul(bz, jz), kz[1]))  # pi(z) = bz*j(z) + kappa(z)

        def eqn(xY, xz):
            # eta(xY) - xz = 0 ; xz = (eta-coeffs, wz-coeff)
            c = coords(xY)
            return [F.sub(a, b) for a, b in zip(c, xz[0])] + [F.neg(xz[1])]
        if use.get("B0", True):
            xY = vmul(F, b0, piY)
            xz = ([F.mul(bz, v) for v in piz[0]], F.mul(bz, piz[1]))
            rows.append(eqn(xY, xz))
        for i, (ai_mono, zi, ciz) in enumerate([((1, 0), z1, c1z), ((0, 1), z2, c2z)]):
            if use.get("B12", True):
                # b_i = c_i + a_i b0 ; c_i = 0 on Y
                xY = act(ai_mono, vmul(F, b0, piY))
                biz = F.add(ciz, F.mul(zi, bz))
                xz = ([F.mul(biz, v) for v in piz[0]], F.mul(biz, piz[1]))
                rows.append(eqn(xY, xz))
            if use.get("C", True):
                # x = c_i j - a_i kappa ; on Y: -a_i kappa
                xY = [F.neg(v) for v in act(ai_mono, kY)]
                xz_eta = [F.sub(F.c(0), F.mul(zi, v)) for v in kz[0]]
                xz_w = F.mul(ciz, jz)
                rows.append(eqn(xY, (xz_eta, xz_w)))
    return rows


def wz_forced_zero(F, rows, D):
    ker = nullspace(F, rows, D + 1)
    return all(v[D] == 0 for v in ker), len(ker)


def part2(F, trials, dims_choices):
    stats = {"full_forced": 0, "full_total": 0}
    controls = {"only_W3": 0, "no_C": 0, "no_B12": 0, "no_B0": 0, "only_W2": 0, "c_zero": 0}
    ctrl_total = {k: 0 for k in controls}
    for _ in range(trials):
        dims = random.choice(dims_choices)
        mdl = build_model(F, dims, None)
        if mdl is None:
            continue
        D = mdl["D"]
        omega = lin(F, [F.rnd() for _ in range(D)], mdl["Mb"], mdl["Y"])
        while True:
            z = tuple(F.rnd() for _ in range(5))
            if (z[3], z[4]) != (0, 0):
                break
        rows = part2_system(F, mdl, omega, z, {})
        ok, dimker = wz_forced_zero(F, rows, D)
        stats["full_total"] += 1
        stats["full_forced"] += ok
        for name, use in [("only_W3", {"C": False, "B0": False, "B12": False}), ("no_C", {"C": False}), ("no_B12", {"B12": False}),
                          ("no_B0", {"B0": False}), ("only_W2", {"W3": False, "W2": True})]:
            r = part2_system(F, mdl, omega, z, use)
            okc, _ = wz_forced_zero(F, r, D)
            ctrl_total[name] += 1
            controls[name] += (not okc)
        z0 = (z[0], z[1], z[2], F.c(0), F.c(0))
        r = part2_system(F, mdl, omega, z0, {})
        okc, _ = wz_forced_zero(F, r, D)
        ctrl_total["c_zero"] += 1
        controls["c_zero"] += (not okc)
    return stats, controls, ctrl_total


def part2_identities(F, trials, dims_choices):
    """Exact check of the derivation lines of K-37: for arbitrary eta and
    arbitrary j_Y in K''|_Y (no hypothesis imposed at z), with j(z) := eta(j_Y)
    and kappa(z) := eta(kappa_Y) (j, kappa in K'), the residuals satisfy
      Res(P_i) = -Def(C'_i),  Res(Q_0) = -Def(B_0),
      Res(Q_i) = -Def(B_i) + z_i * Def(B_0),
    where Def(X) := eta(x|_Y) - x(z) for the vector x of hypothesis X.
    Also checks (b0*pi(j))|_Y = -nu(j_Y) (K-36 (c)(ii) in the model) and that
    tau, nu commute with a_1, a_2."""
    n_ok = 0
    for _ in range(trials):
        dims = random.choice(dims_choices)
        mdl = build_model(F, dims, None)
        if mdl is None:
            continue
        D, Y = mdl["D"], mdl["Y"]
        coords, tau, nu, act, b0 = mdl["coords"], mdl["tau"], mdl["nu"], mdl["act"], mdl["b0"]
        etav = [F.rnd() for _ in range(D)]

        def eta(y):
            return lin(F, coords(y), [[x] for x in etav], 1)[0]
        z1, z2, bz, c1z, c2z = (F.rnd() for _ in range(5))
        jY = lin(F, [F.rnd() for _ in range(D)], mdl["Mb"], Y)
        kY = [F.neg(v) for v in tau(jY)]
        jz, kz = eta(jY), eta(kY)
        piY = vadd(F, vmul(F, b0, jY), kY)
        piz = F.add(F.mul(bz, jz), kz)
        assert vmul(F, b0, piY) == [F.neg(v) for v in nu(jY)]
        for mono in ((1, 0), (0, 1)):
            assert tau(act(mono, jY)) == act(mono, tau(jY))
            assert nu(act(mono, jY)) == act(mono, nu(jY))
        defB0 = F.sub(eta(vmul(F, b0, piY)), F.mul(bz, piz))
        resQ0 = F.add(F.sub(F.mul(F.mul(bz, bz), eta(jY)), F.mul(bz, eta(tau(jY)))), eta(nu(jY)))
        assert resQ0 == F.neg(defB0)
        for mono, zi, ciz in (((1, 0), z1, c1z), ((0, 1), z2, c2z)):
            # (C'_i): x = c_i j - a_i kappa, c_i = 0 on Y
            xY = [F.neg(v) for v in act(mono, kY)]
            xz = F.sub(F.mul(ciz, jz), F.mul(zi, kz))
            defC = F.sub(eta(xY), xz)
            tj = tau(jY)
            resP = F.sub(F.mul(ciz, eta(jY)), F.sub(eta(act(mono, tj)), F.mul(zi, eta(tj))))
            assert resP == F.neg(defC)
            # (B_i): x = b_i pi(j), b_i = c_i + a_i b0
            xY = act(mono, vmul(F, b0, piY))
            xz = F.mul(F.add(ciz, F.mul(zi, bz)), piz)
            defB = F.sub(eta(xY), xz)
            bt = F.sub(F.mul(bz, eta(jY)), eta(tau(jY)))  # eta((beta_z - tau) j_Y)
            nj = nu(jY)
            resQ = F.add(F.mul(ciz, bt), F.sub(eta(act(mono, nj)), F.mul(zi, eta(nj))))
            assert resQ == F.add(F.neg(defB), F.mul(zi, defB0))
        n_ok += 1
    return n_ok


# ---------------------------------------------------------------- Part 3
def part3(F, drop=None):
    """Abstract unknowns: wz, t(m) for monomials m of degree <= 3 in the
    shifted variables, n(m) for degree <= 4. Equations (P'), (Q'), (Q0') for
    all G in P_2, for every choice of z-point, beta_z and l* = e1(a1-z1)+e2(a2-z2)
    with (e1,e2) != 0. Linear functionals t, n are extended linearly from
    monomials in a1, a2. Check: wz = 0 in every solution."""
    allm = monos(4)
    idx = {m: i for i, m in enumerate(allm)}
    nm = len(allm)
    # polynomials as dict mono->coeff
    def pmul(p, q):
        r = {}
        for (a, b), x in p.items():
            for (c, d), y in q.items():
                k = (a + c, b + d)
                r[k] = F.add(r.get(k, F.c(0)), F.mul(x, y))
        return r

    def pev(p, pt):
        s = F.c(0)
        for m, x in p.items():
            s = F.add(s, F.mul(x, ev(F, m, pt)))
        return s
    count = 0
    for z1, z2, bz, e1, e2 in itertools.product(F.elems(), repeat=5):
        if (e1, e2) == (0, 0):
            continue
        lstar = {(1, 0): F.c(e1), (0, 1): F.c(e2), (0, 0): F.neg(F.add(F.mul(e1, z1), F.mul(e2, z2)))}
        lstar = {k: v for k, v in lstar.items() if v != 0}
        zpt = (z1, z2)
        # unknown vector: [wz, t(m) for m in allm, n(m) for m in allm]
        N = 1 + 2 * nm
        rows = []

        def T(p):
            v = [F.c(0)] * N
            for m, x in p.items():
                v[1 + idx[m]] = F.add(v[1 + idx[m]], x)
            return v

        def Nn(p):
            v = [F.c(0)] * N
            for m, x in p.items():
                v[1 + nm + idx[m]] = F.add(v[1 + nm + idx[m]], x)
            return v
        for G in monos(2):
            Gp = {G: F.c(1)}
            Gz = ev(F, G, zpt)
            # (P') t(l* G) - wz G(z) = 0
            r = T(pmul(lstar, Gp))
            r[0] = F.sub(r[0], Gz)
            if drop != "P":
                rows.append(r)
            # (Q') bz wz G(z) - t(G) + n(l* G) = 0
            r = [F.sub(a, b) for a, b in zip(Nn(pmul(lstar, Gp)), T(Gp))]
            r[0] = F.add(r[0], F.mul(bz, Gz))
            if drop != "Q":
                rows.append(r)
            # (Q0') bz^2 wz G(z) - bz t(G) + n(G) = 0
            r = [F.sub(a, F.mul(bz, b)) for a, b in zip(Nn(Gp), T(Gp))]
            r[0] = F.add(r[0], F.mul(F.mul(bz, bz), Gz))
            if drop != "Q0":
                rows.append(r)
        ker = nullspace(F, rows, N)
        forced = all(v[0] == 0 for v in ker)
        if drop is None:
            assert forced, (z1, z2, bz, e1, e2)
        count += forced
    return count


def main():
    random.seed(20261126)
    out = []
    # Part 1
    for p, d, tr, ex in [(2, 1, 200, True), (2, 2, 200, True), (3, 1, 200, True), (3, 2, 100, True),
                         (2, 3, 100, False), (5, 3, 100, False), (0, 2, 100, False), (0, 4, 50, False)]:
        F = Fld(p)
        bad, fd = part1(F, d, tr, ex)
        neg = part1_negative(F, d, 300)
        out.append("Part1 K-36 %s d=%d trials=%d exhaustive=%s: violations=%d, no-direct-sum-found=%d, "
                   "control(not direct): kappa not determined in %d cases"
                   % (F.name(), d, tr, ex, bad, fd, neg))
        assert bad == 0
    # Part 2
    # small models (W3 alone often forces w(z)=0 here, so controls are weak)
    # and realistic models: sum of d = 13, |Y| = 26, at least 10 distinct
    # points, as in K-35 (G2); there W3 alone leaves w(z) free.
    real = [[1] * 13, [2] * 3 + [1] * 7, [2, 2, 2, 2, 1, 1, 1, 1, 1]]
    for p, tr, dc in [(2, 100, [[1], [1, 1], [2]]), (3, 100, [[1, 1], [2], [1, 2]]),
                      (5, 30, real), (7, 30, real), (11, 30, real), (0, 10, real)]:
        F = Fld(p)
        st, ctrl, ctot = part2(F, tr, dc)
        out.append("Part2 K-37 %s: w(z)=0 forced in %d/%d models; controls (w(z)!=0 possible): %s of %s"
                   % (F.name(), st["full_forced"], st["full_total"], ctrl, ctot))
        assert st["full_forced"] == st["full_total"]
    for p, tr in [(2, 100), (3, 100), (5, 50), (0, 20)]:
        F = Fld(p)
        k = part2_identities(F, tr, [[1, 1], [2], [1, 2], [2, 1, 1]] if p in (2, 3) else real)
        out.append("Part2b K-37 derivation identities %s: exact in %d/%d random models" % (F.name(), k, tr))
        assert k == tr
    # Part 3
    for p in (2, 3, 5):
        F = Fld(p)
        n = part3(F)
        out.append("Part3 K-37 four values %s: w(z)=0 forced for all %d parameter choices" % (F.name(), n))
        for dr in ("P", "Q", "Q0"):
            m = part3(F, dr)
            out.append("  control without (%s'): w(z)=0 still forced in %d of %d choices" % (dr, m, n))
    print("\n".join(out))


if __name__ == "__main__":
    main()
```

## Anhang B: Ausgabe des Laufs

```
Part1 K-36 GF(2) d=1 trials=200 exhaustive=True: violations=0, no-direct-sum-found=0, control(not direct): kappa not determined in 189 cases
Part1 K-36 GF(2) d=2 trials=200 exhaustive=True: violations=0, no-direct-sum-found=0, control(not direct): kappa not determined in 229 cases
Part1 K-36 GF(3) d=1 trials=200 exhaustive=True: violations=0, no-direct-sum-found=0, control(not direct): kappa not determined in 176 cases
Part1 K-36 GF(3) d=2 trials=100 exhaustive=True: violations=0, no-direct-sum-found=0, control(not direct): kappa not determined in 217 cases
Part1 K-36 GF(2) d=3 trials=100 exhaustive=False: violations=0, no-direct-sum-found=0, control(not direct): kappa not determined in 253 cases
Part1 K-36 GF(5) d=3 trials=100 exhaustive=False: violations=0, no-direct-sum-found=0, control(not direct): kappa not determined in 115 cases
Part1 K-36 Q d=2 trials=100 exhaustive=False: violations=0, no-direct-sum-found=0, control(not direct): kappa not determined in 36 cases
Part1 K-36 Q d=4 trials=50 exhaustive=False: violations=0, no-direct-sum-found=0, control(not direct): kappa not determined in 4 cases
Part2 K-37 GF(2): w(z)=0 forced in 100/100 models; controls (w(z)!=0 possible): {'only_W3': 17, 'no_C': 10, 'no_B12': 0, 'no_B0': 0, 'only_W2': 0, 'c_zero': 17} of {'only_W3': 100, 'no_C': 100, 'no_B12': 100, 'no_B0': 100, 'only_W2': 100, 'c_zero': 100}
Part2 K-37 GF(3): w(z)=0 forced in 100/100 models; controls (w(z)!=0 possible): {'only_W3': 12, 'no_C': 3, 'no_B12': 0, 'no_B0': 0, 'only_W2': 0, 'c_zero': 7} of {'only_W3': 100, 'no_C': 100, 'no_B12': 100, 'no_B0': 100, 'only_W2': 100, 'c_zero': 100}
Part2 K-37 GF(5): w(z)=0 forced in 30/30 models; controls (w(z)!=0 possible): {'only_W3': 15, 'no_C': 1, 'no_B12': 0, 'no_B0': 0, 'only_W2': 0, 'c_zero': 5} of {'only_W3': 30, 'no_C': 30, 'no_B12': 30, 'no_B0': 30, 'only_W2': 30, 'c_zero': 30}
Part2 K-37 GF(7): w(z)=0 forced in 30/30 models; controls (w(z)!=0 possible): {'only_W3': 16, 'no_C': 0, 'no_B12': 0, 'no_B0': 0, 'only_W2': 0, 'c_zero': 2} of {'only_W3': 30, 'no_C': 30, 'no_B12': 30, 'no_B0': 30, 'only_W2': 30, 'c_zero': 30}
Part2 K-37 GF(11): w(z)=0 forced in 30/30 models; controls (w(z)!=0 possible): {'only_W3': 21, 'no_C': 0, 'no_B12': 0, 'no_B0': 0, 'only_W2': 0, 'c_zero': 4} of {'only_W3': 30, 'no_C': 30, 'no_B12': 30, 'no_B0': 30, 'only_W2': 30, 'c_zero': 30}
Part2 K-37 Q: w(z)=0 forced in 10/10 models; controls (w(z)!=0 possible): {'only_W3': 5, 'no_C': 0, 'no_B12': 0, 'no_B0': 0, 'only_W2': 0, 'c_zero': 0} of {'only_W3': 10, 'no_C': 10, 'no_B12': 10, 'no_B0': 10, 'only_W2': 10, 'c_zero': 10}
Part2b K-37 derivation identities GF(2): exact in 100/100 random models
Part2b K-37 derivation identities GF(3): exact in 100/100 random models
Part2b K-37 derivation identities GF(5): exact in 50/50 random models
Part2b K-37 derivation identities Q: exact in 20/20 random models
Part3 K-37 four values GF(2): w(z)=0 forced for all 24 parameter choices
  control without (P'): w(z)=0 still forced in 0 of 24 choices
  control without (Q'): w(z)=0 still forced in 0 of 24 choices
  control without (Q0'): w(z)=0 still forced in 0 of 24 choices
Part3 K-37 four values GF(3): w(z)=0 forced for all 216 parameter choices
  control without (P'): w(z)=0 still forced in 0 of 216 choices
  control without (Q'): w(z)=0 still forced in 0 of 216 choices
  control without (Q0'): w(z)=0 still forced in 0 of 216 choices
Part3 K-37 four values GF(5): w(z)=0 forced for all 3000 parameter choices
  control without (P'): w(z)=0 still forced in 0 of 3000 choices
  control without (Q'): w(z)=0 still forced in 0 of 3000 choices
  control without (Q0'): w(z)=0 still forced in 0 of 3000 choices

SHA-256 check_k36_k37.py: cf1be5d2e37080a725788955c15a434fe381d06f63c8c18ed6b2d5a76084aa9f
```
