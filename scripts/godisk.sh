#!/bin/env/bash

function godisk()
{
	local OPTIND ARG

	while getopts "h" ARG; do
		case "$ARG" in
			h) echo -en "Usage:\ngodisk [-h] [subdirectory]\n"
			   return 1;;
			*) echo "Invalid option, use with -h.">&2 && return 1;;
		esac
	done

	shift $((OPTIND - 1))

	if [ $# -ne 1 ]
	then echo "Incorrect number of parameters, $# of 1.">&2 && exit 1
	fi

	local DISK="/run/media/kubo/MyPassport/"
	local STARTDIR="$1"

	if ! mountpoint -q "${DISK}"; then
		echo "Disk is not mounted bruh."
		return 1
	fi
	if [ -d "${DISK}${STARTDIR}" ]; then
		echo "${DISK}${STARTDIR}" && cd "${DISK}${STARTDIR}" && ls
	else
		echo "Subdir <${STARTDIR}> does not exist"
		return 1
	fi
	return 0;
}
