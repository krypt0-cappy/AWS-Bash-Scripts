#!/bin/sh

if [ $(id -u) -eq 0 ]; then
	read -p "Enter Username : " username
	read -s -p "Enter password : " password
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p "$pass" "$username"
		[ $? -eq 0 ] && echo "User has been added to the system" || echo "Failed to add user!"
	fi
else
	echo "Only root may add a user to the system."
	exit 2
fi

