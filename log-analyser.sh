#!/usr/bin/env bash

# Simple Nginx log analyser
# Usage: ./log-analyser.sh <log-file>

####################################################
# Checks if the file was provided as an argument to be read.
if [ $# -ne 1 ]; then
	echo "Usage: $0 <nginx-access-log-file>"
	exit 1s
fi

LOG_FILE=$1

# Verify that the file exists and is readable
if [ ! -f "$LOG_FILE" ]; then
	echo "Error: File '$LOG_FILE' not found!"
	exit 1
fi
####################################################
echo ""
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" \
  | sort | uniq -c | sort -nr | head -5 \
  | awk '{print $2 " - " $1 " requests"}'
####################################################
echo ""
echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" \
  | sort | uniq -c | sort -nr | head -5 \
  | awk '{print $2 " - " $1 " requests"}'
####################################################
echo ""
echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" \
  | sort | uniq -c | sort -nr | head -5 \
  | awk '{print $2 " - " $1 " requests"}'
####################################################
echo ""
echo "Top 5 user agents:"
awk -F\" '{print $6}' "$LOG_FILE" \
  | sort | uniq -c | sort -nr | head -5 \
  | awk '{print $2 " - " $1 " requests"}'
####################################################
