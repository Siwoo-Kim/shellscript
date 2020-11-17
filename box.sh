#!/bin/bash

function drawline() {
  end="$1"
  line=""
  char="-"
  for ((i=0; i<end; i++)); do
    line="${line}${char}"
  done
  printf "%s\n" "$line"
}

[[ $1 ]] || {
  echo "Missing arg" >&2
  exit 1
}

len="${#1}"
drawline $((len + 4))
printf "| %s |\n" "$1"
drawline $((len + 4))

exit 0

