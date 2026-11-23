# Kontext für den Laborbericht – LEAS Wechselrichter einphasig

Dieses File fasst alles zusammen, was zum Schreiben des Berichts nötig ist: Versuch, Aufbau, Vorgehen, Messdaten, Theorie-Vergleich und offene Punkte.
Rohdaten: `Checkliste_Messungen_WR_einphasig.md` · Bilder: `img/`

---

## 1. Versuch

- **Modul:** LEAS (HSLU, Semester 5), Versuchsanleitung «Wechselrichter einphasig»
- **Messtage:** 13.11.2026 und 20.11.2026
- **Ziel:** Funktionsprinzip des selbstgeführten einphasigen Wechselrichters am Netz untersuchen: Strom- und Spannungsverläufe, Einstellen von Wirk- und Blindleistung, Einfluss des Pulsmusters auf die Oberschwingungen, Spannungsbelastung der Halbleiter.

### Aufgaben laut Anleitung
| Nr. | Inhalt |
|---|---|
| 5 | Vorbereitung: Stromverlauf bei Grundfrequenztaktung skizzieren, Einfluss auf P/Q (Zeigerdiagramm wie Synchronmaschine) |
| 6.1.1 | Stromform bei Grundfrequenztaktung, erwartete Harmonische in u_WR und i_N |
| 6.1.2 | P(θ), Q(θ), P₁(θ), Q₁(θ) sowie P(Udc), Q(Udc), P₁(Udc), Q₁(Udc); Einfluss auf Harmonische |
| 6.2.1 | Stromform und Oberschwingungen der weiteren Pulsmuster bei festem Lastpunkt |
| 6.2.2 | P/Q-Einstellung beim Muster mit den tiefsten Harmonischen; optimaler cos φ und λ |
| 6.3 | Zeitverlauf Spannung über und Strom durch einen Halbleiter |
| 6.4 | Drehzahlbereich der Asynchronmaschine |

---

## 2. Aufbau

**Leistungskreis:**
```
3×400 V ─ ASM 5.5 kW ══Welle══ GM 6 kW / 500 V ─(A1/A2)─ Udc ─ WR (IGBT-H-Brücke)
                                  └─ Erregung F1/F2 → stellt Udc ein
WR-Ausgang u_WR ─ Kopplungsinduktivität 70 mH ─ Trenntrafo 400/230 V ─ Netz
```

- **Wechselrichter:** «Synchronisierbarer Einphasenwechselrichter» (FHZ HTA Luzern, Diplomarbeit 2000). IGBT-Vollbrücke mit antiparallelen Dioden, geteilter Zwischenkreiskondensator (Mittelpunkt M.P.), antiparalleler Koppelschalter auf der AC-Seite.
- **Bedienfeld:** Winkel θ (Tasten ← →), Gleichspannung (Tasten ↑ ↓, wirkt auf GM-Erregung), Impulsmuster wählen, synchronisieren, koppeln/entkoppeln, Fehleranzeigen (Überstrom, IGBT, Steuerung).
- **Pulsmuster:** geschlossene Rechteckschwingung; 3.–5. / 3.–9. / 3.–21. Oberschwingung eliminiert; sinusbewertet fein; sinusbewertet grob.
- **Drossel:** L = 70 mH → X = ωL ≈ **22 Ω**
- **Messgeräte:** Voltech PM3000 mit Spannungswahlschalter (Stellung «Netz» = u_N, «WR» = u_WR; Strom immer i_N), Tektronix TPS2014 (4 Kanäle, isoliert), Metra Hit 18S (Udc), Stromzange, Trennverstärker, optischer Drehzahlmesser.
- Der Wechselrichter hängt auf der **230-V-Seite** (Messung: U₁ ≈ 233 V bei Udc ≈ 259 V).

**Messpunkte:**
| Grösse | Ort |
|---|---|
| u_N | Buchsen «Trenntransformator Sekundär» |
| u_WR | Buchsen direkt links der H-Brücke |
| i_N | Stromzange in der AC-Leitung |
| Udc | WR-Panel + / − |
| u_Halbleiter | + gegen obere u_WR-Buchse (oberer Schalter, linker Zweig) |

---

## 3. Theorie (für Auswertung und Diskussion)

- **Leistung (Zeigerdiagramm wie Synchronmaschine):**
  P = U_N · U_WR1 · sin θ / X  → hauptsächlich über **θ**
  Q ≈ U_N · (U_WR1 · cos θ − U_N) / X → hauptsächlich über **U_WR1, also Udc**
