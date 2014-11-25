#!/bin/sh

CT=$(which cleartool 2> /dev/null)

curFN=
IFS='
'
addFile=0
addTotal=0
remFile=0
remTotal=0


if [ ! $CT ];
then
	echo "ClearCase is needed to run this script"
	exit -1
fi

if [ $1 ];
then
    START="-since $1"
else
    START=
fi

for i in $($CT lshistory $START -short -recurse 2> /dev/null)
do

	if [ ! $prev ];
	then
		continue
	fi

	if [ ! $(echo $i | rev | cut -d / -f 1) ];
	then
		if [[ $addFile == 0 && $remFile == 0 ]];
		then
			continue
		fi
		echo "[ ] " $i
		echo $addFile "lines added"
		echo $remFile "lines removed"
		addFile=0
		remFile=0
		continue
	fi

	curFN=$(echo $i | cut -d @ -f 1)

	if [ -d $curFN ];
	then
		continue
	fi

	difflog=$($CT diff -serial_format -predecessor $cur)

	for line in $difflog
	do

		if [[ "$line" == "> "* ]];
		then
			addFile=$((addFile+1))
			addTotal=$((addTotal+1))
			continue
		fi

		if [[ "$line" == "< "* ]];
		then
			remFile=$((remFile+1))
			remTotal=$((remTotal+1))
			continue
		fi

	done

done

echo "=== Total ==="
echo $addTotal "lines added"
echo $remTotal "lines removed"
