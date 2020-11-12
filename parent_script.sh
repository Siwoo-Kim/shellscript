#!/bin/bash

declare -xr x=1
echo parent before: $x
./child_script.sh
echo parent after: $x
