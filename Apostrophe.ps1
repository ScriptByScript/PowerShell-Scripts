# ------------------------------------------------------------------------------------------------
# Filename: Apostrophe.ps1
# Last Edited: 8-10-2017    
#
# Purpose: Return user accounts in an OU that has an apostrophe in their name
#          and export that list to CSV file
#
# Instructions: Change the searchbase domain, and CSV export directory to reflect your environment
#
# Change Log
# v1.00, 08/10/2017 - Initial
# ------------------------------------------------------------------------------------------------

# Imports the PowerShell module for Active Directory
Import-Module ActiveDirectory

# Initial AD information query
$arr = Get-ADUser -SearchBase "CN=Users,DC=domain,DC=com" -Filter * -Properties sAMAccountName,employeeID

Write-Output ""
Write-Output ">> Query complete <<"
Write-Output ""

# For loop
$results = $arr | ForEach-Object {		
	If ($_.sAMAccountName -like "*'*") { $_ | Select sAMAccountName,employeeID }
}
Write-Output ""
Write-Host "Number of resturned results: " $results.count
Write-Output ""

$results | Export-CSV C:\PSScripts\AposUsers.csv -NoTypeInformation

# This will update the status of the script being ran
Write-Output ""
Write-Output "***********************************************************************"
Write-Warning " Completed getting user accounts, press spacebar to end script"
Write-Output "***********************************************************************"
Write-Output ""

# This will keep the screen paused, waiting for a keystroke to end the script
$HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | OUT-NULL
$HOST.UI.RawUI.Flushinputbuffer()