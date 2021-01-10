#!/bin/bash

# . = /github/workspace if actions/checkout
set -eux

ls /
pwd

if [ ! -f .latexmkrc2 ]; then
    cp /.latexmkrc .latexmkrc2
    echo "done"
fi

ls -la
pwd

# make pdf
latexmk $INPUT_LATEX_FILE_NAME