#!/bin/bash
#getopts
#인자 처리 유틸리티.
# 옵션
#   1.인자가 없는 옵션. noop  eg) -x
#   2.인자가 있는 옵션. argop  eg) -x var
#
# getopts 으로 인자 parsing 하기.
# getopts [optstring] name
#
# optstring
#   허용할 옵션 noop 들의 리스트
#   eg) "ab"  == -a -b
#   인자가 있는 옵션 argop 허용하기.
#   eg) "a:b" == -a var -b
#
# name
#   이번 차례 옵션의 이름을 가지는 변수
#
# 특별 변수
#   ${OPTARG} = 옵션에 주어진 인자값
#   ${OPTIND} = 다음번 옵션의 인덱스 값
#   ? = 알려지지 않은, 잘못 옵션
#   
# 옵션이 아닌 인자들은 반드시 인자 제일 뒤에 있어야 함.
# -x 1 -y 2 arg1 arg2 arg2
# 하나의 옵션에 여러 인자값을 주기 위해선 "" quote 필요된.
#
# getopts 에러 핸들링
#   silent 모드 (optstring 에 : 로 시작), non-silent 모드
#
# End of options
# -- (명령어 인자 중 -- 이후의 인자는 option 으로 인지 안됨)
#   인자값이 -l.txt 라고 가정하자.
#   command shell 은 -l 을 보고 옵션이라 가정한다.
#   이럴때 -- 을 쉘에 제공하면 -l.txt 가 옵션이 아닌지를 판단하고 제대로 처리한다. 
#   * 특히 파일은 - 가 들어간 경우가 많으므로 -- 을 잘 사용하자.


declare r=
declare -i begin=0
declare -i step=1

function isNum() {
  local ok=1
  [[ $1 =~ ^[0-9]+$ ]] && {
    ok=0
  }
  return $ok
}

while getopts ":b:s:r" opt; do

  case $opt in
  b)
    isNum "${OPTARG}" || {
      echo "${OPTARG} is not a number" >&2
      exit 1
    }
    begin="${OPTARG}"
    ;;
  s)
    isNum "${OPTARG}" || {
      echo "${OPTARG} is not a number" >&2
      exit 1
    }
    step=${OPTARG};;
  r)
    reverse=true;;
  \?)
    echo Unknown arg "${OPTARG}"
    exit 1;;
  esac
done

shift $(( ${OPTIND} - 1 ))  #get last arg
end=$1

isNum $end || {
  echo "${OPTARG} is not a number" >&2
  exit 1
}

if [[ $reverse ]]; then
  for ((i=end; i>=begin; i-=step)); do
    echo $i
  done
else
  for ((i=begin; i<=end; i+=step)); do
    echo $i
  done
fi

exit 0
