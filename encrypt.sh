#!/usr/bin/env bash

#Scripting for System Automation COMP9053 Assignment 1 - Task 4
#Name: Megan Kearney
#ID: R00
#Class: 

bold=$(tput bold) #variable to format text as bold
normal=$(tput sgr0) #variable to format text as normal
ENCRYPTION_KEY="1234" #set value for encryption password
export ENCRYPTION_KEY #export variable as global
help="\n${bold}OpenSSL Encryption Script\n\n ${bold}NAME\n\n - ${normal}./encrypt.sh - encrypts the contents of files using openssl.\n\n${bold}SYNOPSIS\n\n./encrypt ${normal}\e[4m[FILE]\e[0m\n${bold}e.g. - ${normal}./encrypt file1 file2 'file3 with spaces' file4\n\n${bold}DESCRIPTION\n - ${normal}To encrypt files, invoke the script, and add the names of the files you would like to encrypt as parameters, seperate the name of each file with a space.\n ${bold}- ${normal}Please enclose files with spaces between '', for example 'Hello World'\n"

#this is ${bold}bold"
#HELP MENU#If the value of $1 is equal to -h or --help, print the value of $usage
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	printf "$help" #print the help menu to the screen
	exit 1 #force exit script

elif ((${#}<1)) #else if the number of parameters given is less than one, print error and guide user toward help menu
	then #do the following
		echo "${0} :ERROR: No parameters provided. Please see -h or --help for usage." 1>&2 #redirect error message from channel1, to channel2
		exit 2 #force exit script
else #otherwise, for each file given as a parameter
	for file in "$@" #for each file passes as a parameter
		do #do the following
			openssl enc -e -aes256 -in "$file" -out "$file".enc -pass env:ENCRYPTION_KEY #encrypt each file stored in $file using aes256, output each encrypted file with its original name with .enc appended, use the environment variable ENCRYPTION_KEY as the encryption password.
		
		done #finish loop
fi #end if statement