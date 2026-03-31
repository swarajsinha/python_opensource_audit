#!/bin/bash
# Script 2: FOSS Package Inspector
# Checks if Python is installed and prints its info and philosophy

PACKAGE="python3"

# Check if the package is installed using 'command -v'
# This works on both apt-based and rpm-based systems
if command -v python3 &>/dev/null; then
    echo "$PACKAGE is installed."
    echo "Version: $(python3 --version)"

    # Try dpkg (Ubuntu/Debian) first, then rpm (Fedora/RHEL)
    if command -v dpkg &>/dev/null; then
        dpkg -l python3 2>/dev/null | grep -E '^ii' | awk '{print "Package:", $2, "| Version:", $3}'
    elif command -v rpm &>/dev/null; then
        rpm -qi python3 2>/dev/null | grep -E 'Version|License|Summary'
    fi
else
    echo "$PACKAGE is NOT installed."
    echo "Install it with: sudo apt install python3"
fi

# Case statement: prints a philosophy note based on the package name
case $PACKAGE in
    python3)
        echo "Python: 30 years of open collaboration that powered the AI revolution" ;;
    httpd|apache2)
        echo "Apache: the web server that built the open internet" ;;
    mysql|mariadb)
        echo "MySQL: open source at the heart of millions of apps" ;;
    vlc)
        echo "VLC: born in a French university, plays everything, costs nothing" ;;
    *)
        echo "$PACKAGE: part of the open-source ecosystem that powers the world" ;;
esac
