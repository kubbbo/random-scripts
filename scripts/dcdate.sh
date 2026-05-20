#!/bin/env/bash

function dcdate()
{
	local OPTIND ARG
	local MODE="R"

	while getopts "hfte" ARG; do
		case "$ARG" in
			h) echo -en "Usage:\ndcdate [-hcfte] dd mm yy hh:mm\n"
			   echo "    -h - show help"
			   echo "    -f - set F flag (implicit is R)"
			   echo "    -t - set T flag"
			   echo "    -e - output epoch time only"
			   return 1;;
			f) MODE="F";;
			t) MODE="T";;
			e) MODE="E";;
			*) echo "Invalid option.">&2 && return 1;;
		esac
	done

	shift $((OPTIND - 1))

	if [ $# -ne 4 ]
	then echo -en "Incorrect number of parameters, $# of 4.\nUse with -h for help.\n">&2 && return 1
	fi

	local DAY="$1"
	local MONTH="$2"
	local YEAR="$3"
	local TIME="$4"

	local DATE="${YEAR}-${MONTH}-${DAY}"
	local EPOCH=`date --date="${DATE} ${TIME}" +"%s"`
	local OUT="<t:${EPOCH}:${MODE}>"

	if [ "$MODE" = "E" ]
	then OUT="$EPOCH";
	fi

	echo "$OUT" && return 0;

	# options:
	# f/F - short/long date time (f is implicit)
	# d/D - short/long date
	# t/T - short/long time
	# R   - relative time
	
}
