#!/bin/bash

# . = /github/workspace if actions/checkout
set -eux

if [ ! -f .latexmkrc2 ]; then
    cp /.latexmkrc .latexmkrc2
fi

ls

# make pdf
latexmk $INPUT_LATEX_FILE_NAME