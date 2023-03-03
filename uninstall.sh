#!/bin/bash
set -u
set -e
# Prep 1 - Are we "root"
if [ $UID -eq 0 ]; then
echo "You are uninstalling qemuguide from your computer"
echo "Do you want to continue (y/n)."
read r
r=$r""
if [ "$r" == "y" ]; then
rm /usr/bin/qemubootdisk /usr/bin/qemubootexisting /usr/bin/qemuguide /usr/bin/qemuguidecreate
echo "Uninstallation Completed"
exit 0			 
else
echo "installation refused by $USER: `date`"
exit 1
fi
else
echo "Please run as root or use sudo"
exit 1
fi


