#!/bin/bash

if [ $# -lt 1 ]; then
	echo $0 OneOfTheRawFile
	exit 1
fi

codeDir=`absdirname.py $0`

AgilentVersion=`bash $codeDir/detectAgilentVersion.sh $1`
echo AgilentVersion: $AgilentVersion
GPL=`awk -v av=$AgilentVersion '$1==av' $codeDir/AgilentVersion2GPL.txt | cut -f2`
if [[ ${#GPL} == 0 ]]; then
	echo unknown GPL for $AgilentVersion. Go to GEO Database and find it. Then append it to $codeDir/AgilentVersion2GPL.txt
else
	echo GPL: $GPL
fi