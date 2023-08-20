#!/bin/bash
set -u
set -e

# define some colors for output
RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
PURPLE=$(printf '\033[35m')
RESET=$(printf '\033[m')
RB_YELLOW=$(printf '\033[93m')

# Prep 1 - Are we "root"
if [ $UID -eq 0 ]; then
	sudo=""
else
	sudo="sudo"
fi

printf "%s\n" "${GREEN}Welcome to use qemuguide software!${RESET}"
printf "%s\n" "${RB_YELLOW}Please read ${YELLOW}README ${RB_YELLOW}file at first${RESET}"
printf "%s\n" "${RB_YELLOW}Do you want to ${BLUE}continue ${RB_YELLOW}installation? ${PURPLE}[Y/n]${RESET}"
printf "%s\n" "Press ${GREEN}enter${RESET} to ${BLUE}continue${RESET}, type ${YELLOW}n${RESET} to ${BLUE}exit.${RESET}"
read -r opt
case $opt in
	y* | Y* | "")
		$sudo cp qemuguide qemuguidecreate qemubootexisting qemubootdisk qemudelete /usr/bin
		if [[ ! -d "${HOME}/qemu_vms" ]]; then
			mkdir -p "${HOME}/qemu_vms"
		fi
		printf "%s\n" "${GREEN}Your virtual machine files path is the${RESET} ${YELLOW}\"${HOME}/qemu_vms\"${RESET} ${GREEN}folder${RESET}"
		printf "%s\n" "${GREEN}Installation Completed!${RESET}"
		exit 0
		;;
	n* | N*)
		printf "%s\n" "${RED}installation refused by $USER: `date`${RESET}"
		exit 1
		;;
	*)
		printf "%s\n" "${RED}Invalid choice. exited.${RESET}"
		exit 1
		;;
esac
