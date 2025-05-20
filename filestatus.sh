#!/bin/bash

# monitoring free space disk

FILE_STATUS=$( df -h | egrep -v "Filesystem|tmpfs" | grep "/sda2" | awk '{print $5}' | tr -d % )  #space  used
TO="pradumanrawat123@gmail.com"

if [ $FILE_STATUS -ge 10 ]
then
echo "warning,disk space is low : $FILE_STATUS % " | mail -s "Alert ! disk space is  low" $TO

else 
	echo "all good "
fi
