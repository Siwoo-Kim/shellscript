#!/bin/bash
# 산술 관련 표현식 => if [[ num1 -op num2 ]] => op=ne,eq,gt,lt 
#   =>  이거 말고 (( )) 표현식 사
# 파일 관련 표현식 => if [[ num1 -op num2 ]] => -f, -e, -d
(( $# != 2 )) && {
  echo Need 2 args.
  exit 1
}

dir1="$1"
dir2="$2"

[[ ! -d "$dir1" || ! -d "$dir2" ]] && {
  echo "no exists dir"
  exit 1
} 

cnt1=$(ls -A1 "$dir1"| wc -l)
cnt2=$(ls -A1 "$dir2"| wc -l)

if (( $cnt1 > $cnt2 )); then
    echo "$dir1 has more files"
elif (( $cnt2 > $cnt1 )); then
    echo "$dir2 has more files"
else
    echo "Both $dir1 & $dir2 has same number of files"
fi

exit 0
