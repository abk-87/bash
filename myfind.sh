#!/bin/bash

function myfind()
{
	dir="$1"
	file="$2"
	if [ -e "$dir"/"$file" ]
	then
		echo "$dir"/"$file"
	fi
	
	for i in "$dir"/*
	do
		if [ -d "$i" ]
		then
			myfind "$i" "$file"
		fi
	done
}


if [ -d "$1" -a "$2" == -name ]
then
	myfind "$1" "$3"
elif [ "$1" = -name ]
then
	myfind . "$2"
fi
