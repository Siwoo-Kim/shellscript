#!/bin/bash -x
#Special variables for Script parameters
# $1, $2, $3... = nth arg
# $@, $*  = all args
# $#  = number of args
# $0  = name of script.

# shift = remove first argument
# getopts

echo $0 # name of the script
echo $# # number of args

for arg in "$@"; do #quote for every individual elements
  echo $arg
done

for arg in "$*"; do
  echo $arg
done

#shift 2 #shift two
echo "$@"

(( $# < 2 )) && {
  echo need 2 args
  exit 1
}


function gcd() {
  if (( $2 == 0 )); then
    echo $1    
  else
    gcd $2 $(( $1 % $2 ))  
  fi
}

gcd $1 $2

echo $(gcd $1 $2) #result goes to stdout
