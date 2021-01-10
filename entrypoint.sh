#!/bin/bash
# . = /github/workspace if actions/checkout
set -eux

echo $INPUT_LATEX_FILE_NAME

ls
pwd

latexmk main.tex

ls 
pwd