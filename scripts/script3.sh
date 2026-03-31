#!/bin/bash
# Script 3: Disk and Permission Auditor
# Loops through key directories and reports permissions + size

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "----------------------"

# For loop — goes through each directory in the array
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # awk extracts columns 1 (permissions), 3 (owner), 4 (group) from ls output
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # du -sh gives human-readable size; cut -f1 takes just the size number
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

# Bonus: Check if Python's library directory exists
echo ""
echo "--- Python Library Check ---"
PYTHON_DIR=$(find /usr/lib -maxdepth 1 -name 'python3*' -type d 2>/dev/null | head -1)
if [ -d "$PYTHON_DIR" ]; then
    PERMS=$(ls -ld "$PYTHON_DIR" | awk '{print $1, $3, $4}')
    echo "Found: $PYTHON_DIR"
    echo "Permissions: $PERMS"
else
    echo "Python library directory not found."
fi
