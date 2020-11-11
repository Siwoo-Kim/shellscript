#!/bin/bash
# read x  => x 에 유저 input 저장
#   -r  => escape sequence 가 raw 로 저장. \a -> \a
#   -s  => suppress output (유저 입력이 stdout 으로 출력 방지)
#   -n [num] => 지정한 숫자의 문자만을 입력 허용.
# read x y =>  space 을 구분자 (IFS delimiter)로 입력값을 분배. read x y & 1 2 3 => x = "1", y = "2 3"
read -rp "read save in to '\$REPLY': " 
echo $REPLY 

read -rp "read save splitted into x & y " x y
echo $x
echo $y

echo "Are you sure? (Y/N)?"

answer=
while [[ ! $answer ]]; do
    read -r -n 1
    if [[ $REPLY == [Yy] ]]; then
      answer="yes"
    elif [[ $REPLY == [Nn] ]]; then
      answer="no"
    fi
done

printf "\n%s\n" $answer
exit 0