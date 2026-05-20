#!/bin/env/bash

function rmcar()
{
	local OPTIND ARG

	while getopts "h" ARG; do
		case "$ARG" in
			h) echo -en "Usage:\nrmcar [-h] <file> <start> <end>\n"
			   echo "    -h - show help"
			   return 0;;
			*) echo "Invalid option, use with -h.">&2 && return 1;;
		esac
	done

	shift $((OPTIND - 1))

	if [ $# -ne 4 ]
	then echo -en "Incorrect number of parameters, $# of 3.\nUse with -h for help.\n">&2 && return 1
	fi
	
	local FILE=$1
	local START=$2
	local END=$3

	sed -i "$FILE" "s/^${START}.*${END}$/d" && return 0
}
