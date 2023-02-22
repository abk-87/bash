#!/bin/bash

#function for copying files
function file_cp()
{
	cat "$1" > "$2"
}

#function for copying directories
function dir_cp()
{
	local dirname=$(basename "$1")
	mkdir "$2/$dirname"
	for i in "$1"/*
	do
		if [ -f "$i" ]
		then
			local filename=$(basename "$i")
			file_cp "$i" "$2/$dirname/$filename"
		elif [ -d "$i" ]
		then
			dir_cp "$i" "$2/$dirname"
		fi
	done
}

#function for copying files and directories to the directory
function cp_to_dir()
{
	for i in "$@"
	do
		if [ -f "$i" ]
		then
			file_cp "$i" "${!#}/$(basename "$i")"
		elif [ -d "$i" -a "$i" != "${!#}" ]
		then
			dir_cp "$i" "${!#}"
		fi
	done
}

if [ "$#" -eq 2 -a -f "$1" -a ! -d "$2" ]
then
	file_cp "$1" "$2"
elif [ "$#" -eq 2 -a -d "$1" -a -d "$2" ]
then
	dir_cp "$1" "$2"
elif [ "$#" -ge 2 -a -d "${!#}" ]
then
	cp_to_dir $@
fi
