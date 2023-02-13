#!/bin/bash

echo "Currently logged users:" 
users
echo ==================================================
echo "Your shell directory:" 
echo $SHELL
echo ==================================================
echo "Home directory:"
echo $HOME
echo ==================================================
echo "OS name & version:"
head -1 /etc/os-release
echo ==================================================
echo "Current working directory:"
echo $PWD
echo ==================================================
echo "Number of users logged in:"
users | wc -l
echo ==================================================
echo "Show all available shells in your system:" 
cat /etc/shells 
echo ==================================================
echo "Hard disk information:" 
lsblk /dev/sda
echo ==================================================
echo "CPU information:"
cat /proc/cpuinfo
echo ==================================================
echo "Memory information:"
cat /proc/meminfo
echo ==================================================
echo "File system information:"
lsblk -fs
echo ==================================================
echo "Currently running process:"
ps -A
