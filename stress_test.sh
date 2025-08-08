#!/bin/bash

echo "WelcuM 2 QOL SAT TOOL trademarked by Welhelm Göztas and FOF <Friends of Furries> TM piratesoftware"
echo "ALERT!!!prepare 2 cum!!!ALERT"
echo "Starting script....."
echo "Loading malware binaries"
echo "you are HACKED, CONFIRMAD"

# Check if the required app is installed
if ! command -v stressapptest &> /dev/null; then
    echo "ERROR stressapptest not found. Please install it first (e.g., sudo apt install stressapptest)."
    exit 1
fi

echo "SAT installed confIRmAD, proceeding..."
echo "Initiate Ecto Extration procedure..."

#Define possible inputs and defaults turning off stressmode

inputArgs=(seconds megabytes copyThreads stressThreads)
stressMode=0

#check that there are no more than the maximum of 5 inputs
if [ "$#" -gt 5 ]; then
	echo "No more than 5 arguments. Expected syntax is ./stress_test.sh <seconds> <megabytes> <copy threads> <stress threads> <toggle: -W , apply stressfull copymode>"
	exit 1
fi
#Check whether user wants stressmode and assign accordingly

for arg in "$@"; do
	if [ "$arg" == "-W" ];then
		stressMode=1
	fi
done

#Assign the parsed inputs to their respective variables respecting the order of inputArgs list

argIndex=0

for arg in "$@"; do
	if [ "$arg" == "-W" ]; then
		continue #If we meet -W jump past it
	fi

	varName="${inputArgs[$argIndex]}"
	declare "$varName=$arg"

	((argIndex++))

	if [ "$argIndex" -gt "${#inputArgs[@]}" ]; then
		break
	fi
done

echo "Ecto extraction procedure completed."
echo "Ecto extraction results:"

# check om assignments er lykkedes
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

echo "Running: ${cmd[*]}"



#gammel og død variant
: <<'endComment'
# Get duration, memory size, copythreads and stressthreads from user input or arguments

if [ "$#" -eq 0 ]; then
	echo "Kører Std test: 60sek , 10.000mb..."
	stressapptest -s 60 -M 10000
	exit 1

elif [ "$#" -eq 1 ]; then
	DURATION=$1
	echo "Kører test i $DURATION sekunder..."
	stressapptest -s "$DURATION"
	exit 1

elif [ "$#" -eq 2 ]; then
	DURATION=$1
	MEMORY_MB=$2
	echo "Kører test i $DURATION sekunder henover $MEMORY_MB megabytes..."
	stressapptest -s "$DURATION" -M "$MEMORY_MB"
	exit 1

elif [ "$#" -eq 3 ]; then
	DURATION=$1
	MEMORY_MB=$2
	COPY_THREADS=$3
	echo "Running test for $DURATION seconds on $MEMORY_MB megabytes utilizing $COPY_THREADS copy threads..."
	stressapptest -s "$DURATION" -M "$MEMORY_MB" -m "$COPY_THREADS"
	exit 1

elif [ "$#" -eq 4 ]; then
	DURATION=$1
	MEMORY_MB=$2
	COPY_THREADS=$3
	STRESS_THREADS=$4
	echo "Running test for $DURATION seconds on $MEMORY_MB megabytes utilizing $COPYT_THREADS copy threads and $STRESS_THREADS stress threads"
	stressapptest -s "$DURATION" -M "$MEMORY_MB" -m "$COPY_THREADS" -C "$STRESS_THREADS"
	exit 1

elif [ "$#" -gt 4 ]; then
	echo "This scripts only responds to parameters <DURATION> <MEMORY_MB> <COPY_THREADS> <STRESS__THREADS>"
	echo "1 parameter is interpreted as DURATION, 2 paramters as Duration of test and Memory Amount and so on ...."
	exit 1
fi

endComment


