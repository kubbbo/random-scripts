#!/bin/env/bash

function pyton() {
	if [ $# -ne 1 ]
	then echo "Incorrect number of parameters, $# of 1.">&2 && exit 1
	fi

	local PYTON=~/__Ulohy/semester3/ib111/
	local P="$1"
	if [ -d "${PYTON}${P}" ]; then
		echo "${PYTON}${P}" && cd ${PYTON}${P}
	else
		echo "Dir <${PYTON}${P}> does not exist"
		return 1
	fi
	return 0
}
