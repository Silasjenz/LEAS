# LEAS Laborbericht – Wechselrichter einphasig

LaTeX-Projekt für den Laborbericht. Bearbeitet wird es in VS Code mit der Extension **LaTeX Workshop**.

## Installation (Windows)

1. **TeX Live installieren**
   - Installer von <https://tug.org/texlive/windows.html> herunterladen (`install-tl-windows.exe`) und ausführen.
   - Am einfachsten ist die Standardinstallation mit allen Paketen (dauert lange und braucht mehrere GB Speicher). Sie enthält `pdflatex`, `latexmk` und Perl, die für dieses Projekt nötig sind.
   - Nach der Installation VS Code und alle Terminals neu starten, damit der `PATH` aktualisiert wird.
   - Prüfen in einem Terminal: `latexmk -v` und `pdflatex -v` müssen eine Version anzeigen.
2. **VS Code installieren:** <https://code.visualstudio.com>
3. **Extension installieren:** In VS Code die Extension **LaTeX Workshop** (`James-Yu.latex-workshop`) installieren. VS Code schlägt sie beim Öffnen des Projekts auch selbst vor (`.vscode/extensions.json`).
4. **Projekt öffnen:** Den Projektordner in VS Code öffnen (Datei → Ordner öffnen) und `main.tex` öffnen.

## Bauen und PDF ansehen

| Aktion | Tastenkombination |
|---|---|
| Projekt bauen | `Strg+Alt+B` |
| PDF ansehen | `Strg+Alt+V` |
| Aus dem PDF zum Quelltext springen | `Strg` + Klick im PDF |

Gespeichert wird automatisch gebaut (`onSave`). Hilfsdateien liegen in `out/`, das fertige `main.pdf` wird nach dem Build in den Projektordner kopiert.

Ohne VS Code im Terminal: `latexmk main.tex` (Konfiguration in `.latexmkrc`).

## Projektstruktur

```
main.tex            Dokument, Titelblatt (Platzhalter ausfüllen)
preamble.tex        Pakete und Einstellungen
sections/           Kapitel 01 bis 07
img/                Oszillogramme
data/               Messwerte für Diagramme (CSV)
context/            Versuchsanleitung (Kontext)
```

## Offene Punkte im Bericht

Fehlende Werte und Unstimmigkeiten sind als `\todo`-Boxen im Text markiert und erscheinen auf einer Liste vorne im PDF. Vor der Abgabe in `preamble.tex` die Option `textsize=footnotesize` durch `disable` ersetzen, dann verschwinden die Boxen.

## Fehlersuche

- **`latexmk` nicht gefunden:** VS Code komplett schliessen und neu öffnen, notfalls den PC neu starten.
- **Fehlendes Paket (z. B. `pgfplots.sty not found`):** Bei einer Minimalinstallation im Terminal (als Administrator) `tlmgr install <paketname>` ausführen.
- **Build hängt oder alte Fehler bleiben:** In VS Code im LaTeX-Workshop-Menü «Clean up auxiliary files» wählen, oder im Terminal `latexmk -C`.
- **Das erste Kompilieren dauert lange:** Das ist normal, weil TeX Live zuerst Schriften-Caches aufbaut.

## Alternativen

- **MiKTeX** statt TeX Live: funktioniert ebenfalls, braucht aber zusätzlich Perl (z. B. Strawberry Perl), sonst läuft `latexmk` nicht.
- **Overleaf:** Projekt als ZIP hochladen, Hauptdokument `main.tex`. [UNVERIFIED -- die Datei `.latexmkrc` mit `$out_dir` kann dort Probleme machen; im Zweifel aus dem Upload weglassen.]
