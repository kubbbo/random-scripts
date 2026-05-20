#!/bin/bash

function play() {
	PYTON=~/__Ulohy/semester3/ib111/

	MINES="s3/game_minesweeper_alt.py"
	TETRIS="s2/game_tetris.py"
	CONNECT4="s2/game_connect_four.py"
	MANCALA="s1/game_mancala.py"

	if [ $# -ne 1 ]
	then echo "Incorrect number of parameters $# of 1.">&2 && return 1
	fi

	case "$1" in
		minesweeper)
			python3 "${PYTON}${MINES}"
			;;
		tetris)
			python3 "${PYTON}${TETRIS}"
			;;
		connect4)
			python3 "${PYTON}${CONNECT4}"
			;;
		mancala)
			python3 "${PYTON}${MANCALA}"
			;;
		help)
			echo "Available games:"
			echo "- minesweeper"
			echo "- tetris"
			echo "- connect4"
			echo "- mancala"
			;;
		*)
			echo "No such game available."
			echo "Run <play help> for a list of available games." >&2
			return 1
			;;
	esac
	return 0
}