- **Rechteck:** U_WR1 = (4/π)·Udc/√2 ≈ 0.9·Udc; U_n = U₁/n (nur ungerade n)
- **Stromoberschwingungen:** I_n = U_n / (n·X) → fallen mit 1/n² ab
- **Bei U_WR1 = U_N und θ = 0:** I₁ ≈ 0, der Strom besteht nur aus Oberschwingungen (Integral von «Rechteck minus Sinus»).
- **P vs. P₁:** u_N ist fast sinusförmig, daher P ≈ P₁. **Q (PM3000) = √(S² − P²)** enthält die Verzerrungsblindleistung und wird nie 0; erst Q₁ geht durch 0.
- **Q₁ = 0 finden:** Bei festem P ist dort I₁ minimal (U₁·I₁ ≈ P). Der PM3000-Phasenwinkel der 1. Harmonischen ist immer 0° (Bezug auf die eigene Grundschwingung) und deshalb nicht verwendbar.
- **Pulsmuster:** Kerben bzw. PWM reduzieren U_WR1 pro Volt Udc (Rechteck 0.9, eliminiert ≈ 0.8–0.9 des Rechtecks, Sinus-PWM ≈ 0.6–0.7) → für denselben Lastpunkt braucht es ein höheres Udc. Sinus-PWM schiebt die Oberschwingungen zur Schaltfrequenz, wo die Drossel stark dämpft. Höhere Schaltfrequenz bedeutet mehr Schaltverluste und mehr EMV.
- **Halbleiter:** sperrt die volle Udc (plus Überschwinger); führt i_N während seines Leitintervalls, abhängig von der Stromrichtung im IGBT oder in der Diode.

---

## 4. Messdaten und Auswertung

### 6.1.1 Grundfrequenztaktung – Stromform
Einstellung: θ ≈ 0, Udc = **259 V**, I₁ = **0.827 A** (Minimum, das sich einstellen liess). Bild: `img/Scan_20261113_101112.jpg`

| n | 1 | 3 | 5 | 7 |
|---|---|---|---|---|
| U_n gemessen («WR») | 233.3 V | 33.42 % | 19.87 % | 14.32 % |
| U_n Theorie (1/n) | 0.9·259 = 233.1 V | 33.3 % | 20.0 % | 14.3 % |
| I_n gemessen («Netz», % von I₁) | 0.827 A | 145 % | 50.5 % | 28.4 % |
| I_n Theorie U_n/(n·X), % von 0.827 A | – | 1.18 A ≙ 142 % | 0.42 A ≙ 51 % | 0.22 A ≙ 26 % |

→ **Sehr gute Übereinstimmung mit der Theorie** für Spannung und Strom.

### 6.1.2 P und Q
**θ variiert** (Udc = 258.7 V):

| θ [°] | P [W] | Q [var] |
|---|---|---|
| −20 | −1057.5 | 480.7 |
| −10 | −660 | 384.9 |
| 0 | −210 | 329.5 |
| 10 | 240 | 321.9 |
| 20 | 678 | 360 |

- P verläuft ungefähr ∝ sin θ. Theorie: 230·233/22·sin 20° ≈ 830 W; gemessen sind es ±870 W um den Offset.
- P = 0 liegt bei θ ≈ +4–5° statt bei 0°. Das passt zur Notiz «4.1° und 263 V → minimaler Strom». Der Winkel-Offset kommt wahrscheinlich aus der Synchronisation, aus Verlusten oder aus dem Trafo.
- Q (gesamt) ändert sich wenig und hat sein Minimum um θ ≈ 0. Es enthält Verzerrungsblindleistung.
- Vorzeichen: P < 0 bei θ < 0 heisst Bezug vom Netz, P > 0 heisst Einspeisung (gemäss PM3000-Konvention, im Bericht festhalten).

**Udc variiert** (θ = 0°):

| Udc [V] | P [W] | Q [var] |
|---|---|---|
| 150 | −62.63 | 1134 |
| 175 | −87.68 | 911 (notiert als «911kvar», vermutlich var) |
| 200 | −116 | 670 |
| 225 | −150 | 476 |
| 250 | −192.6 | 340 |
| 275 | −234 | 350 |
| 300 | −266 | 530 |
| 325 | −298 | 720 |
| 350 | −320 | **fehlt** (notiert «258.7 V», Tippfehler) |

- Q hat ein **Minimum bei Udc ≈ 250–275 V**, also dort, wo U_WR1 ≈ U_N ist (Theorie: Udc = 230/0.9 ≈ 256 V). Unterhalb ist der WR untererregt, oberhalb übererregt. Das gemessene Q ist der Betrag inkl. Verzerrung, deshalb gibt es ein V-förmiges Minimum statt eines Nulldurchgangs. Q₁ würde das Vorzeichen wechseln.
- P ändert sich nur leicht. Weil θ = 0 nicht der P-Nullpunkt ist (Offset), steigt |P| mit Udc etwa proportional an.
- **P₁, Q₁ und I₃ wurden nicht notiert.** P₁ ≈ P (u_N sinusförmig). Q₁ lässt sich aus U₁, I₁ und P nur nachträglich bestimmen, wenn I₁ bekannt ist. Im Bericht so begründen.

### 6.2.1 Weitere Pulsmuster
Lastpunkt: **P ≈ 1.15 kW, Q₁ ≈ 0** (1.5 kW wurde nicht erreicht, siehe offene Punkte). Einstellungen:

| Muster | Udc [V] | θ [°] | Bemerkung |
|---|---|---|---|
| 3.–5. eliminiert | 282 | 29.8 | I₁ = 1.2 A notiert (prüfen, passt nicht zu 1.15 kW) |
| Sinus fein | 358 | 29.8 | |
| Sinus grob | 363 | 29.8 | |

