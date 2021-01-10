#!/bin/bash
# . = /github/workspace if actions/checkout
set -eux

ls
pwd

latexmk


# echo "Hello $1"
# time=$(date)
# echo "::set-output name=time::$time"