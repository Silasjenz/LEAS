# Kontext: Versuchsanleitung LEAS – Wechselrichter einphasig

Zusammenfassung der Versuchsanleitung (`Versuchsanleitung LEAS WR einphasig.pdf`, 4 Seiten, Autor: Adrian Omlin, HSLU T&A, Stand 08.11.2024).
Dieses File gibt wieder, **was die Anleitung verlangt**. Messdaten, Aufbau-Details und Auswertung stehen in `../CLAUDE.md` und `../Checkliste_Messungen_WR_einphasig.md`.

---

## 1. Worum geht es

Selbstgeführte Wechselrichter (WR) am Netz kommen vor in rückspeisefähigen Frequenzumrichtern (netzseitiger Teil), Blindleistungskompensatoren und PV-Wechselrichtern. Die Anleitung vergleicht drei Varianten des netzseitigen Teils eines FU:

| Variante | Energiefluss | cos φ | Oberschwingungen |
|---|---|---|---|
| Diodenbrücke | nur Netz → Last, **kein Rückspeisen** | – | – |
| Umkehrgleichrichter (Thyristor) | beide Richtungen | hängt vom Steuerwinkel ab, im Normalbetrieb **deutlich < 1** | durch die Schaltung weitgehend gegeben |
| Selbstgeführter WR (dieser Versuch) | beide Richtungen | frei einstellbar, z. B. **cos φ = 1** | durch **höhere Taktfrequenz** und/oder **geschickte Pulsmuster** deutlich reduzierbar |

**Zweck des Versuchs:** Funktionsprinzip sowie typische Strom- und Spannungsverläufe des einphasigen WR praktisch untersuchen; zeigen, wie sich Wirk- und Blindleistung einstellen lassen und wie sich die Harmonischen beeinflussen lassen.

---

## 2. Versuchsaufbau (laut Anleitung)

- WR → **Entkopplungsinduktivität** → **Transformator** → Netz (AC-Seite).
- DC-Seite des WR an der **Ankerwicklung einer Gleichstrommaschine (GM)**.
- GM wird von einer **Asynchronmaschine (ASM)** am Netz mit nahezu konstanter Drehzahl angetrieben.
- **Udc** (bei FUs: Zwischenkreisspannung) wird über den **Erregerstrom der GM** eingestellt. Bei festem Pulsmuster ändert sich damit die Amplitude der WR-Ausgangsspannung.
- **Winkel ϑ** zwischen WR-Ausgangsspannung und Netzspannung wird über **Tasten am Bedienfeld** eingestellt. Damit ändert sich die Spannung über der Entkopplungsinduktivität und damit der bezogene bzw. eingespeiste Strom.
- Der Aufbau ist **fertig verkabelt** und **bleibt nach dem Versuch verkabelt**.
- Der Spannungseingang des **Power-Analyzers PM 3000** lässt sich per Umschalter auf **Netz** oder **WR-Ausgangsspannung** schalten. Für die Leistungsbetrachtung wird **«Netz»** empfohlen.

### Verfügbare Geräte / Materialliste
| Gerät | Daten |
|---|---|
| Laborturm | – |
| Einphasiger WR mit Ansteuerung | mit dem Netz synchronisierbar |
| Entkopplungsinduktivität | 70 mH, 30 A |
| Einphasentransformator | 400 V / 230 V, 25 A |
| Gleichstrommaschine | 6 kW, 500 V |
| Asynchronmaschine | 5.5 kW, 3 × 400 V |
| Kabelsatz | vollständige Verkabelung |
| Voltech Power-Analyzer PM 3000 | + Spannungswahlschalter |
| Multimeter Metra Hit 18S | – |
| Vierkanal-Oszilloskop | – |
| *Nicht aufgeführt, aber nötig* | Stromzangen, Spannungs-Mess-Trennverstärker |

---

## 3. Lernziele

Die Studierenden …
1. überprüfen das theoretisch behandelte Verhalten des selbstgeführten einphasigen Stromrichters,
2. wissen, wie sich die **Wirkleistung** einstellen lässt,
3. wissen, wie sich die **Blindleistung** einstellen lässt,
4. wissen, wie sich verschiedene **Pulsmuster** auf die Oberschwingungen auswirken,
5. können Spannungs- und Stromverläufe bei selbstgeführten Stromrichtern sicher interpretieren.

---

## 4. Aufgaben

