#!/bin/bash

[[ "$1" ]] || {
  echo "Missing arg" >&2
  exit 1
}

while read -r; do
    printf "%s " $REPLY
done < "$1"