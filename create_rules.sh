#!/bin/bash

# Written By Charles Yan (charlesxyan@gmail.com)
# This script is intented to create a 51-android.rules file in 
# /etc/udev/rules.d/
# used as part of the android_rom_build_system_init project

echo
echo "creating 51-android.rules in /etc/udev/rules.d ..."
echo

myrules="./51-android.rules"
sysrules="/etc/udev/rules.d/51-android.rules"
if [ -f $sysrules ]
then
	echo $sysrules " already exists, please check/correct it ..."
else
	if [ -f $myrules ]
	then
		echo "update 51-android.rules with current user ..."
		sed -i 's/<username>/'$USER'/g' $myrules
		sudo cp $myrules $sysrules
	else
		echo "error: $myrules does not exist, please check your download"
	fi
fi

echo
echo "Done creating 51-android.rules in /etc/udev/rules.d ..."
echo

