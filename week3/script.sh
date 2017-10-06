#!/bin/bash

cnt=`grep processor /proc/cpuinfo | wc -l`

if [ $cnt -le $1 ]; then

  echo "Not enough CPUS, exiting"

fi
