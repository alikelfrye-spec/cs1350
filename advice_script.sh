#!/bin/bash

# Set the filename for the log file
LOG_FILE="yourfirstname.lastname.advices"

# Fetch the current date and time
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# Fetch advice from the API and parse the JSON using curl and jq
advice=$(curl -s "https://api.adviceslip.com/advice" | jq -r '.slip.advice')

# Check if the advice variable is not empty
if [ -n "$advice" ]; then
  # Append the timestamped advice to the log file
  echo "[$timestamp] $advice" >> "$LOG_FILE"
  echo "Advice successfully logged at $timestamp."
else
  echo "Failed to fetch advice at $timestamp. Please check the API."
fi

