# Databrary Session Asset Downloader

This PowerShell script automates the process of downloading session assets from Databrary for a given set of session IDs.

## Requirements

- Windows operating system
- Google Chrome browser
- PowerShell
- Databrary account with appropriate permissions

## Setup

1. Ensure you have Google Chrome installed on your Windows machine.
2. Open Google Chrome and change the default download location to your desired folder:
   - Click the three dots in the top-right corner
   - Go to Settings
   - Click "Downloads" on the left column 
   - click on "Change" next to "Location"
   - Select your preferred download folder
3. Log in to your Databrary account in Google Chrome:
   - Visit https://nyu.databrary.org/
   - Click on "Login" and enter your credentials

## Usage

1. Prepare a CSV file with the session information:
   - On the Databrary website, use the "Export all as CSV" function to download a CSV file containing all session information.
   - Open the CSV file and remove any rows for sessions you don't want to download.
   - Ensure the CSV file contains at least these columns:
     - `session-id`: The ID of the session on Databrary
     - `session-name`: A descriptive name for the session

2. Find your Databrary volume number:
   - Navigate to your Databrary volume page
   - The volume number can be found in the URL. For example, if the URL is https://nyu.databrary.org/volume/1234, your volume number is 1234
   - Alternatively, you can find the volume number displayed on the volume page itself

3. Open PowerShell:
   - Press Win + X and select "Windows PowerShell" or "Windows PowerShell (Admin)"
   - Or search for "PowerShell" in the Start menu and open it

4. Navigate to the directory containing the script:
   ```
   cd path\to\script\directory
   ```

5. Run the script with the path to your CSV file and the volume number as arguments:

   ```
   .\download_databrary.ps1 -CsvFilePath "path\to\your\csv\file.csv" -VolumeNumber 1234
   ```
   Replace "path\to\your\csv\file.csv" with the actual path to your CSV file, and 1234 with your actual volume number.

6. The script will open Chrome windows for each session ID in the CSV file, initiating the download process.

7. There is a 3-minute (180 seconds) delay between each download to prevent overwhelming the server and your network connection. You can adjust this in the script if needed.

## Notes

- Ensure you have the necessary permissions on Databrary to access the sessions you're attempting to download.
- The script assumes Chrome is installed in the default location. If your Chrome installation is in a different location, you'll need to update the `$ChromePath` variable in the script.
- Downloads will be saved to the location you set in Chrome's settings.

## Troubleshooting

If you encounter any issues:
- Make sure you're logged into Databrary in Chrome before running the script.
- Check that your CSV file is formatted correctly and contains valid session IDs.
- Verify that you have the necessary permissions on Databrary for the sessions you're trying to download.
- Ensure you've entered the correct volume number when running the script.

For any persistent problems, please contact your system administrator or the Databrary support team.
