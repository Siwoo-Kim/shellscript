#!/bin/bash
# here document
#
# <<END 
# [YOUR DOC] 
# END

usage() {
  #here document
  cat <<END
count [-r] [-b n] [-s n] stop

Print each number up to stop.
END
}

# function to handle errors.
# $1: error msg
# $2: exist code to exit
error() {
  echo "Error: $1"
  usage
  exit $2
} >&2 #sending this functions output to stderr

function isNum() {
  [[ $1 =~ ^[0-9]+$ ]]
}

reverse=""
begin=0
step=2

while getopts ":hb:s:r" opt; do
  case $opt in
    h) 
      usage
      exit 0
      ;;
    r) 
      reverse=true;;
    b) 
      isNum ${OPTARG} || error "${OPTARG} is not a number" 1
      begin=${OPTARG};;
    s)
      isNum ${OPTARG} || error "${OPTARG} is not a number" 1
      step=${OPTARG};;
    :)
      error "Option -${OPTARG} is missing an argument" 2
      ;;
    \?)
      error "Unknown option: -${OPTARG}" 3
      ;;
  esac
done

shift $((OPTIND-1))
echo $1