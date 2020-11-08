#!/bin/bash

#변수
# temporary data in memory
# 변수값 읽기 => $var (현재 session 에서만 존재)
# "$var" vs $var  => space (구분자) 을 escape 하냐 ("$var") 안하냐 ($var) 차이.
# Predefined Variables => 대문자의 변수 ex) $USER, $HOME, $JAVA_HOME
# 변수값 대입 => var=WORD  
# bash 은 데이터 타입이 없다, 무조건 string

# space 와 quote
# => space 은 단어를 구분하는 역할
# => space 로 이루어진 단어들을 하나의 string 으로 구분하기 위해 "" (quote) 으로 묶어라.
# filenames=file1.txt file2.txt file3.txt => command not found file2.txt
# filenames="file1.txt file2.txt file3.txt" => ok

greeting="hello"
echo $greeting

filename="file.txt"

touch $filename &&
  ls $filename &&
  rm $filename

files="file1.txt file2.txt"
touch $files && #"" 을 붙이면 하나의 string 으로 해석.
  ls $files &&
  rm $files

usergreeting="$greeting, ${USER:=there}"
echo $usergreeting

#just for fun
a=(1 2 3 4 5)

function swap() {
  t=${a[$1]}
  a[$1]="${a[$2]}"
  a[$2]="$t"
}

function nextPermutation() {
    len=$((${#a[@]}-1))
    i=$len
    while ((i>0)) && ((a[i-1] >= a[i])); do
      ((i--))
    done
    [[ i -eq 0 ]] && return 1
    j=$len
    while ((i>0)) && ((a[i-1] >= a[j])); do
      ((j--))
    done
    swap $((i-1)) j a
    j=$len
    while [[ j -gt i ]]; do
        swap i j a
        ((i++))
        ((j--))
    done
    return 0
}


echo "${a[@]}"
while nextPermutation; do
  echo "${a[@]}"
done