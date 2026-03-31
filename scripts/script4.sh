#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./script4.sh <logfile> [keyword]
# Example: ./script4.sh /var/log/syslog error

LOGFILE=$1
KEYWORD=${2:-"error"}   # Default keyword is 'error' if none given
COUNT=0

# Check that a filename was actually passed
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    exit 1
fi

# Check the file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# Check the file is not empty
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: '$LOGFILE' is empty. Nothing to analyse."
    exit 0
fi

# While-read loop: reads the file one line at a time
while IFS= read -r LINE; do
    # If the line contains the keyword (case-insensitive), increment counter
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo ""
echo "--- Last 5 matching lines ---"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
