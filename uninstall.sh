#!/bin/bash
set -u
set -e

# Prep 1 - Are we "root"
if [ $UID -eq 0 ]; then
	sudo=""
else
	sudo="sudo"
fi

if [[ ! -f "/usr/bin/qemuguide" ]] && \
	[[ ! -f "/usr/bin/qemuguidecreate" ]] && \
	[[ ! -f "/usr/bin/qemubootexisting" ]] && \
	[[ ! -f "/usr/bin/qemubootdisk" ]] && \
	[[ ! -f "/usr/bin/qemudelete" ]]; then
	echo "You have not installed the script, please install it first"
	exit 1
fi

echo "You are uninstalling qemuguide from your computer"
read -r -p "Do you want to continue? [Y/n] " input

case $input in
	[yY][eE][sS]|[yY]|"")
	read -r -p "Do you want to delete all virtual machines? [Y/n]" input
case $input in
	[yY][eE][sS]|[yY]|"")
		$sudo rm -r ~/qemu_vms
		echo "All virtual machings have been removed from you computer"
		;;
	[nN][oO]|[nN])
		;;

	*)
		echo "Invalid input..."
		exit 1
		;;
esac
		$sudo rm /usr/bin/qemuguide /usr/bin/qemuguidecreate /usr/bin/qemubootexisting /usr/bin/qemubootdisk /usr/bin/qemudelete
		echo "Uninstallation Completed"
		exit 0
		;;
	[nN][oO]|[nN])
		echo "Uninstallation refused by $USER: `date`"
		exit 1
		;;

	*)
		echo "Invalid input..."
		exit 1
		;;
esac
