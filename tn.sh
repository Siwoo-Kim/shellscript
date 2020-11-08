#!/bin/bash

#스크립트 호출하기.
# 1. 스크립트가 Path 에 없는 경우 => ./script.sh 혹은 /some/path/to/script.sh
# 2. 스크립트가 Path 에 있는 경우 => 일반 명령어처럼 실행. script.sh
#   adding binary path => PATH=$PATH:[your bin dir path]

#Shebang
#   파일의 첫줄에 명시.
#   #! 로 시작.
#   이후에 사용할 interpreter 을 지정. (bash, zsh.. )

#Script Argument
#   Positional arg => $1, $2, $2
#   All arg =>  $@, $*
#   number of arg =>  $#

#Script name conflict
#   type 을 이용해 스크립트 이름 충돌을 피할 수 있음.

#IO
#   read => 유저로부터 데이터를 읽어 변수에 저장.
#       -r => 백스페이스 escape 을 방지


ask() {
  read -rp "Your note: " note
  [[ ! $note ]] && { echo "No note. terminate"; exit 1; } 
  echo "$note"
}

type tn >/dev/null 2>&1 && { echo "script already exists"; exit 1; }

workdir=.
now=$(date)
note=$(ask)
notefile="$workdir"/notes.txt

echo "$now": "$note" >>"$notefile"
echo Note saved: "$note"
