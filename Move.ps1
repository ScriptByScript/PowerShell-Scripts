# ---------------------------------------------------------------------------------------------------
# Filename: Move.ps1
# Last Edited: 06-02-2017    
# 
# Purpose: This script will move users from one OU to another
#
# Instructions: Create CSV file with two columns, userPrincipalName and NewOU, then edit file location
#               on line 19 to match your environment
#
# Change Log:
# v1.00, 04/05/2016 - Initial
# v1.01, 06/02/2017 - Minor text fixes, added instructions, added banner
# ---------------------------------------------------------------------------------------------------

# Imports the PowerShell module for Active Directory
Import-Module ActiveDirectory

# Imports CSV file, then for each of the users in that file (defined by their userPrincipalName), it will move their AD account to the new OU (defined by NewOU)
Import-CSV C:\PSScripts\Move.csv | foreach {Get-aduser $_.userPrincipalName | Move-ADObject -Targetpath "$_.NewOU"}