#!/bin/bash

function ready() {
	local MYPY=1
	local OPTIND ARG

	while getopts "m" ARG; do
		case "$ARG" in
			m) MYPY=0;;
			*) echo "Use -m">&2 && return 1;;
		esac
	done

	shift $((OPTIND - 1))

	for program in "$@"
	do
		if [[ "$program" != *.py ]];
			then continue;
		fi
		echo "$program"
		~/.pyvenvs/edulint/bin/python -m edulint check "$program";
		if [ $MYPY -eq 1 ];
			then  mypy --strict "$program"
		fi
	done
	echo "#################"
	echo "testing completed"
	echo "#################"
	return 0
}
