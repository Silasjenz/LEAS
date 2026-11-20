# Chatverlauf mit Claude – LEAS Wechselrichter einphasig

Zusammenfassung der Fragen und Antworten (13.11. und 20.11.2026), chronologisch. Die Antworten sind gekürzt; Korrekturen aus späteren Antworten sind markiert.

---

## Tag 1 – 13.11.2026

### Wie müssen wir vorgehen?
- Vorbereitung: P = U_N·U_WR1·sin θ / X (über θ), Q ≈ U_N·(U_WR1·cos θ − U_N)/X (über Amplitude bzw. Udc). X = 2π·50·0.07 ≈ 22 Ω.
- Stromskizze Rechteck mit U_WR1 = U_N: I₁ ≈ 0, nur Oberschwingungsstrom (Integral von «Rechteck minus Sinus»).
- Harmonische Rechteck: U_n = (4/π)·Udc/n, I_n = U_n/(n·X) → 1/n².
- Udc für U_WR1 = U_N: Udc = (π/4)·Û_N (≈ 255 V auf der 230-V-Seite, ≈ 444 V auf der 400-V-Seite).
- Ablauf: Inbetriebnahme mit Assistent, PM3000 auf «Netz», dann 6.1 → 6.2 → 6.3 → 6.4.

### Wie müssen wir verkabeln?
- Der Leistungskreis ist schon verkabelt (Netz → Trafo → Kopplungsinduktivität → WR → GM-Anker). Selbst angeschlossen werden nur die Messgeräte.
- PM3000: Strompfad in Serie im AC-Kreis, Spannung über den Wahlschalter.
- Oszi: CH1 u_N, CH2 u_WR, CH3 i_N (Zange), CH4 Udc bzw. u_IGBT. Trigger auf CH1.
- Spannungen nur über Trennverstärker messen. Nur im ausgeschalteten Zustand umstecken.

### Wo müssen die Messleitungen angeschlossen werden? (mit Fotos vom Aufbau)
- Udc: WR-Panel + / − (oder GM A1/A2).
- u_WR: die zwei Buchsen direkt links der H-Brücke.
- Buchsen ganz links am Panel: Spannung nach der Drossel, **nicht** die Netzspannung.
- u_IGBT: + gegen obere u_WR-Buchse.
- i_N: Zange zwischen Trafo-Sekundär und Kopplungsinduktivität.
- Das TPS2014 hat isolierte Kanäle, die Standard-Tastköpfe sind aber nur bis 300 V zugelassen → Trennverstärker.
- Drehzahl: Reflexband auf die gelbe Kupplung.

### Wo wird u_N gemessen?
- An den Buchsen «Trenntransformator Sekundär» (Drosselseite, darauf bezieht sich θ). Trafoseiten mit dem Multimeter prüfen.

### Was macht ein Wechselrichter?
- DC → AC über eine H-Brücke (IGBTs diagonal paarweise). Rechteck = Grundfrequenztaktung, andere Pulsmuster reduzieren die Oberschwingungen.
- Am Netz ist Energiefluss in beide Richtungen möglich: θ → P, Amplitude → Q. Die Drossel ist nötig, weil zwei Spannungsquellen nicht direkt parallel geschaltet werden können.

### GM macht eine Gleichspannung, oder?
- Ja, als Generator: Der Kommutator richtet gleich. U ≈ k·Φ·n. n ist durch die ASM fest, Udc wird über die Erregung (F1/F2) eingestellt.
- Bei Netzbezug arbeitet die GM als Motor und die ASM als Generator, daher ändert sich die Drehzahl leicht (6.4).

### Wofür ist der Schalter Netz ↔ WR?
- Er wählt die Spannung für das PM3000; der Strom ist immer i_N.
- «Netz»: P/Q/cos φ/λ auf der Netzseite. «WR»: Spektrum von u_WR.
- P ist in beiden Stellungen ≈ gleich, Q_WR − Q_N ≈ I²·X (Plausibilitätscheck).

