# V-S2-02: Wangs dynamisches Programm allein für R_𝔽₂(⟨2,4,4⟩) ≥ 26

- Ziel: untere Schranke 26 für ⟨4,2,4⟩ (gleichwertig ⟨2,4,4⟩) über 𝔽₂, Stufe 2, Spur A
- Idee: Wangs Programm (arXiv:2603.07280, github.com/wcgbg/tensor-rank-lower-bound) ohne Änderung auf ⟨2,4,4⟩ ansetzen. Der Raum der ersten Faktoren 𝔽₂^{2×4} hat nur 86 Orbits von Unterräumen, die Tabelle ist also klein.
- Woran es scheiterte:
  - Mit Schrittgrenze 1 Mio. je Versuch liefert das Programm nach 12 Minuten auf 4 Kernen **R_𝔽₂(⟨2,4,4⟩) ≥ 22**, Zertifikat vom Prüfprogramm angenommen. Das liegt unter den bekannten Schranken 23 (Bläser 1999, Ja'Ja'-Takche 1985 über 𝔽₂) und 25 (Yang v3).
  - Die beiden Hyperebenen-Orbits bekommen 21, deshalb oben nur 21 + 1 = 22. Für 26 oben müssten die Schranken der oberen Schichten um etwa 4 steigen, denn jeder Zweig der Substitution braucht s + b ≥ 26 mit s getöteten Termen und der Schranke b eines kleineren Unterraums.
  - Mit Schrittgrenze 10 Mio. kam ein Block von 28 Minuten nicht über die mittlere Schicht (Unterräume der Dimension 4, 30 Orbits) hinaus. Mit 20 Mio. nur für die oberen vier Schichten kam ein weiterer Block von 28 Minuten über die Schicht der Dimension 5 nicht hinaus und hob dort einen Orbit von 19 auf 20. Die Schranke oben blieb 22.
  - Die Tabelle ist schon in der Mitte schwach. Beispiel: Orbit 76 (Unterraum der Matrizen mit erster Spalte 0, das ist ⟨2,3,4⟩) bekommt 18, der Rang über 𝔽₂ ist laut D'Ambrosio 20 und Wang selbst erreicht 19.
- Was man daraus lernt:
  - Das reine Programm ist für dieses Format rund 3 bis 4 unter dem Ziel. Mehr Rechenzeit in der Größenordnung dieser Runde ändert daran wenig, die Verbesserungen pro Block sind einzelne Orbits um 1.
  - Was über 𝔽₂ tatsächlich bis zur exakten Zahl führte (⟨2,3,4⟩ = 20, ⟨3,3,3⟩ = 23), waren die Nachfolger: Kapazitäten, Profile der ersten Faktoren, Aufzählung der Mengen erster Faktoren und Vervollständigungssuche. Bei ⟨3,3,3⟩ kostete das rund 478 000 vCPU-Stunden.
  - Wangs Programm ist als Grundtabelle trotzdem brauchbar: Seine Zertifikate lassen sich in Sekunden prüfen und liefern die Kapazitäten für die Nachfolgeverfahren.
- Runde und Datum: Stufe 2, Runde 1, 25.11.2026
