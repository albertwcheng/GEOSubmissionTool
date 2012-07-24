#!/bin/bash

if [ $# -lt 3 ]; then
	echo $0 inputMatrix GPLNum outputMatrix
	exit 1
fi

inputMatrix=$1
GPLNum=$2
outputMatrix=$3

codeDir=`absdirname.py $0`

tpfile=`tempfile`

if [ ! -e $codeDir/$GPLNum.mapToFeatureNum ]; then
	echo "$codeDir/$GPLNum.mapToFeatureNum file not exist, make one using one of the raw file and cut only the first three columns"
	exit 1
else
	echo "using $codeDir/$GPLNum.mapToFeatureNum"
	joinu.py -1 .Row,.Col -2 .Row,.Col $codeDir/$GPLNum.mapToFeatureNum $inputMatrix > $tpfile
	#cuta.py -f".ID,.Status>>1-_1" $tpfile > $outputMatrix
	cp $tpfile $outputMatrix
fi
