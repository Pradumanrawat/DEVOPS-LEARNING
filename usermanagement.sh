#!/bin/bash


# script should be run with sudo or root
if 	[ ${UID}  -ne 0 ]
then
	echo "please run with sudo or root "
	exit 1
fi


#user should provide atleast one args as username else guide him

if [ ${#} -lt 1 ]
then
	echo " usage : ${0}(script name)  username "
	exit 1
fi


# store first args as user name

USERNAME=${1}

echo  $USERNAM
#in case of more than one args ,store it as account comments

shift
COMMENT=${@}

echo $COMMENT

# create a password


PASSWORD=$(date +%s%N)

#create the user

useradd -c "${COMMENT}" -m $USERNAME

#check if user is successfully created or not

if [ $? -eq 1 ]
then
	echo " the account could not be created "
	exit 1
fi

# set the password for the user


echo "${USERNAME}:${PASSWORD}" | chpasswd


#check if passwd is succesfully created or not

if [ $? -eq 1 ]
then
	echo " password could not be set "
fi 

# force password change on first login 
passwd -e $USERNAME

#display the username, password ,and the host where it is created

echo 
echo " username : $USERNAME "

echo
echo "password : $PASSWORD "

echo 
echo " hostname : $(hostname) "
























