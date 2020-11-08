#!/bin/bash -x

workdir="$1"
${workdir:=.}

echo $workdir
#u+x -> user can execute
#a+x -> make it executable for everyone
#a-x -> remove the permission
chmod u+x ${workdir}/*.sh
