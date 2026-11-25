# Auftrag an GPT 6.2 Sol (Batch, high), 25.11.2026

Systemrolle: „Du bist ein kritischer mathematischer Prüfer. Antworte auf Deutsch.“

Auftrag: Lies den folgenden Prosa-Beweis (Lemma P, elementare Fassung) Schritt für Schritt gegen, bevor er in Lean formalisiert wird. Prüfe jeden Schritt 0 bis 10 auf Richtigkeit und Vollständigkeit unter genau den Voraussetzungen (H1), (H2), (H3) und "K unendlich" (nicht algebraisch abgeschlossen). Achte besonders auf: Schritt 3 (Eigenwertargument für die Endlichkeit), Schritt 5 (Schubfach, Injektivität von t ↦ m_t), Schritt 7 (Wahl von t_1 und Basis), Schritt 8 (Eigenwertargument als Ersatz für Kronecker, insbesondere ob p_1(Z) = K* wirklich folgt und ob die Quotienten b_t/a_t paarweise verschieden sind), Schritt 9 (m ≤ 3 und rk F_{γ*} = 1 nur aus (H3)). Gib für jeden Schritt ein Urteil (hält / hält mit Reparatur / Lücke / falsch) mit Begründung, nenne benötigte Reparaturen konkret, und schließe mit einem Gesamturteil: Ist Lemma P in dieser Fassung unter (H1)–(H3) über jedem unendlichen Körper richtig bewiesen? Suche auch aktiv nach Gegenbeispielen zu Zwischenaussagen.

Text (wörtlich): der Inhalt von `lemmaP_prosa.md` (die Pfadangabe in der Grundlagenzeile war im Auftrag gekürzt).