### 5. Vorbereitung (vor dem Labor)
- Kapitel *Wechselrichter* im **ET+A-Skript** und die relevanten Aufgaben der beiden Wechselrichterübungen repetieren.
- **Stromverlauf skizzieren** bei Grundfrequenztaktung, unter der Annahme, dass die Grundschwingung der WR-Ausgangsspannung mit der Netzspannung übereinstimmt.
- Beantworten: **Wie lassen sich Wirk- und Blindleistung beeinflussen?** Hinweis der Anleitung: Zeigerdiagramme der Synchronmaschine ansehen.

### 6.1 Grundfrequenztaktung
**6.1.1 Stromform**
- Aufbau in Betrieb nehmen, den vorbereiteten Stromverlauf überprüfen.
- Erwartete **Harmonische in der WR-Ausgangsspannung und im Netzstrom** nennen, inkl. Grösse.

**6.1.2 Einstellen von Wirk- und Blindleistung**
- **ϑ variieren** → grafisch darstellen: **P(ϑ), Q(ϑ), P₁(ϑ), Q₁(ϑ)** (Index 1 = Grundschwingung).
- **Udc variieren** → grafisch darstellen: **P(Udc), Q(Udc), P₁(Udc), Q₁(Udc)**.
- Einfluss von ϑ und Udc auf die **Harmonischen** beschreiben.
- Tipp: Spannungswahlschalter auf **«Netz»**, damit der PM 3000 die netzseitigen Leistungen anzeigt.

### 6.2 Weitere Pulsmuster
**6.2.1 Stromform**
- Wie verändert sich die Stromform bei den verschiedenen Pulsmustern? Welche Oberschwingungen treten auf, wie gross sind sie?
- Vergleich am besten bei **einem festen Lastpunkt, z. B. P = 1.5 kW und Q₁ = 0**.
- Bei knapper Zeit beschränken auf: **Trägerverfahren fein und grob** sowie **ein Muster mit eliminierten Harmonischen**, z. B. «3. und 5. eliminiert».

**6.2.2 Einstellen von Wirk- und Blindleistung**
- Funktioniert das Einstellen von P und Q noch wie bei Grundfrequenztaktung?
- **P(ϑ), Q(ϑ), P(Udc), Q(Udc)** grafisch darstellen für das **Pulsmuster mit den tiefsten Harmonischen**.
- Auf welchen Wert lassen sich **cos φ** und der **Leistungsfaktor λ** bei **P = 1.5 kW** optimieren?

### 6.3 Spannungsbelastung der Halbleiter
- Zeitlicher Verlauf der **Spannung über einem Halbleiter**?
- Zeitlicher Verlauf des **Stroms durch einen Halbleiter**?
- Kurvenverläufe **skizzieren**.

### 6.4 Diverse Messungen
- In welchem Bereich ändert sich die **Drehzahl der ASM**? (Optischer Drehzahlmesser ist ausleihbar.)

---

## 5. Hinweise für den Bericht

- **Aufgabenraster:** Die Abschnitte 5, 6.1.1, 6.1.2, 6.2.1, 6.2.2, 6.3, 6.4 entsprechen dem Berichtsaufbau.
- **Index 1** bedeutet Grundschwingung. P₁/Q₁ sind von P/Q (Gesamtgrösse inkl. Oberschwingungen) zu unterscheiden.
- **Sollwerte der Anleitung für den Lastpunkt:** P = 1.5 kW, Q₁ = 0. Wird ein anderer Lastpunkt verwendet (siehe `../CLAUDE.md`: 1.15 kW), muss das begründet werden.
- **Fragen, die explizit beantwortet werden müssen:**
  - Wie beeinflusst man P und Q? (5 und 6.1.2)
  - Welche Harmonischen erwartet man in u_WR und i_N, und wie gross sind sie? (6.1.1)
  - Einfluss von ϑ und Udc auf die Harmonischen (6.1.2)
  - Wie ändern sich Stromform und Oberschwingungen je Pulsmuster? (6.2.1)
  - Funktioniert die P/Q-Einstellung bei den anderen Pulsmustern gleich? (6.2.2)
  - Optimaler cos φ und λ bei P = 1.5 kW (6.2.2)
  - Verläufe von Halbleiterspannung und -strom (6.3)
  - Drehzahlbereich der ASM (6.4)
- **Schwachstelle der Anleitung:** In Kap. 3 steht «Aufgabe xxx» als Platzhalter. Gemeint ist die Leistungsbetrachtung in 6.1.2.
