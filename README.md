# Security Event ID 4625 Monitor

Developed by Aviad Ofek, this PowerShell script offers a near real-time monitoring solution for Windows security events, specifically targeting event ID 4625. Event ID 4625 is logged when a login attempt fails, making this script an invaluable tool for system administrators and cybersecurity professionals seeking to enhance system security and user experience through automation.

## Features

- **Real-time Monitoring**: Refreshes every second to capture the most recent failed login attempts without missing a beat.
- **Detailed Reporting**: Extracts and displays key details of each failed login attempt, including event ID, severity level, account name, and timestamp.
- **Avoids Duplicates**: Smartly avoids logging the same event more than once, ensuring that each report entry is unique.
- **Continuous Operation**: Designed to run uninterrupted until manually stopped, providing ongoing surveillance.

## Getting Started

To use the `Security Event ID 4625 Monitor` script, follow these steps:

1. **Prerequisites**: Ensure you have PowerShell installed on your Windows system and that you have the necessary permissions to access Windows security logs.

2. **Download the Script**: Clone this repository or download the script file directly to your local system.

3. **Run the Script**: Open PowerShell as an administrator. Navigate to the directory where the script is saved and execute it by entering:
.\path\to\script.ps1

Replace `.\path\to\script.ps1` with the actual path to the script file.

4. **Monitor Events**: The script will immediately start and continue running, displaying new failed login attempts as they are logged.

## How It Works

The script fetches the latest 10 events with ID 4625 from the Windows Security log and displays the following information for each event:

- **Timestamp**: When the failed login attempt occurred.
- **ID**: The event ID (always 4625 for failed logins).
- **Level**: The severity level of the event.
- **Account Name**: The account name associated with the failed login attempt.

It refreshes the output every second, ensuring that the information remains current without duplicating entries.
## Author
This script was authored by [aviado1](https://github.com/aviado1).
## Contributions

Contributions are welcome! If you have suggestions or improvements, please feel free to fork the repository, make your changes, and submit a pull request. Your feedback helps make this tool better for everyone.

---
