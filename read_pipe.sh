#!/bin/bash
# 파이프의 특징.
#   파이프로 연결된 명령어는 subshell 에서 수행된다.

declare -i count=0

countLines() {  #subshell 에서 실행되므로 count 변수는 local
  while read -r; do
      ((count++))
  done
}

$* | countLines #countLines 은 subshell 에서 수행.
echo $count