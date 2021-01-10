#!/usr/bin/env perl
# example .latexmkrc 

# platex pdf-sync
$latex = 'platex -synctex=1 -halt-on-error';

# platex less-error-message
$latex_silent = 'platex -synctex=1 -halt-on-error -interaction=batchmode';

# pbibtex
$bibtex = 'pbibtex';

# div -> pdf output main.pdf 
$dvipdf = 'dvipdfmx %O -o main.pdf %S';

# index
$makeindex = 'mendex %O -o %D %S';

$max_repeat = 4;

# dvi -> pdf
$pdf_mode = 3;

# preview update
$pdf_update_method = 4;