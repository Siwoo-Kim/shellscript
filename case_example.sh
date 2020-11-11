#!/bin/bash
# bash case statement
# case s in pattern1) cmd;; pattern2) cmd;; esac
# 패턴 매칭 지원해서 강력.

case $1 in
  cat) echo "meow";;
  dog) echo "woof";;
  cow) echo "mooo";;
  *) echo "unknown animal";;
esac 
    