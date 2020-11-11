#!/bin/bash
# mytar [dir] [tarName] - create tar
# mytar [tar] - extract tar

# command group
# {cmd1; cmd2; cmd3} => 여러 명령어를 하나의 statement 그룹화. ; 혹은 

[[ ! $1 || ! -e $1 ]] && {
  echo "Bad input" >&2
  exit 1
} 

dir=
tar=
op=
if [[ -d $1 ]]; then
  tar="$2"
  [[ ! $tar ]] && {
    echo "Bad input" >&2
    exit 1
  }
  op="c"
  dir="$1"
else 
  op="x"
  tar="$1"
fi

zip=
case $tar in
  *.tgz|*.gz|*.gzip) 
    zip="z"
    echo "Using gzip" >&2;;
  *.bz|*.bz2|*.bzip|*.bzip2) 
    zip="j"
    echo "Using bzip2" >&2;;
  *.tar)
    zip=""
    echo "No compression used" >&2;;
  *)
    echo "Unknown extension: ${tar}" >&2
    exit 2;;
esac

command="tar -${op}${zip}f $tar"
[[ -d $dir ]] && {
  command="${command} $dir"
}

if ! $command; then
  echo "Error: tar existed with status $?" >&2
  exit 3
fi

echo "Ok" >&2
exit 0