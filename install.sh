#!/bin/bash
set -u
set -e

# Prep 1 - Are we "root"
if [ $UID -eq 0 ]; then
	sudo=""
else
	sudo="sudo"
fi

echo -e "Welcome to use qemuguide software!\nPlease read README file at first"
read -r -p "Do you want to continue installation? [Y/n] " input

case $input in
	[yY][eE][sS]|[yY]|"")
		$sudo cp qemuguide qemuguidecreate qemubootexisting qemubootdisk qemudelete /usr/bin
		if [[ ! -d "$HOME/.themes" ]]; then
                mkdir -p "$HOME/.themes"
		fi
		echo "Installation Completed"
		exit 0
		;;

	[nN][oO]|[nN])
		echo "installation refused by $USER: `date`"
		exit 1
		;;

	*)
		echo "Invalid input..."
		exit 1
		;;
esac