### Was müssen wir alles messen? / Checklisten
- Komplette Messliste pro Aufgabe. Daraus entstanden drei .md-Checklisten (komplett, nur Messungen, Minimalversion).

### I₁ ist ≈ 0.8 A statt 0 – schlimm?
- Nein. 0.8 A entsprechen ~18 V Differenz, die Oberschwingungen sind ähnlich gross. Q₁ gross → Udc nachstellen, P₁ gross → θ nachstellen. Im Bericht als Minimum notieren.

### Was kommt bei «Harmonische»?
- Am PM3000 über HARMONIC ANALYSIS ablesen. Erwartung bei 230 V: U₃ 77 V, U₅ 46 V, U₇ 33 V; I₃ ≈ 1.2 A, I₅ ≈ 0.4 A, I₇ ≈ 0.2 A. Nur ungerade Ordnungen.

### Unterschied P und P₁
- P = Mittelwert von u·i über alle Frequenzen, P₁ = U₁·I₁·cos φ₁. Weil u_N fast sinusförmig ist, gilt P ≈ P₁.
- Q (PM3000) = √(S² − P²) enthält die Verzerrungsblindleistung → Q > Q₁ und Q wird nie 0. Daher λ < cos φ₁.

### Wie liest man P, Q, P₁, Q₁, I₃ ab?
- P: Taste W, Q: Taste VAr. P₁, Q₁ über das Harmonics-Menü bei n = 1. I₃ im Harmonics-Menü bei n = 3 (absolut in A verwenden, nicht in %).
- **Korrektur später:** Der Phasenwinkel bei n = 1 ist am PM3000 immer 0° (siehe Tag 2).

### Von wo bis wo Udc variieren?
- Um den Nullpunkt herum, Udc₀ ± 75–100 V in 25-V-Schritten (ΔI₁ ≈ ΔUdc/25 Ω).
- Grenzen: 500 V (GM), Strom unter ~5 A, nicht zu tief (sonst leiten die Freilaufdioden ungesteuert). θ fest lassen.

### Was ist ein Pulsmuster?
- Schaltzeitpunkte pro Periode. Rechteck; 3.–5./3.–9./3.–21. eliminiert (Kerben an berechneten Winkeln); Sinus-PWM fein/grob (Pulsbreite folgt Sinus, Oberschwingungen bei der Schaltfrequenz).
- Nach jedem Musterwechsel Udc nachstellen.

### Warum der Lastpunkt 1.5 kW / Q₁ = 0 und nicht der synchronisierte Zustand?
- «Synchron» gilt bei allen Messungen. Bei I₁ ≈ 0 besteht der Strom nur aus Oberschwingungen, THD und Prozentwerte sind dann sinnlos. Nur ein gleicher Lastpunkt erlaubt einen fairen Vergleich, und er ist realistisch (Einspeisung mit cos φ = 1).

### Leistung lässt sich nicht direkt einstellen?
- Richtig, iterativ: θ für P einstellen → Udc für Q₁ = 0 → θ nachkorrigieren, 2–3 Durchgänge. Toleranz ±50 W / ±50 var.

### Schalterstellung bei Pulsmustern / P erreicht 1.5 kW nicht
- Zum Einstellen «Netz». PWM hat kleineres U_WR1 (≈ 0.6–0.7·Udc) → Udc deutlich erhöhen. Sonst den Lastpunkt für alle Muster gleich reduzieren (z. B. 1 kW).

### Kein Strom mehr auf der Zange
- Prüfen, ob das PM3000 noch Strom anzeigt. Wenn ja: Zange (Auto-Off, Batterie, Bereich, nicht geschlossen) oder Oszi-Einstellungen. Wenn nein: Fehler-LED am WR, gekoppelt?, Udc, ASM.

---

## Tag 2 – 20.11.2026

