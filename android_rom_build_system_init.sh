#!/bin/bash

# Written By Charles Yan (charlesxyan@gmail.com)
# This script is intented to simplify setting up the build environment # on a 64bit linux system, such as ubuntu 12.04 LTS

# references include but not limited to 
# http://http://source.android.com/source/initializing.html


# install the git packages
sudo apt-get -y install git-core 

# install the java packages
sudo apt-get -y install openjdk-6-jdk 

# install the other tools packages
sudo apt-get -y install gnupg flex bison gperf build-essential zip curl tofrodos python-markdown pngcrush schedtool xsltproc libxml2-utils

# install the other libs packages
sudo apt-get -y install libc6-dev libncurses5-dev:i386 x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib mingw32 zlib1g-dev:i386

#should not be needed on ubuntu 12.04 LTS
#sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so

# checking versions
myshfile="./check_version.sh"
if [ -f $myshfile ]
then
	source $myshfile
else
	echo "$myshfile not found, tools versions are not checked"
fi

# installing repo commands in ~/bin
echo "installing repo commands in ~/bin"
mybindir="$HOME/bin"
if [ -d $mybindir ]
then
	echo $mybindir "exist, continue ..."
else
	echo $mybindir "does not exist, creating," $mybindir "adding to PATH"
	mkdir $mybindir
	chmod a+x $mybindir
	PATH=$mybindir:$PATH
fi
myrepo="$HOME/bin/repo"
if [ -f $myrepo ]
then
	echo $myrepo " already installed, continue ..."
else
	curl http://android.git.kernel.org/repo > $HOME/bin/repo
	chmod a+x $HOME/bin/repo
fi

# copy 51-android.rules to /etc/udev/rules.d
myshfile="./create_rules.sh"
if [ -f $myshfile ]
then
	source $myshfile
else
	echo "$myshfile not found, please check"
fi

echo "System wide initial setup is done"
echo "create your working directory, then"
echo "use 'repo init' to initialize a repo"
echo "use 'repo sync' to sync with the repo"

#echo "Codename, https://github.com/CNA/android_manifest.git -b jellybean"
#echo "Cyanogen, git://github.com/CyanogenMod/android.git -b jellybean"

