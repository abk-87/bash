#!/bin/bash

total1=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
total2=$(cat /proc/meminfo | grep SwapTotal | awk '{print $2}')

free1=$(cat /proc/meminfo | grep MemFree | awk '{print $2}')
free2=$(cat /proc/meminfo | grep SwapFree | awk '{print $2}')

shared=$(cat /proc/meminfo | grep Shmem | head -1 | awk '{print $2}')

buff=$(cat /proc/meminfo | grep Buffers | awk '{print $2}')
cache=$(cat /proc/meminfo | grep Cached | head -1 | awk '{print $2}')
buff_cache=$(($buff+$cache))

used1=$(($total1-$free1-$buff_cache))
used2=$(($total2-$free2))

available=$(cat /proc/meminfo | grep MemAvailable | awk '{print $2}')

echo -e "\ttotal\t\tused\t\tfree\t\tshared\t\tbuff/cache\tavailable"
echo -e "Mem:\t$total1\t$used1\t\t$free1\t\t$shared\t\t$buff_cache\t\t$available"
echo -e "Swap:\t$total2\t\t$used2\t\t$free2"
