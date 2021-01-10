#!/bin/bash
# . = /github/workspace if actions/checkout
set -eux

echo $latexFileName

ls
pwd

latexmk main.tex

ls 
pwd