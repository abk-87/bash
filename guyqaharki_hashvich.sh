#!/bin/bash

y=$(date +"%Y")

function print1()
{
	echo "Մուտքագրեք տրանսպորտային միջոցի արտադրության տարեթիվը"
	read a
	if [[ ! "$a" =~ ^[1-9][0-9]*$ && "$a" -le "$y" ]] 
	then
		echo "Դուք մուտքագրել եք գոյություն չունեցող տարեթիվ"
		print1
	fi
	return
}

function print2()
{
	echo "Մուտքագրեք տրանսպորտային միջոցի շարժիչի հզորությունը (ձիաուժը)"
	read b
	if [[ ! "$b" =~ ^[1-9][0-9]*$ ]]
	then
		echo "Դուք մուտքագրել եք սխալ ձիաուժ"
		print2
	fi
	return
}

function print3()
{
	echo "Ձեր տրանսպորտային միջոցի գույքահարկը կազմում է $1 ՀՀ դրամ"
	return
}
	
echo "Մուտքագրեք.
1 - եթե Ձեր տրանսպորտային միջոցը մինչև 10 նստատեղ ունեցող մարդատար ավտոմեքենա է
2 - եթե 10 և ավել նստատեղ ունեցող մարդատար ավտոմեքենա է
3 - եթե բեռնատար (բեռնաուղևորատար) ավտոմեքենա է
4 - եթե մոտոցիկլետ է
5 - եթե ջրային փոխադրամիջոց, ձյունագնաց կամ քվադրոցիկլ է"
read n
case "$n" in
	1)
	print1
	print2 
	if [ "$a" -gt $((y-3)) -a "$b" -ge 1 -a "$b" -le 120 ]
		then print3 $((b*200))
	elif [ "$a" -gt $((y-3)) -a "$b" -ge 121 -a "$b" -le 150 ]
		then print3 $((b*300))
	elif [ "$a" -gt $((y-3)) -a "$b" -ge 121 -a "$b" -le 250 ]
		then print3 $(((b*300)+((b-150)*1000)))
	elif [ "$a" -gt $((y-3)) -a "$b" -ge 251 ]
		then print3 $(((b*500)+((b-150)*1000)))
	elif [ "$a" -le $((y-3)) -a "$a" -gt $((y-7)) -a "$b" -ge 1 -a "$b" -le 120 ]
		then print3 $(((b*200)-((b*20)*((y-a)-2))))
	elif [ "$a" -le $((y-3)) -a "$a" -gt $((y-7)) -a "$b" -ge 121 -a "$b" -le 150 ]
		then print3 $(((b*300)-((b*30)*((y-a)-2))))
	elif [ "$a" -le $((y-3)) -a "$a" -gt $((y-7)) -a "$b" -ge 121 -a "$b" -le 250 ]
		then print3 $((((b*300)+((b-150)*1000))-(((b*30)+((b-150)*100))*((y-a)-2))))
	elif [ "$a" -le $((y-3)) -a "$a" -gt $((y-7)) -a "$b" -ge 251 ]
		then print3 $((((b*500)+((b-150)*1000))-(((b*50)+((b-150)*100))*((y-a)-2))))
	elif [ "$a" -le $((y-7)) -a "$b" -ge 1 -a "$b" -le 120 ]
		then print3 $(((b*200)/2))
	elif [ "$a" -le $((y-7)) -a "$b" -ge 121 -a "$b" -le 150 ]
		then print3 $(((b*300)/2))
	elif [ "$a" -le $((y-7)) -a "$b" -ge 121 -a "$b" -le 250 ]
		then print3 $((((b*300)+((b-150)*1000))/2))
	elif [ "$a" -le $((y-7)) -a "$b" -ge 251 ]
		then print3 $((((b*500)+((b-150)*1000))/2))
	fi ;;
	2)
	print1 
	print2
	if [ "$a" -gt $((y-3)) -a "$b" -ge 1 -a "$b" -le 200 ]
		then print3 $((b*100))
	elif [ "$a" -gt $((y-3)) -a "$b" -ge 201 ]
		then print3 $((b*200))
	elif [ "$a" -le $((y-3)) -a "$a" -gt $((y-7)) -a "$b" -ge 1 -a "$b" -le 200 ]
		then print3 $(((b*100)-((b*10)*((y-a)-2))))
	elif [ "$a" -le $((y-3)) -a "$a" -gt $((y-7)) -a "$b" -ge 201 ]
		then print3 $(((b*200)-((b*20)*((y-a)-2))))
	elif [ "$a" -le $((y-7)) -a "$b" -ge 1 -a "$b" -le 200 ]
		then print3 $(((b*100)/2))
	elif [ "$a" -le $((y-7)) -a "$b" -ge 201 ]
		then print3 $(((b*200)/2))
	fi ;;
	3)
	print1
	print2
	if [ "$a" -gt $((y-3)) -a "$b" -ge 1 -a "$b" -le 200 ]
		then print3 $((b*100))
	elif [ "$a" -gt $((y-3)) -a "$b" -ge 201 ]
		then print3 $((b*200))
	elif [ "$a" -le $((y-3)) -a "$a" -gt $((y-7)) -a "$b" -ge 1 -a "$b" -le 200 ]
		then print3 $(((b*100)-((b*10)*((y-a)-2))))
	elif [ "$a" -le $((y-3)) -a "$a" -gt $((y-7)) -a "$b" -ge 201 ]
		then print3 $(((b*200)-((b*20)*((y-a)-2))))
	elif [ "$a" -le $((y-7)) -a "$a" -gt $((y-20)) -a "$b" -ge 1 -a "$b" -le 200 ]
		then print3 $(((b*100)/2))
	elif [ "$a" -le $((y-7)) -a "$a" -gt $((y-20)) -a "$b" -ge 201 ]
		then print3 $(((b*200)/2))
	else
		print3 "0"
	fi ;;
	4)
	print2
	print3 $((b*40)) ;;
	5)
	print2
	print3 $((b*150)) ;;
esac
