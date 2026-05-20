#!/bin/env/bash

function sem()
{
	local OPTIND ARG

	while getopts "h" ARG; do
		case "$ARG" in
			h) echo -en "Usage:\nsem [-h] [number]\n"
			   echo -en "\tex.: sem 1 -> __Ulohy/semester01\n"
			   echo -en "\tex.: sem   -> __Ulohy\n"
			   return 1;;
			*) echo "Invalid option, use with -h.">&2 && return 1;;
		esac
	done

	shift $((OPTIND - 1))

	if [ $# -ne 1 ] && [ $# -ne 0 ]
	then echo -en "Incorrect number of parameters, $# of 0 or 1.\nUse with -h for help.\n">&2 && return 1
	fi
	
	local SEMDIR="/home/kubo/__Ulohy"

	if [ $# -ge 1 ];
	then	if [ -d "$SEMDIR""/semester0""$1" ];
		then cd "$SEMDIR""/semester0""$1";
		else echo "No such semester.">&2 && return 0;
		fi
	else cd "$SEMDIR";
	fi

	return 1
}
