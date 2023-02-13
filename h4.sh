#$/bin/bash

# File rename
if [ "$#" -eq 2 -a -f "$1" ]
then
	if [ -f "$2" ]
	then
		rm "$2"
	fi
	ln "$1" "$2"
	rm "$1"
# Moving files to the directory
elif [ "$#" -ge 2 -a -d "${!#}" ]
then
	for i in "$@"
	do
		if [ -f "$i" ]
		then
			ln "$i" "${!#}"
			rm "$i"
		fi
	done
fi
