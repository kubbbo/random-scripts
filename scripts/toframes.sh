#!/bin/env/bash

function toframes()
{
	local OPTIND ARG

	while getopts "h" ARG; do
		case "$ARG" in
			h) echo -en "Usage:\ntoframes [-h] <source video> <directory> <image prefix>\n"
			   return 1;;
			*) echo "Invalid option, use with -h.">&2 && return 1;;
		esac
	done

	shift $((OPTIND - 1))

	if [ $# -ne 3 ]
	then echo -en "Incorrect number of parameters, $# of 3.\nUse with -h for help.\n">&2 && return 1
	fi

	local SRC=$1
	local DEST=$2
	local NAME=$3

	if ! [ -d "$DEST" ]
	then mkdir "$DEST"
	fi
	ffmpeg -i "$SRC" "$DEST/${NAME}_%04d.png" || exit 1

	exit 0
}
