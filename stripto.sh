#!/bin/bash

pattern="$1"

[[ ! $pattern ]] && {
  echo "Missing arg" >&2
  exit 1
}

ok=
while read -r; do
  if [[ "$REPLY" =~ $pattern ]]; then
    ok=true
  fi
  [[ ! $ok ]] && continue
  echo "$REPLY"
done

exit 0
