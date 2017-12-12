#!/bin/bash

# Output for first line of Results
echo -e "C0 \t N \t idle" > results.dat

# For loop for each amount of users
for i in {1..100}
do
	# Run the loadtest script for each set of users
	./loadtest $i&
	# Sleep 
	sleep 5
	# Retreive C for based on the loadtest for i users
	C=`cat synthetic.dat | wc -l`
	# Retreive the Idle Percent for the loadtest
	Idle=`mpstat -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'`
	# Kill the loadtest
	pkill loadtest
	# Output results 
	echo -e "$C \t $i \t $Idle" >> results.dat
done


