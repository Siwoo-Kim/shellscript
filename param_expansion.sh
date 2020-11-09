#!/bin/bash
# ${var} => parameter expansion
# 변수만 적용 가능.
# ${#} 변수의 길이
(( ! $# == 2 )) && {
  echo Need 2 args
  exit 1
}

len1=${#1}
len2=${#2}

if (( len1 > len2 )); then
  echo $1 is longer
elif (( len2 > len )); then
  echo $2 is longer
else
  echo "$1 and $2 has same length"
fi 
exit 0