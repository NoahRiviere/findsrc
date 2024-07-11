#!/bin/env bash

usage()
{
    cat <<EOF 1>&2
Usage: $(basename $0) [SRC_PATH] [FORMAT] [VAR] [MAKEFILE]
VAR defaults to SRC
FORMAT defaults to *.c
MAKEFILE is Makefile and is in the current directory if not provided
This little script find all the files in [SRC_PATH] that fits the [FORMAT]
and put them in the [VAR] in [MAKEFILE]
EOF
}
if (( $# == 0 ))
then
    usage
	exit
fi
SRC_PATH="$1"
FORMAT="$2"
FORMAT="${FORMAT:=*.c}"
VAR="$3"
VAR="${VAR:=SRC}"
MAKEFILE="$4"

SRC="$(find "${SRC_PATH}" -type f -name ${FORMAT} | sed "s|^${SRC_PATH}/\(.*\)$|\1|")"
SRC="${SRC//$'\n'/ }"
sed -i -e "0,/^\(\s*${VAR}\s*=\s*\).*$/ s|^\(\s*${VAR}\s*=\s*\).*$|\1${SRC}|" "${MAKEFILE:=Makefile}"
