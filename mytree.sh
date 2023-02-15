#!/bin/bash

function mytree()
{
local t=$2
for i in "$1"/*
do
	printf "%*s" $((t*4))
	if [ -f "$i"  ]
	then	
		echo -e "$t2" `basename "$i"`
	elif [ -d "$i" ]
	then
		echo -e "$t2" `basename "$i"`
		mytree "$i" $((t+1))
	fi
done
}

mytree "$PWD" 0
