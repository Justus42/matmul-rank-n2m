<!-- S2-22: Antwort des Fremdmodells openai/gpt-6.2-sol (Denkstufe high, Batch über die Bridge, Kennung openrouter:batch-1795619613-OLOC8jmZ6SEJ8YbQUBfF, abgegeben 25.11.2026 16:13, fertig 16:15, 9.037 Ausgabe-Tokens, 0,06 US-$). Auftrag wörtlich in gpt_auftrag.md (als prompt inline gesendet, da die Bridge das Repo nicht lesen darf). Einordnung in lean/prosa/s2_444_spurA_r4_pruefung.md Abschnitt 6. Die vollständige Antwort liegt im Batch-Speicher von OpenRouter bis 25.12.2026 und ist dort mit der Kennung abrufbar. -->

Hinweis: Die Antwort ist hier in Auszügen wörtlich wiedergegeben (Urteil, Punkte 6 bis 9). Punkte 1 bis 5 bestätigen die Schritte 0 bis 4 jeweils mit JA; ihre Präzisierungen sind im Prüfbericht Abschnitt 6 vollständig aufgeführt.

**Urteil vorweg:** Satz C hält für die ausdrücklich definierte **Symmetrie auf einer nichtleeren offenen Menge**. Die Auswertung mit dualen Zahlen liefert den behaupteten Widerspruch, auch in Charakteristik 2. Die Lücke liegt in C1: Der zitierte Lean-Satz liefert Symmetrie für eine einzelne Normalisierung, nicht die Konstanz des Rangpaars bei wechselnder Normalisierung. Die **generische** Fassung von C1 lässt sich dagegen beweisen.

1. Schritt 0 — JA, mit Präzisierungen (Projektivkarte, Minoren bei a_t = 0 nicht äquivalent zu M b_t ∈ K a_t, Konstantenwahl braucht unendlichen Körper; d = (0,1) bleibt auf der normierten Geraden).
2. Schritt 1 — JA (Vorzeichen, Transpositionen, Umbenennung stimmen; ω(p′,p) = −ω(p,p′) auch in Charakteristik 2).
3. Schritt 2 — JA (Auswertung im Ring der an der Stelle regulären rationalen Ausdrücke; keine Division durch ε; (Kl) mit Plus).
4. Schritt 3 — JA, an der gewählten nichtentarteten Stelle (W surjektiv, Zeilenrang = Bildrang, Dimension 10 ohne Division durch 2; a_t ≠ 0, μ_t = 0 würde die Dimensionsgleichheit zerstören und wird zu Recht vermieden).
5. Schritt 4 — JA (Übergang zum algebraischen Abschluss zulässig, erfasst 𝔽₂; Charakteristik-2-Schritt geht auch ohne Quadratwurzeln: Das Argument mit A = l pᵀ zeigt, dass die a_t(p) den Raum aufspannen, und eine Form Σ c_i x_i², die auf Erzeugern verschwindet, verschwindet auf dem Spann).

### 6. Symmetriebegriff — TEILWEISE

**Nach Fixierung von p und Wahl der angepassten Koordinaten** ist `IsSymm` genau die punktweise Gleichung Gᵀb_t = μ_t a_t: Man liest die Koeffizienten von y in der Lean-Gleichung ab. Sind b_t ≠ 0 und G invertierbar, ist μ_t ≠ 0 automatisch. Der entscheidende Unterschied ist also nicht die Zulässigkeit von μ_t = 0, sondern der **Quantor über p**.

`IsSymm` für geeignete Normalisierungen an allen Stellen einer nichtleeren offenen Menge genügt. Sogar eine schwächere Zusatzbedingung reicht für den Beweis: An **einer** nichtentarteten Stelle muss sich (S) in einer Richtung d mit ω(p,d) ≠ 0 auf p + εd heben lassen, mit einer invertierbaren Fortsetzung von M. Dann erhält man (Kl) direkt. Ein bloßer Punktzeuge liefert diese Hebung nicht.

Damit ist die Einpunktfassung von Satz C durch das Artefakt **nicht bewiesen**. Das ist nicht dasselbe wie ein Gegenbeispiel der Länge 25; ein solches folgt aus der Prüfung nicht. Auch die Begründung in V1, ein an einer festen Stelle verschwindendes b_t erzwinge β_t = 0, wäre ohne die generische Wahl oder den ausdrücklichen Ausschluss dieser Nullstelle nicht gültig.

### 7. Folgerung C1 — NEIN in der wörtlichen Fassung; JA als generische Aussage

