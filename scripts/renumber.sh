#!/bin/env/bash

function renumber()
{
	local OPTIND ARG

	while getopts "h" ARG; do
		case "$ARG" in
			h) echo -en "Usage:\nrenumber [-h] <directory>\n"
			   return 1;;
			*) echo "Invalid option, use with -h.">&2 && return 1;;
		esac
	done

	shift $((OPTIND - 1))

	if [ $# -ne 1 ]
	then echo -en "Incorrect number of parameters, $# of 1.\nUse with -h for help.\n">&2 && return 1
	fi

	local WHERE="$1"

	# img_1.jpg -> img_01.jpg
	# car_03.png -> car_003.png
	# etc
	for FILE in "$WHERE"/*;
	do
		EXT="${FILE##*.}";
		NEW_NAME="${FILE%.*}";
		NEW_NAME=$(echo "$NAME" | sed -E 's/(.*)_([0-9])$/\1_0\2/');
		mv "$FILE" "$NEW_NAME.$EXT";
	done
	return 0
}
