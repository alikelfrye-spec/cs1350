#!/bin/bash

# Define the log file and API URL
LOG_FILE="aliyah.frye.advices"
API_URL="https://api.adviceslip.com/advice"

# Fetch advice using curl and parse the JSON with jq
ADVICE=$(curl -s $API_URL | jq -r '.slip.advice')

# Get the current date and time
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Append the timestamp and advice to the log file
echo "[$TIMESTAMP] $ADVICE" >> $LOG_FILE

# Use Git to commit and push the new log entry
git add $LOG_FILE
git commit -m "Added new advice: $TIMESTAMP"
git push origin main
