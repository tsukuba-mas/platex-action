#!/bin/bash

# . = /github/workspace if actions/checkout
set -eux

# make pdf
latexmk $INPUT_LATEX_FILE_NAME