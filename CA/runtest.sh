#!/bin/bash

echo -e "C0 \t N \t idle" > results.dat

for i in {1..100}
do
	./loadtest $i&

	sleep 5

	C=`cat synthetic.dat | wc -l`

	Idle=`mpstat -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'`

	pkill loadtest

	echo -e "$C \t $i \t $Idle" >> results.dat
done


