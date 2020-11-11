#!/bin/bash
#class for loop = for var in words; do [cmd]; done 변수 혹인 String 에 quote 하지 말 것.

classLoop() {
  s="$1"
  for var in $s; do #quote 하지 말 것
    echo $var
  done
}

classLoop "a b c d"

changeExtension() {
  path="$1"
  from="$2"
  to="$3"
  for var in "$path"/*."$from"; do #bash pattern - all files ending with .$from
    base=$(basename "$var" "$from")
    echo "${base}${to}"
  done
}

mkdir tmp && touch tmp/{a..h}.txt

changeExtension tmp txt zip

rm -r tmp

cLoop() {
  #  for ((i="a"; i<"z"; i++)); do #안됨. 숫자 연산만 가능한듯
  #    echo $i
  #  done
  for ((i = 1; i < 10; i++)); do #안됨. 숫자 연산만 가능한듯
    echo $i
  done
}
cLoop

drawline() {
  len="$1"
  [[ ! $len || ! $len =~ [0-9]+$ ]] && {  # s =~ regexp
    exit 1
  }
  char="="
  [[ $2 ]] && {
    char="$2"
  }
  s=""
  for ((i = 0; i < len; i++)); do
    s="${s}${char}"
  done
  echo $s
}

s=$(drawline 10)

[[ $s ]] && { 
  echo $s
}

exit 0
