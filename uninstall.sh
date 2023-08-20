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

# check qemu script
if [[ ! -f "/usr/bin/qemuguide" ]] && \
	[[ ! -f "/usr/bin/qemuguidecreate" ]] && \
	[[ ! -f "/usr/bin/qemubootexisting" ]] && \
	[[ ! -f "/usr/bin/qemubootdisk" ]] && \
	[[ ! -f "/usr/bin/qemudelete" ]]; then
	printf "%s\n" "${RED}You have not installed the script, please install it first${RESET}"
	exit 1
fi

delete_virtual_machines() {
	printf "%s\n" "${RB_YELLOW}Do you want to ${BLUE}delete all virtual machines? ${PURPLE}[Y/n]${RESET}"
	printf "%s\n" "Press ${GREEN}enter${RESET} to ${BLUE}continue${RESET}, type ${YELLOW}n${RESET} to ${BLUE}skipped.${RESET}"
	read -r opt
	case $opt in
		y* | Y* | "")
			$sudo rm -r ${HOME}/qemu_vms
			printf "%s\n" "${GREEN}All virtual machings have been removed from you computer${RESET}"
			;;
		n* | N*)
			;;
		*)
			printf "%s\n" "Invalid choice. skipped."
			;;
	esac
}

printf "%s\n" "${RB_YELLOW}You are uninstalling qemuguide from your computer${RESET}"
printf "%s\n" "${RB_YELLOW}Do you want to ${BLUE}continue? ${PURPLE}[Y/n]${RESET}"
printf "%s\n" "Press ${GREEN}enter${RESET} to ${BLUE}continue${RESET}, type ${YELLOW}n${RESET} to ${BLUE}exit.${RESET}"
read -r opt
case $opt in
	y* | Y* | "")
		$sudo rm /usr/bin/qemuguide /usr/bin/qemuguidecreate /usr/bin/qemubootexisting /usr/bin/qemubootdisk /usr/bin/qemudelete
		delete_virtual_machines
		printf "%s\n" "${GREEN}Uninstallation Completed!${RESET}"
		exit 0
		;;
	n* | N*)
		printf "%s\n" "${RED}Uninstallation refused by $USER: `date`${RESET}"
		exit 1
		;;
	*)
		printf "%s\n" "${RED}Invalid choice. exited.${RESET}"
		exit 1
		;;
esac
