#!/bin/env/bash

function mkvnames()
{
	# for f in f*;
	# do ext="${f##*.}";
	# name="${f%.*}";
	# n=$(echo "$name" | sed -E 's/\./ /g;
	# s/(.*S03E[0-9]+) (.*) (1080p.*) $/\1: \2/');
	# mv "$f" "$n.$ext";
	# done

	local OPTIND ARG

	while getopts "h" ARG; do
		case "$ARG" in
			h) echo -en "Usage:\nmkvnames [-h] <file prefix> <sed left> <sed right>\n"
			   return 1;;
			*) echo "Invalid option, use with -h.">&2 && return 1;;
		esac
	done

	shift $((OPTIND - 1))

	if [ $# -ne 3 ]; then echo "Incorrect number of parameters, $# of 3. Use with -h.">&2 && return 1; fi

	local PREFIX=$1
	local SEDLEFT=$2
	local SEDRIGHT=$3

	for FILE in ${PREFIX}*; do
		EXT="${FILE##*.}";
		NAME="${FILE%.*}";
		DOTS=$(echo "$NAME" | sed -e 's/\./ /g');
		NEW=$(echo "$DOTS" | sed -e "s/${SEDLEFT}/${SEDRIGHT}/");
		if [ -n "$DOTS" ];
		then mv "$FILE" "$NEW.$EXT";
		else mv "$FILE" "$DOTS.$EXT";
		fi
	done

	return 0
}
