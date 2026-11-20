# latexmk-Konfiguration: pdfLaTeX, Hilfsdateien nach out/, fertiges PDF zurück ins Projektverzeichnis
use File::Copy;

$out_dir = 'out';
$pdf_mode = 1;        # 1=pdflatex, 4=lualatex, 5=xelatex
$pdflatex = 'pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -synctex=1 %O %S';

# Nach erfolgreichem Build: PDF aus $out_dir ins Quellverzeichnis kopieren (plattformunabhängig, ohne cp)
END {
    if (-d $out_dir) {
        foreach my $pdf (glob("$out_dir/*.pdf")) {
            (my $base = $pdf) =~ s|.*/||;
            copy($pdf, $base);
        }
    }
}