### Kann man die Pulsmuster-Messung vereinfachen?
- Ja. Der Lastpunkt ist in der Anleitung nur ein «z. B.». Kleineren Lastpunkt wählen, für alle Muster gleich. Q₁ grob ~0. Nur 3 Muster. Pro Muster Screenshot + I₁, I₃, I₅ (oder THD_I) + θ, Udc. In 6.2.2 beim besten Muster bleiben, je 3 Punkte, cos φ/λ ablesen.
- Schalterstellung dafür: «Netz».

### Blindleistung lässt sich nicht auf 0 bringen
- Wahrscheinlich wurde das Gesamt-Q abgelesen, das nie 0 wird. Q₁ ist gefragt.
- Für Q₁ = 0 braucht es U_WR1 = U_N / cos θ → Lastpunkt verkleinern, falls Udc an der Grenze ist. Udc sackt unter Last ab.

### Der Phasenwinkel bei n = 1 ist immer 0
- **Korrektur:** Das PM3000 bezieht die Harmonischen-Phasen auf die eigene Grundschwingung, deshalb ist dieser Winkel unbrauchbar.
- Methode: Bei festem P ist Q₁ = 0 dort, wo I₁ minimal ist (U₁·I₁ ≈ P). Q₁ = ±√((U₁I₁)² − P²). Vorzeichen: über dem Minimum übererregt, darunter untererregt.

### Warum werden U₃ und U₅ gemessen? Welche Schalterstellung?
- Die Spannung zeigt direkt, was das Pulsmuster macht (Beweis der Elimination: U₃, U₅ ≈ 0), der Strom zeigt das Ergebnis nach der Drossel.
- Messen in Stellung «WR»; I_n in Stellung «Netz».

### Warum braucht «3.–5. eliminiert» bei gleichem Winkel ein höheres Udc?
- Für die Leistung zählt nur U_WR1. Die Kerben entfernen Spannungs-Zeit-Fläche und damit auch Grundschwingung (≈ 80–90 % des Rechtecks) → mehr Udc nötig. Bei PWM ist der Effekt noch stärker. Im Bericht U₁/Udc pro Muster vergleichen.

### Was bedeutet «bestes Muster»?
- Das Muster mit den kleinsten Stromoberschwingungen beim gleichen Lastpunkt: kleinstes THD_I, kleinste I₃, I₅, I₇ relativ zu I₁, Strom am sinusförmigsten. Meist «Sinus fein», entscheidend sind aber die eigenen Messwerte.

### Was ist mit 6.3 gemeint?
- Spannung über einem Schalter: 0 (leitet) ↔ Udc (sperrt), bei PWM zerhackt, mit Überschwingern → er muss die volle Udc sperren.
- Strom: i_N während des Leitintervalls; je nach Stromrichtung leitet der IGBT oder die Diode. Nicht direkt messbar, Ersatz: DC-Strom am + Kabel. Screenshots + Skizze.

### Warum ist die feine Auflösung die beste?
- Hohe Schaltfrequenz → Oberschwingungen um f_s; die Drossel dämpft mit n (I_n = U_n/(n·X)) → nahezu sinusförmiger Strom. u_WR bleibt pulsförmig. Nachteil: Schaltverluste ∝ f_s, EMV.
- Die Begründung wurde in `Checkliste_Messungen_WR_einphasig.md` bei 6.2.2 eingefügt, mit dem Hinweis, dass die gemessenen I₃/I₅ eher für «3.–5. eliminiert» sprechen (mögliche Übermodulation bei Sinus fein). **Entscheid noch offen.**

### Repo und Kontextfile
- Zugriff auf `SynologyDrive\Studium\Semester 5\LEAS` und `GitRepos\LEAS` erteilt.
- Die SynologyDrive-Version der Checkliste ist neuer (Drehzahlwerte 6.4) als die im Repo.
- `KONTEXT_Bericht.md` erstellt: Versuch, Aufbau, Theorie, Messdaten mit Theorievergleich, Bilder, offene Punkte.
