#!/bin/bash

echo "C0 /t N /t idle" >> sythetic.dat

for i in {1..50}
do
	$usage = mpstat 10 -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].usr'
	$idle = mpstat 10 -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'
	echo "$usage /t $i /t $idle" >> sythetic.dat
done
