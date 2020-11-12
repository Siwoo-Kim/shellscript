#!/bin/bash
# 변수
#   declare 변수 선언 동시에 변수의 속성 설정.
#       -p 변수 속성 프린트
#       -i integer 변수 선언
#       -r 읽기 전용 변수.
# 
#   arithmetic expression. = 숫자 연산 표현식.
#       1. (( 표현식 )) = exp, $(( 표현식 )) command substitution
#       2. 표현식으로 변수 대입, command substitution 사용 가능
#       3. integer 변수로 설정한 변수는 언제나 arithmetic expression 이 적용.
#         => declare -i x
#         x="1 + 2" => x=3
#       4. (( )) 으로 boolean 평가 가능. 0 = false, 0 이 아닌 수 true
#         => (( 0 )) || echo false
#
#       (( x = $(ls | wc -l) * 10 ))
#
#   read-only variable  = 읽기 전용 변수.
#
#   exporting variable  = 다른 쉘 (to subshell only) 에 변수 전달.
#     => 변수의 스코프는 해당 스크립트 생명 주기와 같다.
#     => 자식 스크립트에서 부모 스크립트로 export 하는 방법은 없다. (temp file 을 사용)
#     
#   .bashrc 
#     => 여기에 정의된 변수들은 현재 session 에만 적용된다. 
#     => 해당 세션의 subprocess 에도 이 변수들을 사용하기 위해선 export 필요.
#
#   array = 배열, 연관배열.
#     x[0]="some" # 값 할당.
#     ${x[0]}    # 값 반환.
#     ${x[@}}, ${x[*]}   # 모든 값 반환.
#     array=(1 2 3 4 5 a b c) # 배열 초기화
#     ${#x[@]}    # 배열 길이
#     ${!x[@]}    # 모든 인덱스
#     
#     배열은 export 할 수 없음.
#     -a 은 일반 배열 (인덱스가 숫자) -A 연관 배열.

declare -i x=1  # integer 변수 선언
#declare -p x
echo $x

declare -i x="1+2"  #표현식을 평
#declare -p x
echo $x

declare -i x="2 * 2"
echo $x

echo $((x % 2))
(( x = $(ls | wc -l) * 10 ))
echo $x

x=$(( $(ls | wc -l) * 10))
echo $x

declare -a primes
for ((i=2; i<100; i++)); do
  primes[$i]=true
done

primes[0]=false
primes[1]=false
for ((i=2; i<100; i++)); do
  if [[ ${primes[i]} == true ]]; then
    for ((j=i+i; j<100; j=j+i)); do
      primes[$j]=false
    done
  fi
done

for ((i=0; i<100; i++)); do
  if [[ ${primes[i]} == true ]]; then
    echo "${i} is prime"
  else
    echo "${i} is not prime"
  fi
done


array=(this is an array)  #array init
declare -p array      #print array
echo "${array[2]}"    #retrieve element 
array[15]=something   
echo "${#array[@]}"   #number of elements
echo "${!array[@]}"   #all indices

