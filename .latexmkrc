#!/usr/bin/env perl
# https://qiita.com/Rumisbern/items/d9de41823aa46d5f05a8

# platex pdf-sync
$latex = 'platex -synctex=1 -halt-on-error';

# platex less-error-message
$latex_silent = 'platex -synctex=1 -halt-on-error -interaction=batchmode';

# pbibtex
$bibtex = 'pbibtex';

# div -> pdf  %O:option -o:output_name_argument %D:output_name %S:input_name
$dvipdf = 'dvipdfmx %O -o %D %S';

# index
$makeindex = 'mendex %O -o %D %S';

$max_repeat = 4;

# dvi -> pdf
$pdf_mode = 3;

# preview update
$pdf_update_method = 4;