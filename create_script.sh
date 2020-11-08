#!/bin/bash

# if 문에서 문자열 비교.
# if [[ s == "string" ]  => 문자 그대로 비교
# if [[ s == string ] => bash pattern 비교

# 함수 => 함수의 exit 은 그 함수의 호출만 스택에서 제거.

# 함수 return 값으로 stdout 으로 이용하니까 매우 불편함..
# 아니면 global 변수를 이용해야 되는데.. 좀 그렇다 :( (side effect..)
# 뭐가 best practice 인지.........
check() {
  if [[ ! $1 ]]; then
    echo Missing arg
    return 1
  fi

  if type "$1" > /dev/null 2>&1; then #redirect stderr to /dev/null
    echo "There is already a command with name ${1}"
    return 1
  fi
  return 0
}

get_scriptname() {
  scriptname="$1"
  [[ ! "$scriptname" == *.* ]] && {
    scriptname="$1.sh"
  }
  echo "$scriptname"
}

create_script() {
  local bindir="./bin"
  local script="$1"
  local filename="${bindir}/${script}"

  [[ -e $filename ]] && {
    echo "File ${filename} already exists"
    return 1
  }

  if [[ ! -d ${bindir} ]]; then
    mkdir ${bindir} || {
      echo "Couldn't create ${bindir}."
      return 1
    }
    echo "Create ${bindir} to save the script ${script}"
  fi
  file="$filename"
}

check "$@" || exit 1
scriptname=$(get_scriptname "$1")

export file=
create_script "$scriptname" || {
  exit 1
}

echo "#!/bin/bash" > "$file"
chmod u+x "$file"

editor=$EDITOR
${editor:=vim}
$editor $file #bug
exit 0