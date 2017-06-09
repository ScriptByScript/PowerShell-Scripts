# ------------------------------------------------------------------------------------------------------------
# Filename: GetEmailAddressFromOU.ps1
# Last Edited: 05-25-2017    
# 
# Purpose: Return email addresses from users in an OU and export that list to CSV file
#
# Instructions: Change the searchbase, domain, and CSV export directory on line 19 to reflect your environment
#
# Change Log:
# v1.00, 09/04/2015 - Initial
# v1.01, 05/24/2017 - Minor text fixes, added instructions
# v1.02, 05/25/2017 - Formatting of banner
# ------------------------------------------------------------------------------------------------------------

# Imports the PowerShell module for Active Directory
Import-Module ActiveDirectory

# This will return all of the email addresses for the user's in the Users OU and then export that list to a CSV file
Get-ADUser -SearchBase "OU=Users,DC=domain,DC=com" -Filter * -Properties DisplayName, EmailAddress | select DisplayName, EmailAddress | Export-CSV "C:\PSScripts\Email_Addresses.csv"