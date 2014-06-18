#! /bin/bash
if [ $# -ne 1 ]
then
	echo $0 basepath
fi

path=$1

declare -A statarray
find $path -type f > findresult.txt
while read line
do
	ftype=`file -b "$line" | cut -d , -f 1`
	echo cut -d -f $ftype
	let statarray["$ftype"]++
done < findresult.txt

echo ========File types and counts=========

for ftype in "${!statarray[@]}"
do
	echo $ftype : ${statarray["$ftype"]}
done

