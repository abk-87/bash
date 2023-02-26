#$/bin/bash

function file_mv()
{	
	if [ -f "$2" ]
	then
		rm "$2"
	fi
	if [ -d "$2" ]
	then
		ln "$1" "$2" 2>/dev/null || cat "$1" > "$2/$(basename "$1")"
	else
		ln "$1" "$2" 2>/dev/null || cat "$1" > "$2"
	fi
	if [ -f "$1" ]
	then
		rm "$1"
	fi	
}

function dir_mv()
{
	local dirname=$(basename "$1")
        mkdir "$2/$dirname"
        for i in "$1"/*
        do
                if [ -f "$i" ]
                then
                        local filename=$(basename "$i")
			file_mv "$i" "$2/$dirname/$filename"
                elif [ -d "$i" ]
                then
                        dir_mv "$i" "$2/$dirname"
                fi
        done
}

function dir_mv2()
{
	local dirname=$(basename "$1")
        mkdir "$2"
        for i in "$1"/*
        do
                if [ -f "$i" ]
                then
                        local filename=$(basename "$i")
			file_mv "$i" "$2/$filename"
                elif [ -d "$i" ]
                then
			dir_mv2 "$i" "$2/$(basename "$i")"
                fi
        done
}

function mv_to_dir()
{
	for i in "$@"
	do
		if [ -f "$i" ]
		then
			file_mv "$i" "${!#}"
		elif [ -d "$i" -a "$i" != "${!#}" ]
		then
			dir_mv "$i" "${!#}"
			rm -r "$i"
		fi
	done
}


if [ "$#" -eq 2 -a -f "$1" ]
then
	file_mv "$1" "$2"
elif [ "$#" -eq 2 -a -d "$1" ]
then
	if [ -d "$2" ]
	then
		dir_mv "$1" "$2"
		rm -r "$1"
	else
		dir_mv2 "$1" "$2"
		rm -r "$1"
	fi
elif [ "$#" -gt 2 -a -d "${!#}" ]
then
	mv_to_dir "$@"
fi
