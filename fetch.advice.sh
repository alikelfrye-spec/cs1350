#!/bin/bash


LOG_FILE="aliyah.frye.advices"
API_URL="https://api.adviceslip.com/advice"


ADVICE=$(curl -s $API_URL | jq -r '.slip.advice')


TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Append the timestamp and advice to the log file
echo "[$TIMESTAMP] $ADVICE" >> $LOG_FILE


git add $LOG_FILE
git commit -m "Added new advice: $TIMESTAMP"
git push origin main
