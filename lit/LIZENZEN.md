# Lizenzen fremder Quellen

Eine Zeile pro fremdem Repo oder Code. Es gilt die Lizenzregel in Abschnitt 11.3 des Protokolls.

| Quelle | Commit | Lizenz | Was wir dürfen | Stand |
|---|---|---|---|---|
| github.com/fallnlove/mm325_proof | 759cf4a8524d4212e7832046204c90b9361ba2bb | **keine angegeben** | lesen, verlinken, zitieren, extern klonen und bauen; als Lake-Abhängigkeit per URL einbinden; **nicht** Code in unser Repo kopieren | geklärt am 24.11.2026 (A-01) |
| mathlib4 (Abhängigkeit des obigen Repos) | c44e0c8ee63ca166450922a373c7409c5d26b00b (Tag v4.19.0) | Apache-2.0 (bekannt, nicht neu nachgelesen) | nutzen als Abhängigkeit | vermutet |
| github.com/wcgbg/tensor-rank-lower-bound (Chengu Wang) | 9db3d215267932ba3e8801a10655a2d538ed13d8 | MIT, Copyright (c) 2026 Chengu Wang (Datei `LICENSE` gelesen) | übernehmen mit Lizenzhinweis; in S2-02 nur extern benutzt, nichts kopiert | geklärt am 25.11.2026 (S2-02, eingetragen in S2-07) |
| github.com/nliskij/border-rank (Liskij u. a., zu arXiv:2610.13905) | nicht ermittelt (Commit-Zeile auf der Seite leer) | **keine angegeben** (keine `LICENSE`-Datei auf der Startseite, nur README gelesen) | lesen, verlinken, zitieren; **nicht** in unser Repo kopieren | festgestellt am 25.11.2026 (S2-07) |

---

## fallnlove/mm325_proof (Auftrag A-01)

### Erreichbarkeit

- Am 24.11.2026 öffentlich erreichbar, `git clone` ohne Anmeldung möglich.
- Genau ein Commit: `759cf4a` vom 18.09.2026, Autor Askar Tsyganov, Nachricht „first commit". Seitdem keine Änderung.
- Inhalt: `MatrixMultiplicationLowerBound25.lean` (90.729 Bytes, 131 Deklarationen), `Audit.lean`, `README.md`, `verification.txt`, `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`.
- Toolchain `leanprover/lean4:v4.19.0`, mathlib auf Commit `c44e0c8…`, das ist genau der Tag `v4.19.0` (per `git ls-remote` abgeglichen).

### Lizenz

- Keine `LICENSE`- oder `COPYING`-Datei, kein Lizenzhinweis im README, kein SPDX- oder Copyright-Kopf in den Lean-Dateien.
- Ohne Lizenz gilt das Urheberrecht der Autoren uneingeschränkt. Die GitHub-Nutzungsbedingungen erlauben anderen nur, öffentliche Repos auf GitHub anzusehen und zu forken.
- Die GitHub-API ließ sich aus der Sitzung nicht abfragen (Zugriff auf fremde Repos gesperrt). Die Feststellung beruht auf dem vollständigen Klon.

### Was davon für den Lean-Nachbau nutzbar ist

1. **Stufe 0, A-02 (bauen und Axiome prüfen):** erlaubt. Der Build läuft in einem externen Klon. Nichts davon wird in unser Repo eingecheckt. Unser Repo hält nur Commit-Hash und Bericht.
2. **GitHub Actions (A-11):** der Workflow klont das Repo zur Laufzeit am festen Commit. Keine Kopie im Repo.
3. **Stufe 1 (eigene Sätze auf deren Definitionen aufbauen):** möglich über `[[require]]` in unserem `lakefile.toml` mit Git-URL und festem `rev`. Damit verteilen wir keinen fremden Code, nur einen Verweis. Nachteil: wir hängen an Lean 4.19.0 und daran, dass das Repo online bleibt.
4. **Nicht erlaubt:** die `.lean`-Datei oder größere Teile daraus kopieren, umbauen und bei uns veröffentlichen.
5. **Mathematik ist frei:** Satzaussagen, Beweisideen und die Struktur des Arguments sind nicht geschützt. Eine eigenständig geschriebene Formalisierung mit Quellenangabe (TPSR26) ist erlaubt, nur kein zeilenweises Abschreiben.
6. **Ausweg, falls Kopieren nötig wird:** die Autoren um eine Lizenz bitten (z. B. Apache-2.0 wie mathlib). Das darf nur Justus selbst tun, nicht ein Agent (Protokoll, Abschnitt 9).

Das entspricht dem zweiten Fall der Lizenzregel (Protokoll 11.3): keine Lizenz, also Verweis statt Kopie oder Neuschreiben aus dem Paper.

Keine Rechtsberatung. Das ist die übliche Lesart von „kein Lizenzhinweis".

### Nebenbefunde für die folgenden Aufträge (Status: behauptet, ungeprüft)

- **Für A-02:** `verification.txt` nennt als Quell-Prüfsumme `9d3ebc3a…d298`. Die eingecheckte `MatrixMultiplicationLowerBound25.lean` hat SHA-256 `b1ec8c87dbdff3de92effa9b41de0a0c3ba61001525fea1eaa853aec51e8ed79` (auch mit CRLF oder ohne letzten Zeilenumbruch keine Übereinstimmung). Der Prüfbericht vom 17.09.2026 gehört also nicht zur eingecheckten Datei. Das ist kein Fehlerbeleg, macht aber den eigenen Build in A-02 umso nötiger.
- **Für A-02:** Laut README und `Audit.lean` nur Standard-Axiome (`propext`, `Classical.choice`, `Quot.sound`), kein `sorry`, kein `native_decide`. Ein `grep` auf `sorry`, `axiom` und `native_decide` in der Lean-Datei fand nichts. Maßgeblich bleibt der eigene Build.
- **Für A-03:** Der Lean-Satz ist allgemeiner als „Rang 3×2×5 ≥ 25": `theorem_one` sagt `24 * m < 5 * R` für jeden Körper K und jedes m > 0, `rank_325_ge25` ist die Folgerung für m = 5. Das ergibt ⌊24m/5⌋ + 1. Das ist für manche m schwächer als Yangs ⌈(24m+2)/5⌉ (bei m = 6: 29 gegen 30). Für m = 5 stimmen beide mit 25 überein.