Aus der Offenheit der zulässigen Normalisierungen folgt nicht, dass das Rangpaar auf **allen** zulässigen Normalisierungen gleich ist. Zudem hängt nach den zitierten Definitionen rk H möglicherweise von u_0 ab, nicht nur von p. Der Lean-Satz transportiert weder das Rangpaar noch seinen Symmetriezeugen von einer Normalisierung zur nächsten. Das ist eine echte Lücke, wenn C1 **jede einzelne** Normalisierung mit Rangpaar (3,6) ausschließen soll.

Die für das Rangziel ausreichende Fassung lautet:

> Für jede hypothetische Zerlegung der Länge 25 über dem algebraischen Abschluss ist das **generische** Rangpaar der zulässigen Normalisierungen nicht (3,6). Wenn die Restfallklassifikation generisch nur (3,6) und (5,8) zulässt, ist das generische Rangpaar folglich (5,8).

Zur Begründung arbeitet man auf der offenen Menge der zulässigen **Paare** (p, u_0). Lokal ergänzt man u_0 zu einer Basis und trivialisiert den Quotienten nach J = Ψ_p(u_0, U) mittels eines nichtverschwindenden 4×4-Minors. In diesen Koordinaten haben L, H reguläre Matrixeinträge. Ihre Ränge sind auf einer gemeinsamen nichtleeren offenen Teilmenge konstant. Wäre dort das Rangpaar (3,6), fixierte man u_0 aus einem Punkt dieser Teilmenge. Der Schnitt bei diesem u_0 enthält eine nichtleere offene Menge von p. An jeder dieser Stellen ist Satz B auf die jeweilige Normalisierung anwendbar. Das liefert gerade die Symmetrie, die Satz C verbietet.

Damit genügt es für das Gesamtziel, (5,8) **generisch** auszuschließen; Ausnahme-Normalisierungen müssen nicht klassifiziert werden. Das erreicht noch nicht selbst den Rang 26. Der Konstruierbarkeitsschritt in C2 ist richtig; für die weiteren Schlüsse dort müssen V′ und Lemma 13′ auf der jeweils verwendeten offenen Menge anwendbar sein. Aus 8 ≥ 7 + s allein folgt nur s ≤ 1; für s = 1 braucht man zusätzlich s ≥ 1. C3 macht die richtige Einschränkung.

### 8. Gegenbeispiele und C′ — JA

Hindernis für **Einpunkt-Symmetrie ⇒ offene Symmetrie**: a_1 = a_2 = p_1 e_1, b_1 = p_1 e_1, b_2 = p_1 e_1 + p_2 e_2. Bei p = (1,0) funktioniert M = I; für p_1p_2 ≠ 0 kann kein invertierbares M die unabhängigen b_1, b_2 auf dieselbe Gerade schicken. Kein Gegenbeispiel der Länge 25. Auch bei echten Zerlegungen kann das durch Aufspalten eines Terms auftreten: Strassens erster Term über ℚ, β ersetzt durch β/2 + γ, β/2 − γ mit γ(B) = B_11 + B_21; bei s = 1 bleibt die Symmetrie, generisch nicht. Über 𝔽₂ hat diag(c_1, c_2, c_1+c_2, c_1) keine invertierbare Spezialisierung, obwohl die Determinante kein Nullpolynom ist; das widerlegt die Konstantenwahl nur ohne Unendlichkeitsannahme. C′ ist mit 7 und 15 verträglich; für beliebige Längen streicht man Nullterme statt B-007 zu verwenden.

### 9. Gesamturteil — TEILWEISE: Satz C hält; C1 hält mit generischer Reparatur

Für Satz C sehe ich keinen algebraischen Gegenfehler. Die Präzisierungen betreffen die Minoren bei a_t = 0, die unendliche Konstantenwahl, die Projektivkarte und die explizite Beschränkung auf reguläre Nenner. Die **sachliche Lücke** steht in Abschnitt 4 beim Satz, das Rangpaar sei auf der ganzen zulässigen Menge dasselbe. Diesen Satz sollte man durch die generische Fassung ersetzen, nicht aus `satzB_symm_unbedingt` herauslesen.

Für Lean würde ich zuerst ein algebraisches Kernlemma formulieren: **Symmetrie mit einer Hebung über die dualen Zahlen an einer nichtentarteten Stelle erzwingt Länge mindestens 26.** Dann beweist man getrennt, dass offene Symmetrie eine solche Hebung liefert und dass generisches Rangpaar (3,6) nach Satz B die nötige Symmetrie erzeugt. Die Rechnungen (D)–(Kl) und die Kontraktion sind dabei nicht die schwierigsten Teile. Aufwendiger sind die rationale Kernbasis mit Spezialisierung, die Skalarerweiterung der Algorithmen und der Wechsel der Normalisierung mitsamt dem Quotienten nach J(p, u_0). Genau an dieser letzten Schnittstelle muss die Formalisierung zwischen einem einzelnen `IsSymm`-Zeugen und einer generischen Aussage unterscheiden.
