#!/bin/bash

# Enable debug mode
set -x

# Check if a CSV file and volume number are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <csv_file_path> <volume_number>"
    exit 1
fi

CSV_FILE_PATH="$1"
VOLUME_NUMBER="$2"

echo "CSV file path: $CSV_FILE_PATH"
echo "Volume number: $VOLUME_NUMBER"

# Check if the CSV file exists
if [ ! -f "$CSV_FILE_PATH" ]; then
    echo "Error: CSV file not found: $CSV_FILE_PATH"
    exit 1
fi

# Function to open URL in Chrome
open_chrome() {
    local url="$1"
    echo "Attempting to open URL: $url"
    open -a "Google Chrome" "$url"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to open Chrome"
    fi
}

# Read the CSV file and open Chrome for each session ID
echo "Starting to process CSV file"
tail -n +2 "$CSV_FILE_PATH" | while IFS=',' read -r session_id session_name _; do
    echo "Processing session: $session_id - $session_name"
    url="https://nyu.databrary.org/volume/$VOLUME_NUMBER/slot/$session_id/zip/false"
    
    echo "Opening URL for session $session_id: $session_name"
    open_chrome "$url"
    
    echo "Waiting for 180 seconds before next URL"
    sleep 180
done

echo "All URLs have been processed."