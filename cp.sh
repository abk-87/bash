#!/bin/bash

if [ "$#" -eq 2 -a -f "$1" -a ! -d "$2" ]
then
	cat "$1" > "$2"	
elif [ "$#" -ge 2 -a -d "${!#}" ]
then
	for i in "$@"
	do
		if [ -f "$i" ]
		then
			cat "$i" > "${!#}/$i"
		fi
	done
fi
