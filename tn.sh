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

#Quote  ""
# 항상 변수를 quotes 로 감싸라
#   => space 가 있을 경우 split 을 방지.
#   => '' 은 $ 도 escape 하므로 사용하지 말 것.
#   => ~ 은 escape 되므로 ${HOME} 을 사용.

#Braces {}
# 배쉬에게 문자열 어디서 변수가 끝나는 지를 알려줌.
# echo "${foo}bar"
  
#Debugging
# line debugging =>  set -x, set +x
# global debugging => #!/bin/bash -x

ask() {
  read -rp "Your note: " note
  if [[ ! $note ]]; then
    exit 1
  fi
  echo "$note"
}

type tn >/dev/null 2>&1 && {
  echo "script already exists"
  exit 1
}

declare -r workdir=.
declare -r now=$(date)

topic="$@"
topic="${topic:=default}" #parameter expansion - assign default value

note=$(ask) || {
  echo "No note. terminate" >&2
  exit 1
}
notefile="${workdir}/${topic:-default}-notes.txt" #parameter expansion - evaluate default value

echo "${now}: ${note}" >> "$notefile"
echo "Note '${note}' saved to ${notefile}"
