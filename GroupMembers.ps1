# ---------------------------------------------------------------------------------------------------
# Filename: GroupMembers.ps1
# Last Edited: 06-09-2017
#
# Purpose: This script will retrieve all users in a distribution list and export the results
#
# Instructions: Run script and follow on screen prompt
#
# Change Log:
# v1.00, 05/16/2016 - Initial
# v1.01, 06/09/2017 - Minor text fixes, added instructions
# ---------------------------------------------------------------------------------------------------

# Define the varible to be used for the group list
Write-Host ""
$Group = Read-Host 'What group do you want the members of?'

# Notify the user of basic progress
Write-Host ""
Write-Host "Getting Group Members" -ForegroundColor Green
Start-Sleep -s 1

# Getting CSV file for the group members, as well as notify the user of basic progress
Get-DistributionGroupMember -identity "$Group" | Select Name, Office | Export-Csv c:\PSScripts\GroupMembers.csv -NoTypeInformation

# Notify the user of basic progress
Write-Host ""
Write-Host "Process completed, press space to close" -ForegroundColor Yellow

# This will keep the screen paused, waiting for a keystroke to end the script
$HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | OUT-NULL
$HOST.UI.RawUI.Flushinputbuffer()
