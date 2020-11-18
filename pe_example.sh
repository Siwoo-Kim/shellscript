#!/bin/bash
# Parameter Expansion.
# => 파라미터 확장은 문자열을 조작
#  ${#var} = 문자열의 길이
#
# removing part of string (pattern = bash pattern) #%
#   ${var[#%]pattern}
#
# ${var#pattern}  => remove shortest match from begin of string
# ${var##pattern}  => remove longest match from begin of string
# ${var%pattern}  => remove shortest match from end of string
# ${var%%pattern}  => remove shortest match from end of string
#
# search and replace
#  ${var/pattern/string}  => substitute first match from string
#  ${var//pattern/string}  => substitute all matches from string
# search and replace (Anchor)
#  ${var/#pattern/string} => substitute matches beginning of the string
#  ${var/%pattern/string} => substitute matches ending of the string
#
# Default values
# 평가식
# ${var:-value} -> evaluate value if var is empty or unset
#   => var 에 값이 없다면 value 값을 평가.
# 대입 
# ${var:=value}
#   => var 에 값이 없다면 value 값을 var 에 저장.

getLength() {
  echo ${#1}
}

echo $(getLength hello)

string=/Users/reindert/demo.txt
echo ${string#*/} #앞에서 제거
echo ${string##*/}  #앞에서 가장 긴 부분 제거
echo ${string%.*} #뒤에서 제거
echo ${string%/*.txt} #뒤에서 가장 긴 부분 제거

echo ${string/txt/sh} #첫번째 매칭을 교체
echo ${string/%txt/sh}  #끝에서 매칭을 교체

echo ${string//.txt/} #모든 매칭을 교체
echo ${string/%.txt/} #끝에서 매칭을 교체

echo ${string/[id]/k}  #모든 매칭을 교체
echo ${string//[id]/k}  #모든 매칭을 교체


for i in *sh; do
  echo "mv ${i} ${i%sh}txt" # % 끝에서 매치하여 제거
done