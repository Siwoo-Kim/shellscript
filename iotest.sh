#!/bin/bash
# Stdout 
# echo
#   -n new line 을 끝에 추가하지 않음.
#   -e escape sequences 허용. (escape sequences ? \n\t\a 등등)
# printf [format] [args...]
#   -v var    (output 을 변수에 저장)
#   format 의 인자보다 함수의 인자가 많다면 loop 을 하는 기능.
#   printf "p%st\n" a e i o u => loop 을 할 필요가 없을

echo -n "suppress newline"
echo "no suppress newline"
echo -e "use escape sequences\n\a\thi"


printf "select %s from %s\n\twhere name=%s\n" \* mytable $USER
printf "p%st\n" a e i o u
printf "|%20s |%20s |%20s |\n" $(ls)

printf -v greet "hello %s" "$USER"
echo "$greet"
