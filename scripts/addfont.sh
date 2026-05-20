#!/bin/env/bash

function addfont()
{
	local OPTIND ARG

	while getopts "h" ARG; do
		case "$ARG" in
			h) echo -en "Usage:\naddfont [-h] <font name>\n"
			   return 1;;
			*) echo "Invalid option, use with -h.">&2 && return 1;;
		esac
	done

	shift $((OPTIND - 1))

	if [ $# -ne 1 ]
	then echo -en "Incorrect number of parameters, $# of 1.\nUse with -h for help.\n">&2 && return 1
	fi

	local NAME="$1"

	unzip ~/Downloads/${NAME} -d ~/Downloads/temp;
	sudo mv ~/Downloads/temp/*.{ttf,otf} /usr/local/share/fonts/;
	rm -rf ~/Downloads/temp && please fc-cache -fv\
	&& ls /usr/local/share/fonts/${NAME}*;

	return 0
}
