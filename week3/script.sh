#!/bin/bash

cnt=`grep processor /proc/cpuinfo | wc -l`

if [ $cnt -le 2 ]; then

  echo "Not enough CPUS, exiting"

fi
