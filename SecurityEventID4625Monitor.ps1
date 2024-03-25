<#
.TITLE
Security Event ID 4625 Monitor

.AUTHOR
Aviad Ofek - This script is developed by Aviad Ofek, aiming to enhance system configuration and user experience consistency through automation.

.SYNOPSIS
This script monitors and reports the most recent Windows security events with ID 4625, 
indicating failed login attempts. It refreshes every second to provide near real-time updates.

.DESCRIPTION
The script fetches the latest 10 events with ID 4625 from the Security log and extracts details
such as the event ID, level display name, account name associated with the failed login attempt,
and the timestamp of each event. It is designed to run continuously until manually stopped,
updating the output every second and avoiding duplicate entries.

.AUTHOR
Aviad Ofek

#>

$lastEventTime = $null

While ($true) {
    $events = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625} -MaxEvents 10 | Where-Object {
        if ($null -eq $lastEventTime) { $true }
        else { $_.TimeCreated -gt $lastEventTime }
    }

    foreach ($event in $events) {
        $id = $event.Id
        $levelDisplayName = $event.LevelDisplayName
        $timeCreated = $event.TimeCreated
        $message = $event.Message

        if ($null -eq $lastEventTime -or $timeCreated -gt $lastEventTime) {
            $lastEventTime = $timeCreated
        }

        # Extracting the account name from the "Account For Which Logon Failed" section.
        $accountNamePattern = 'Account For Which Logon Failed:[\s\S]*?Account Name:\s+([^\s\r\n]+)'
        if ($message -match $accountNamePattern) {
            $accountName = $Matches[1]
        } else {
            $accountName = 'N/A'
        }

        # Output the details
        Write-Output "Timestamp: $timeCreated, ID: $id, Level: $levelDisplayName, Account Name: $accountName"
    }
    Start-Sleep -Seconds 1
}

