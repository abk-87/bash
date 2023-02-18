#!/bin/bash

function mytree()
{
local t1="|  "
local t2="$2"
for i in "$1"/*
do
	if [[ -f "$i" ]]
	then	
		files_count=$((files_count+1))
		if [[ -x "$i" ]]
		then
			echo -e "$2" "\033[32m$(basename "$i")\033[0m"
		else
			echo "$2" $(basename "$i")
		fi
	elif [[ -d "$i" ]]
	then
		directories_count=$((directories_count+1))
		echo -e "$2" "\033[34m$(basename "$i")\033[0m"
		mytree "$i" "$t1$t2"
	fi
done
}

directories_count=0
files_count=0
echo -e "\033[34m$(basename "$PWD")\033[0m"
mytree "$PWD" "|__"
echo -e "\n$directories_count directories, $files_count files" 
