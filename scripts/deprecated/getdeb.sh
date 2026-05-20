#!/bin/bash

# function getdeb()
# cd "/home/luptacik-jakub/Downloads/"
# UPDATE=`find . -maxdepth 1 -name "discord-*.deb"`
# if [ -z "$UPDATE" ]; then echo "neni update file">&2 && exit 1; fi;
# echo "$UPDATE"
# sudo apt install "$UPDATE" && echo "success :D"
# rm "$UPDATE"
# exit 0
function getdeb() {
	# local WD=`pwd`

	if [ $# -ne 1 ];
	then echo "Incorrect number of parameters, $# of 1">&2 && return 1;
	fi

	local PREFIX=$1
	local UPDATE=`find /home/jakubL/Downloads -maxdepth 1 -name "${PREFIX}*.deb"`

	# Likely not needed but whatevs, I'll forget otherwise
	# cd "/home/luptacik-jakub/Downloads/" && cd "$WD"

	if [ -z "$UPDATE" ]; 
	then echo "neni update file">&2 && return 1;
	fi;

	echo "$UPDATE"
	sudo pacman -U "$UPDATE" || return 1
	rm "$UPDATE" && echo -e "\n.deb gone"

	echo "success :D"
	# cd "$WD"

	return 0
}
