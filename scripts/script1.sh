#!/bin/bash
# Script 1: System Identity Report
# Author: Your Name | Course: Open Source Software

# --- Variables ---
STUDENT_NAME="Akshat Saxena"
SOFTWARE_CHOICE="Python"

# --- Gather system info using command substitution ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
DATETIME=$(date '+%A, %d %B %Y %H:%M:%S')
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')

# --- Display the welcome screen ---
echo "================================"
echo " Open Source Audit — $STUDENT_NAME"
echo "================================"
echo "Distro    : $DISTRO"
echo "Kernel    : $KERNEL"
echo "User      : $USER_NAME"
echo "Home Dir  : $HOME_DIR"
echo "Uptime    : $UPTIME"
echo "Date/Time : $DATETIME"
echo "OS License: GNU General Public License v2"
echo "Software  : $SOFTWARE_CHOICE — PSF License"
echo "================================"
