#!/bin/bash

function compile() {
	if [ $# -lt 2 ]
	then echo -en "Incorrect number of parameters, $# of at least 2.\nUsage: compile [binary name] [source1] [source2] ...\n">&2 && return 1
	fi

	gcc -std=c99 -o $@ -pedantic -Wall -Wextra && return 0
	echo "gcc posrar">&2 && return 1
}
