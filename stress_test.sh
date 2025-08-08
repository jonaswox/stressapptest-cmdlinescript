#!/bin/bash

#Do stupid welcum msg

echo "WelcuM 2 QOL SAT TOOL trademarked by Welhelm Göztas and FOF <Friends of Furries> TM piratesoftware"
echo "ALERT!!!prepare 2 cum!!!ALERT"
echo "Starting script....."
echo "Loading malware binaries"
echo "you are HACKED, CONFIRMAD"

# Check if the required app is installed

if ! command -v stressapptest &> /dev/null; then
    echo "ERROR stressapptest not found. Please install it first."
    exit 1
fi

#Further stupidity

echo "SAT installed confIRmAD, proceeding..."
echo "Initiate Ecto Extraction procedure..."

#Define possible inputs and defaults turning off stressmode - to add or remove possible args, just change the list

inputArgs=(seconds megabytes copyThreads stressThreads)
stressMode=0

#check that there are no more than the maximum of 5 inputs !!!NEEDS UPDATE no statics allowed

if [ "$#" -gt 5 ]; then
	echo "No more than 5 arguments. Expected syntax is ./stress_test.sh <seconds> <megabytes> <copy threads> <stress threads> <toggle: -W , apply stressfull copymode>"
	exit 1
fi

#Assign the parsed inputs to their respective variables respecting the order of inputArgs list

argIndex=0

for arg in "$@"; do
	if [ "$arg" == "-W" ]; then
 		stressMode=1 #stressMode ON
		continue #If we meet -W, set stressMode ON and move to the next parameter
	fi

	#Assign current arg 
 	varName="${inputArgs[$argIndex]}"
	declare "$varName=$arg"

	#For Loop variable iterate
	((argIndex++))

	#Break for loop Condition
	if [ "$argIndex" -gt "${#inputArgs[@]}" ]; then
		break
	fi
done

echo "Ecto extraction procedure completed."
echo "Ecto extraction results:"

#DEBUG output signals
echo "seconds: $seconds"
echo "megabytes: $megabytes"
echo "copythreads: $copyThreads"
echo "stressthreads: $stressThreads"
echo "stressmode: $stressMode"

#Create the desired commandline
cmd=(stressapptest)

[ -n "$seconds" ] 	&& cmd+=(-s "$seconds")
[ -n "$megabytes" ]	&& cmd+=(-M "$megabytes")
[ -n "$copyThreads" ] 	&& cmd+=(-m "$copyThreads")
[ -n "$stressThreads" ] && cmd+=(-C "$stressThreads")
[ "$stressMode" -eq 1 ] && cmd+=(-W)

#Debug cmd output

echo "Running: ${cmd[*]}"

# Run the actual command

