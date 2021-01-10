#!/bin/bash
# . = /github/workspace if actions/checkout
set -eux

ls
pwd

latexmk main.tex

ls 
pwd


# echo "Hello $1"
# time=$(date)
# echo "::set-output name=time::$time"