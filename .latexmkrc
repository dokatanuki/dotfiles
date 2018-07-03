#!/usr/bin/env perl
$latex            = 'platex -synctex=1 -halt-on-error';
$latex_silent     = 'platex -synctex=1 -halt-on-error -interaction=batchmode';
# 参考文献
$bibtex           = 'pbibtex';
$biber            = 'biber --bblencoding=utf8 -u -U --output_safechars';
# dvi->pdf
$dvipdf           = 'dvipdfmx %O -o %D %S';
# 索引
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
# 日本語をコンパイルするには必須
$pdf_mode	  = 3; # generates pdf via dvi

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
# Skim用の設定，pdfを上書き形式にする
$pvc_view_file_via_temporary = 0;

# a previewer
if ($^O eq 'darwin') {
  #$pdf_previewer = 'open -a Preview';
    $pdf_previewer = 'open -ga /Applications/Skim.app';
} elsif ($^O eq 'linux') {
    $pdf_previewer = 'evince';
}
