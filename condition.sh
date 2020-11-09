#!/bin/bash

# 조건절 - if then elif else fi
# 종류
#   1. if cmd; then [your code]; fi     => basic if
#   2. if [[ exp ]]; then [your code]; fi     => conditional expression if

# Conditional expression if [[ ]]
#   1. tests on file or dirs. [[ -f file ]], [[ -d dir ]], [[ -e fileOrDir ]]
#   2. tests on strings.      [[ $str ]], [[ $str == bash pattern ]]
#   3. tests on arithmetic exp   [[ num1 -eq num2 ]] (이거 쓰지말고 (()) 요거 쓰세요)

# And, Or, Not
# ! => negate !0  = 1 
# && => AND   0 && 1  = 0
# || => OR    0 || 1  = 1
# Special variable
# 1. $# -> args 갯수
# 2. $? -> 마지막 command status
# 3. ${#var} -> 변수 var  문자열 크기 (parameter expansion)

#세미콜론
#   한 줄에 여러 명령어 사용시 ; 로 구분자로 사용.
#   그렇지 않다면 new line 에 각 명령어를 명시.

#Return codes
#   프로그램에 의해 반환되는 exit 번.호
#   0 = success, others = fail
 
#my_mkdir() {
#  dir=./"$1"
#  if mkdir "$dir"; then #depends on mkdir's exit code. 0 is success
#    echo ok
#  else
#    echo fail
#  fi
#}
#
#my_mkdir a
#my_mkdir a

#a=b;c=d;e=f
#echo $a;echo $c;echo $e


#if (( 0 == 1 )); then
#  echo true
#else
#  echo false
#fi

date=$(date)
topic="$1"
topic=${topic:=default}
notefile="./${topic}-notes"

read -p "Your note: " note
exitcode=0

if [[ $note ]]
then
  echo "${date}: ${note}" >> "$notefile"
  echo "Your note '${note}' saved to '$notefile'"
else
  echo "No input. note wasn't saved"
  exitcode=1
fi

exit $exitcode