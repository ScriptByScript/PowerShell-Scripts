# ---------------------------------------------------------------------------------------------------
# Filename: MoveDir.ps1
# Last Edited: 06-02-2017    
# 
# Purpose: This script will move users to a new directory and apply all of the permissions needed
#
# Instructions: Create CSV file with three columns: sAMAccountName, OldDir, and NewDir, then edit
#               file location on line 23 to match your environment
#
#               Set your domain name on line 36
#
#               Change line 41 home directory letter that you use in your environment
#
# Change Log:
# v1.00, 09/03/2015 - Initial
# v1.01, 06/02/2017 - Minor text fixes, added instructions, added banner, cleaned up old code
# ---------------------------------------------------------------------------------------------------

# Imports the PowerShell module for Active Directory
Import-Module ActiveDirectory

# Import CSV file from local location, then begins the for loop
Import-CSV C:\PSScripts\MoveDir.csv |  Foreach-Object {

$san = $_.sAMAccountName

$oldhomedir = $_.OldDir + $san
$newhomedir = $_.NewDir + $san
	
Write-Host "Making: $newhomedir"
mkdir($newhomedir)
robocopy $oldhomedir $newhomedir /e
Remove-Item $oldhomedir -force -recurse
Write-Host "Waiting 5 second before applying security settings to home drive"
Start-Sleep 5
$account="DOMAINNAME\"+$san
$cmd = " /C Cacls "+$newhomedir+" /T /E /G "+$account+":F"
CMD $cmd
	
Write-Host $newhomedir access rights assigned
Set-ADUser $san -HomeDirectory $newhomedir -HomeDrive P:
}