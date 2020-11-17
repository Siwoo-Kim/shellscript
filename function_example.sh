#!/bin/bash

# bash function 
#   1. a set of commands that can be reused.
#   2. execute it like any command (redirection & passing arguments)
#   3. positional parameters are available
#
# variables.
#   global var vs local var
# 
# return code
#   exit vs return
#   함수의 결과 상태를 표현하는 코드, 0 = ok, other = fail
#   exit 혹은 return 생략시 마지막 command 의 상태 코드가 반환
#
# return value.
#   1. use a global variable
#   2. use stdout (echo, printf)
#
# export function
#   export -f function  (export = sending sth from parent to child)
#
# functions and redirection.
#   함수 정의와 동시에 redirection 을 할 수 있다.
#   function redirection 이라 하자. fun () { .. } >&2 //함수의 결과는 항상 stderr 로 전송.
#   function redirection 은 함수가 실행될때마다 호출된다.
#   
# A command in a pipeline runs in a subshell
#   파이프라인에 호출된 커맨드는 서브쉘에서 실행된다. => 글로벌 변수을 공유하지 않는다.
#   ls | while read -r; do ((count++)); done    => count 변수는 업데이트 되지 않는다! (서브쉘의 로컬 count 만 업데이트)
#   이럴 경우 mktemp 로 임시 파일을 생성 후 ls 의 결과를 임시 파일에 저장한 후
#   while read -r; do ((count++)); done < tmp 식으로 사용
#   ex)
#   tmp=$(mktemp)
#   ls > "$tmp"
#   while read -r; do ((cnt++)); done < "$tmp"
#
# Here Document
# <<TAG
# [YOUR DOC]
# TAG

function isNum() {
  [[ $1 =~ ^[0-9]+$ ]]
}

function op() {
  [[ ! $1 && ! $2 && ! $3 ]] && {
    return 1
  }
  if ! isNum $2; then
    return 1
  fi
  if ! isNum $3; then
    return 1
  fi
  case $1 in
    \+) echo $(($2 + $3));;
    \-) echo $(($2 - $3));;
    \*) echo $(($2 * $3));;
    \/) echo $(($2 / $3));;
    \%) echo $(($2 % $3));;
    *) return 1;;
  esac
}

echo $(op % 17 7)

function sum() {
    echo $(( $1 + $2 ))
}

echo $(sum $(op + 3 4) 2)


function starts_with_a() {
  starts_with "$1" "aA"
}

function starts_with() {
  [[ $1 == [$2]* ]]
}

if starts_with_a bx; then
  echo true
fi