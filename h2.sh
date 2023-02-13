#!/bin/bash

while read a
do
	if [ -n "$a" ]
	then
		echo "$a" >> a_tmp_file.txt
	fi
done < "$1" 
cat a_tmp_file.txt > "$1"
rm a_tmp_file.txt
