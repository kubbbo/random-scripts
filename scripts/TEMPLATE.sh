#!/bin/env/bash

function RENAME()
{
	local OPTIND ARG

	while getopts "h" ARG; do
		case "$ARG" in
			h) echo -en "Usage:\n [-h] \n"
			   echo "    -h - show help"
			   return 0;;
			*) echo "Invalid option, use with -h.">&2 && return 1;;
		esac
	done

	shift $((OPTIND - 1))

	if [ $# -ne _ ]
	then echo -en "Incorrect number of parameters, $# of 4.\nUse with -h for help.\n">&2 && return 1
	fi
	
	# user code here
}
