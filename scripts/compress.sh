#!/bin/env/bash

function print_separator()
{
	local COUNTER=200

	echo -en "\n"

	while [ $COUNTER -gt 0 ]
	do
		printf '#'
		COUNTER=$(( $COUNTER - 1 ))
	done

	echo -en "\n\n"
}

function compress()
{
	local COMP_LEVEL=100
	local OPTIND ARG

	while getopts "hc:" ARG
	do
		case "$ARG" in
			h) echo -en "Usage:\ncompress [-h] <destination directory> <file type>\n"
			   echo "    -h - show help"
			   echo "    -c <number 0-100> - change compression level (default 100)"
			   return 1;;
			c) echo "$OPTARG"
			   COMP_LEVEL="$OPTARG";;
			*) echo "Invalid option, use with -h.">&2 && return 1;;
		esac
	done

	shift $((OPTIND - 1))

	if [ $# -ne 2]
	then echo -en "Incorrect number of parameters, $# of 2.\nUse with -h for help.\n">&2 && return 1
	fi

	local DEST=$1
	local FILE_TYPE=$2

	if ! [ -d "$DEST" ]
	then mkdir "$DEST"
	fi

	# TODO: find out how to separate out target filename
	echo "$DEST $FILE_TYPE"
	for IMAGE in *.${FILE_TYPE}
	do
		echo -en "$IMAGE\n\n"
		ffmpeg -i "$IMAGE" -compression_level "$COMP_LEVEL" "${DEST}/${IMAGE}" || return 1
		print_separator
	done

	return 0
}
