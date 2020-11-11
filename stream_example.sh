#!/bin/bash

#Standard Streams.
# 1. StdIn (표준 입력)
#   /dev/stdin
# 2. Stdout (표준 출력)
#   /dev/stdout = 1
# 3. Stderr (에러 스트림)
#   /dev/stderr = 2
# 4. /dev/null
#   이곳으로 출력되는 모든 데이터는 discard

# Redirection 1
# get input and send output or errors somewhere else
# N>
# N>&N

#Same
shopping-notes.txt > grep milk 2> /dev/null
grep milk 2> /dev/null < shopping-notex.txt
  
#overwrite
ls > listing.txt
#appending
ls -al >> listing.txt

# Redirection Order
# cmd 의 어느 위치에 와도 상관없다. ex) cmd < infile > outfile, > outfile cmd < infile 
# 항상 왼쪽순으로 먼저 평가. 출력은 현재 가리키는 포인터를 가진다.
cat not-exists 2>&1 >somewhere.txt  #stderr 은 터미널(현재 표준 출력이 가리키는) 이후 stdout 혼자 somewhere.txt 으로 리다이렉션
cat not-exists >somewhere.txt 2>&1  #표준 출력을 somewhere.txt 으로 리다이렉션 이후 stderr 도 somewhere.txt (stdout 이 가리키는) 로 리다이렉션


