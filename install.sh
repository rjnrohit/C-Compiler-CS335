#!/bin/bash -i

# Expand aliases defined in the shell ~/.bashrc
shopt -s expand_aliases
DIR=$(printf "%q\n" "$(pwd)")
alias arcx86="python3 ${DIR}/src/main.py"