| Muster | U₃ («WR») | U₅ («WR») | I₃ | I₅ |
|---|---|---|---|---|
| Sinus fein | 20 % | 10 % | 20 % | 30 % |
| Sinus grob | 30 % | 12 % | 22 % | 10 % |
| 3.–5. elim. | 0.5 % | 30 % | 9 % | 7 % |

Bilder: fein `img/Scan_20261120_095904.jpg`, grob `img/Scan_20261120_103938.jpg`, 3.–5. eliminiert `img/Scan_20261120_100652.jpg`, Grundfrequenz `img/20261120_093257.jpg`

- Das benötigte Udc steigt von 3.–5. eliminiert (282 V) zu Sinus-PWM (~360 V): Das ist die kleinere Grundschwingung pro Volt Udc (U₁/Udc ≈ 0.82 vs. ≈ 0.64 bei 230 V).
- 3.–5. eliminiert: U₃ ≈ 0 bestätigt die Elimination. U₅ = 30 % widerspricht der Erwartung (sollte ≈ 0 sein, evtl. Ablese- oder Notierfehler).
- Sinus-PWM: U₃ = 20–30 % ist für Sinus-PWM unerwartet hoch. Mögliche Ursache: **Übermodulation** (Udc an der Grenze), Ablesefehler oder Prozentbezug unklar.

### 6.2.2 Bestes Muster
- Gewählt: **Sinusbewertet, feine Auflösung** (theoretische Begründung in der Rohdaten-Datei: hohe Schaltfrequenz → Oberschwingungen bei hohen Ordnungen → starke Dämpfung durch die Drossel).
- **Widerspruch:** Nach den gemessenen I₃/I₅ wäre «3.–5. eliminiert» das beste Muster. Im Bericht diskutieren oder das Kriterium (THD_I) klären.
- P/Q-Tabelle für das beste Muster ist **leer**. Notiz: «Bei P = 1.15 kW gleiche Einstellungen wie bei Pulsmuster».
- cos φ und λ wurden nicht notiert. Bei Q₁ ≈ 0 ist cos φ₁ ≈ 1; λ < 1 wegen der Oberschwingungen.

### 6.3 Halbleiter
Bild: `img/Scan_20261120_102240.jpg`. Erwartung: Spannung 0 ↔ Udc (Rechteck bzw. zerhackt bei PWM, Überschwinger beim Schalten). Strom = i_N während des Leitintervalls, aufgeteilt auf IGBT und Diode je nach Stromrichtung.

### 6.4 Drehzahl ASM
| Zustand | n [min⁻¹] |
|---|---|
| Leerlauf | 1500 |
| 1 kW Last | 1488.8 |
| Nennlast | 1430 |

Notiz: «Bei −15° und 288 V» (Einstellung der Messung). Schlupf bei Nennlast ≈ 4.7 %. 1500 min⁻¹ im Leerlauf entspricht genau der Synchrondrehzahl (Ablesung gerundet oder ASM nahezu unbelastet).

---

## 5. Bilder

| Datei | Inhalt |
|---|---|
| `img/Scan_20261113_101112.jpg` | 6.1.1 Rechteck: u_N, u_WR, i_N |
| `img/Scan_20261120_095904.jpg` | 6.2.1 Sinus fein |
| `img/Scan_20261120_103938.jpg` | 6.2.1 Sinus grob |
| `img/20261120_093257.jpg` | 6.2.1 Grundfrequenztaktung (Referenz, Einstellung nicht notiert) |
| `img/Scan_20261120_102240.jpg` | 6.3 Halbleiter |
| `img/Scan_20261120_100652.jpg` | 6.2.1 3.–5. eliminiert (Zuordnung vermutet, da nur vier Muster gemessen wurden) |

---

## 6. Offene Punkte / Unstimmigkeiten

1. Udc-Reihe: Q bei 350 V fehlt (Tippfehler «258.7 V»), «911kvar» → 911 var.
2. P₁, Q₁ und I₃ in 6.1.2 nicht gemessen. Im Bericht P₁ ≈ P begründen, Q₁ qualitativ über das Q-Minimum diskutieren.
3. Lastpunkt 6.2 auf 1.15 kW statt 1.5 kW reduziert (Grund: Q₁ = 0 bzw. Udc-Grenze nicht erreichbar). Im Bericht begründen.
4. 3.–5. eliminiert: U₅ = 30 % und I₁ = 1.2 A plausibilisieren.
5. Sinus fein/grob: hohe U₃-Werte (Übermodulation?).
6. Bestes Muster: Wahl «fein» vs. Messwerte, die für «3.–5. eliminiert» sprechen.
7. 6.2.2 P/Q-Tabelle, cos φ und λ fehlen.
8. Bild `Scan_20261120_100652.jpg` zuordnen.
9. Vorzeichenkonvention von P/Q (Verbraucher- vs. Erzeugerpfeilsystem) im Bericht festlegen.
