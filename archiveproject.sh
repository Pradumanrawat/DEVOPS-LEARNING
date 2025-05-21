#!/bin/bash


#variables

DIR=/home/praduman
DAYS=5
DEPTH=1
RUN=0

#check if path  is present or not
if [ ! -d $DIR ]
then
	echo"directory doesnot exit  : $DIR"
	exit 1
fi

#create archive folder if not present 

if [ ! -d $DIR/archive ]
then
	mkdir $DIR/archive
fi


# find the list of files larger than 10kb

for i in `find $DIR -maxdepth $DEPTH -type f -size +5k -mtime +$DAYS`
do

	if [ $RUN -eq 0 ]
	then



		gzip $i || exit 1
		mv $i.gz  $DIR/archive || exit 1
	fi
done


	

