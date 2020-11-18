#!/bin/bash

# ==, != 연산자는 [[ ]] 에서 패턴 (배쉬) 매칭을 수행
# => [[ var == pattern ]]
# => 패턴을 quote 한다면 exact 매칭을 수행
# => [[ var == "pattern" ]] => var 가 "pattern" 이라면 ok
# =~ 은 정규 표현식 매칭을 수행. (POSIX extended regexp)
# 배쉬와 정규 표현식 그룹 매칭
#   ${BASH_REMATCH[그룹 인덱스]}

filename="test.txt"
[[ $filename == *.txt ]] && {
  echo true
}

s="hello"
[[ $s == h*o ]] && {
  echo true
}

test="1234abcde1234"
[[ $test =~ ^[0-9]+[a-z]+[0-9]+$ ]] && {
  echo ${#test}
  echo ${test//[0-9]/DIGIT}
}

function getNumType() {
  regex='^[0-9]+$' #escape all
  octal_regex='^0([0-7]+)$'
  [[ $1 =~ $regex ]] && {
    type="digit"
    [[ $1 =~ $octal_regex ]] && {
      type="octal ${type}"
      echo "${BASH_REMATCH[1]}"   #group match from =~
    }
    echo "$type"
  }
}


echo $(getNumType 1234)
echo $(getNumType 0017)

