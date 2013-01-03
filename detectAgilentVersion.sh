#!/bin/bash

if [ $# -lt 1 ]; then
	echo $0 OneOfTheRawFile
	exit 1
fi

grep -o 'Agilent-[0-9]*' $1