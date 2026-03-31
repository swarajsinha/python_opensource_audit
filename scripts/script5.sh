#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Interactively asks 3 questions and saves a philosophy statement to a .txt file

echo "=== Open Source Manifesto Generator ==="
echo "Answer three questions to generate your manifesto."
echo ""

# 'read -p' displays a prompt and waits for user to type an answer
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# date command gives us today's date in a readable format
DATE=$(date '+%d %B %Y')

# Create output filename with username and today's date
OUTPUT="manifesto_$(whoami)_$(date +%Y%m%d).txt"

# Write the manifesto to the file using > (overwrite) and >> (append)
echo "=== MY OPEN SOURCE MANIFESTO ===" > "$OUTPUT"
echo "Generated on: $DATE" >> "$OUTPUT"
echo "Author: $(whoami)" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every day, I rely on $TOOL — a tool built not by one company for profit," >> "$OUTPUT"
echo "but by a community of people who believed that software should be free." >> "$OUTPUT"
echo "To me, freedom means $FREEDOM: the ability to inspect, to change," >> "$OUTPUT"
echo "to share, and to improve. One day, I will build $BUILD and release" >> "$OUTPUT"
echo "it openly, so that someone I will never meet can stand on the" >> "$OUTPUT"
echo "foundation I helped lay — just as I stand on the work of others." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not just a licence. It is a commitment." >> "$OUTPUT"

echo ""
echo "Manifesto saved to: $OUTPUT"
echo ""
cat "$OUTPUT"
