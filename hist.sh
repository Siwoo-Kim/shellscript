#!/bin/bash

error() {
  echo "Error: $1"
  exit $2
} >&2 #sending function's stdout to stderr 

my_mktemp() {
  mktemp || mktemp -t hist    #state 저장 방법. good 
} 2> /dev/null  #seding function's err to /dev/null

draw_line() {
  len=$1
  line=""
  char="-"
  for ((i=0; i<len; i++)); do
    line="${line}${char}"
  done
  printf "%s" $line   
}
(( BASH_VERSINFO[0] < 4 )) && error "This script can only be run by bash 4 or higher" 1

declare -A file_sizes
declare -r tempfile=$(my_mktemp) || error "Cannot create tempfile" 2
declare -ir term_cols=$(tput cols)
declare -i max_name_len=0 max_size=0 total_size=0

read_filesizes() {
  while read -r size file; do
    file_sizes["$file"]="$size"
    (( total_size += size ))
    (( max_size < size )) && (( max_size=size ))
    #parameter expansion can be used in arithmetic exp
    echo ${#file}
    (( max_name_len < ${#file} )) && (( max_name_len = ${#file} ))
  done
}

#이렇게 하는 이유는 du -d 0 */ | read_filesizes 을 한다면 read_filesizes 은 파이프에서 실행되므로 (서브 쉘 시작)
#input 은 제대로 받지만 글로벌 변수를 업데이트 할 수 없게 된다 (오직 로컬 변수만 업데이트).
{ du -d 0 */ || du --max-depth 0 *; } 2>/dev/null > "$tempfile" #output 을 tmp 파일에 저장
read_filesizes < "$tempfile"  #tmp 파일을 생성하여 현재 쉘 세션의 변수들을 업데이트. 

declare -i length percentage
declare -i cols="term_cols - max_file_len - 30"

# ${!a[@]} => keys
for k in "${!file_sizes[@]}"; do
  (( length = cols * file_sizes[$k] / max_size ))
  (( percentage = 100 * file_sizes[$k] / total_size ))
  printf "%-${max_name_len}s | %3d%% | %s\n" "$k" "$percentage" $(draw_line $length)
done

printf "%d Directories\n" "${#file_sizes[@]}"
printf "Total size: %d blocks\n" "$total_size"

rm "$tempfile"