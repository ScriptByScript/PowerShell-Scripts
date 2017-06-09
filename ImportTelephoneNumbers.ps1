# ---------------------------------------------------------------------------------------------------
# Filename: ImportTelephoneNumbers.ps1
# Last Edited: 06-02-2017    
# 
# Purpose: This script will update telephone numbers in Active Directory based on the CSV file
#          provided
#
# Instructions: Create CSV file with two columns Name and Telephone
#
# Change Log:
# v1.00, 07/24/2015 - Initial
# v1.01, 06/02/2017 - Minor text fixes, added instructions, added banner
# ---------------------------------------------------------------------------------------------------

# Imports the PowerShell module for Active Directory
Import-Module ActiveDirectory

# Import CSV file from local location, then begins the for loop
Import-CSV C:\PSScripts\telephone.csv | ForEach {
  Set-ADUser -Identity $_.Name -officePhone $_.Telephone
}