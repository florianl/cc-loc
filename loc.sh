#!/bin/sh

CT=$(which cleartool 2> /dev/null)

prev=
prevFN=
cur=
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

for i in $($CT lsvtree -all -obsolete -nco * 2> /dev/null)
do
	prev=$cur
	cur=$i

	if [ ! $prev ];
	then
		continue
	fi

	if [ ! $(echo $cur | cut -d / -f 3) ];
	then
		if [[ $addFile == 0 && $remFile == 0 ]];
		then
			continue
		fi
		echo "[ ] " $prevFN
		echo $addFile "lines added"
		echo $remFile "lines removed"
		addFile=0
		remFile=0
		continue
	fi

	if [ ! $(echo $prev | cut -d / -f 3) ];
	then
		continue
	fi

	curFN=$(echo $cur | cut -d @ -f 1)
	prevFN=$(echo $prev | cut -d @ -f 1)

	if [ -d $curFN ];
	then
		continue
	fi

	difflog=$($CT diff -serial_format $prev $cur)

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
