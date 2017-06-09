# ---------------------------------------------------------------------------------------------------
# Filename: RemoveFromGroup.ps1
# Last Edited: 05-25-2017    
# 
# Purpose: This script will import the CSV using information from two columns. 
#          The first column is titled Name and the second column is titled Group 
#          (which is the group name you want the user removed from). You can list the users by alias.
#
# Instructions: Change the import CSV location on line 17 to reflect your environment
#
# Change Log:
# v1.00, 12/23/2015 - Initial
# v1.01, 05/25/2017 - Minor text fixes, added instructions, added banner
# ---------------------------------------------------------------------------------------------------

# CSV variable for reference in for loop
$Lines = import-csv C:\PSScripts\FILENAME.csv

# For loop to remove the users from the listed group in column group
foreach ($line in $lines){
Write-host "Remove "$Line.Name" from AD Group "$Line.Group -ForegroundColor Green
remove-adgroupmember -Identity $line.group -Member $line.name -Confirm:$false | Out-Null
}