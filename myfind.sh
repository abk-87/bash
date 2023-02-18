#!/bin/bash

function myfind()
{
	local dir="$1"
	for i in "$dir"/*
	do
		
		if [[ "$i" == "$dir"/$2 ]]
		then	
			echo "$i"
		fi

		if [[ -d "$i" ]]
		then
			myfind "$i" "$2"
		fi
	done
}

if [[ -d "$1" && "$2" == -name ]]
then
	myfind "$1" "$3"
elif [[ "$1" == -name ]]
then
	myfind . "$2"
fi
