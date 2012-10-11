#!/bin/bash

# Written By Charles Yan (charlesxyan@gmail.com)
# This script is intented to check various tools version to safe guard # build environment
# used as part of the android_rom_build_system_init project

echo
echo "Checking version of the tools"
echo

# checking python version
myver="NotSet"
myver=`python --version 2>&1 | grep -o '2..'`
if [ $myver == "2.5" ] 
then
	echo "python version $myver is ok"
elif [ $myver == "2.6" ] 
then
	echo "python version $myver is ok"
elif [ $myver == "2.7" ] 
then
	echo "python version $myver is ok"
else
	echo "python version $myver is not correct, should be 2.5 to 2.7"
fi 

# checking GNU make version
myver="NotSet"
myver=`make --version 2>&1 | grep -o '3.*'`
if [ $myver == "3.81" ] 
then
	echo "GNU make version $myver is ok"
elif [ $myver == "3.82" ] 
then
	echo "GNU make version $myver is ok"
else
	echo "GNU make version $myver is not correct, should be 3.81 to 3.82"
fi 

# checking javac version
myver="NotSet"
myver=`javac -version 2>&1 | head -n 1 | grep -o '1.6'`
if [ $myver == "1.6" ] 
then
	echo "javac version $myver is ok"
else
	echo "javac version $myver is not correct, should be 1.6"
fi 

# checking java version
myver="NotSet"
myver=`java -version 2>&1 | head -n 1 | grep -o '1.6'`
if [ $myver == "1.6" ] 
then
	echo "java version $myver is ok"
else
	echo "java version $myver is not correct, should be 1.6"
fi 

# checking java version
myver="NotSet"
myver=`git --version 2>&1 | grep -o '1.7'`
if [ $myver == "1.7" ] 
then
	echo "git version $myver is ok"
else
	echo "git version $myver is not correct, should be 1.7"
fi 

echo
echo "Done checking version of the tools"
echo

