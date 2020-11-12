#!/bin/bash

declare -ir answer="$RANDOM % 100 + 1"  #integer 변수에 산술 표현식 사용 가능.
declare -i your=-1 try=0

while (( answer != your )); do    # 산술 표현식 (())
  read -rp "Your: " your    # 숫자인지 검사할 필요가 없음. 만약 string 이라면 0 이 입
  ((try++))
  echo $your
  if (( ! your )); then # 0 will be false
    continue 
  elif (( answer == your)); then
    echo "Right!"
    break
  elif (( answer > your )); then
    echo "Greater"
  else
    echo "Lesser"
  fi
done

echo $try