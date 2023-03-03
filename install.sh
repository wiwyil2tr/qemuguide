#!/bin/bash
set -u
set -e
# Prep 1 - Are we "root"
if [ $UID -eq 0 ]; then
echo "Welcome to use batchtarrm software!"
echo "Please read README file at first"
echo "Do you want to continue installation (y/n)."
read r
r=$r""
if [ "$r" == "y" ]; then
cp qemubootdisk qemubootexisting qemuguide qemuguidecreate /usr/bin
echo "Installation Completed"
exit 0			 
else
echo "installation refused by $USER: `date`"
exit 1
fi
else
echo "Please run as root or use sudo"
exit 1
fi


