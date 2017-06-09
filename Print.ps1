# ---------------------------------------------------------------------------------------------------
# Filename: Print.ps1
# Last Edited: 06-02-2017    
# 
# Purpose: This script will retrieve the print server queues and export that information to CSV file
#
# Instructions: Set your print server names on lines 18-19
#
#               Remove or comment out lines 19, 31-34 if you only have one print server
#
# Change Log:
# v1.00, 04/04/2016 - Initial, added informational prompts, added keystroke pause, removed driver 
#                     name from Get Cmdlet, changed Write-Host to Write-Output
# v1.01, 06/02/2017 - Minor text fixes, added instructions, changed banner, changed variable settings
# ---------------------------------------------------------------------------------------------------

# Define the two varibles to be used for the print servers
$printserver1 = "server.domain.name"
$printserver2 = "server2.domain.name"

# Getting and building the CSV file for the printers, as well as notify the user of basic progress
Write-Output ""
Write-Output "Getting $printserver1 Printers"
Start-Sleep -s 1
# Get-WMIObject -class Win32_Printer -computer $printserver1 | Select Name,DriverName,PortName | Export-CSV -path 'C:\PSScripts\Printers-$printserver1.csv'
Get-WMIObject -class Win32_Printer -computer $printserver1 | Select Name,PortName | Export-CSV -NoTypeInformation -path 'C:\PSScripts\Printers-$printserver1.csv'
Write-Output ""
Write-Output "Getting $printserver2 Printers"
Start-Sleep -s 1
# Get-WMIObject -class Win32_Printer -computer $printserver2 | Select Name,DriverName,PortName | Export-CSV -path 'C:\PSScripts\Printers-$printserver2.csv'
Get-WMIObject -class Win32_Printer -computer $printserver2 | Select Name,PortName | Export-CSV -NoTypeInformation -path 'C:\PSScripts\Printers-$printserver2.csv'
Write-Output ""
Write-Output "Completed getting printer lists, press spacebar to close"
Write-Output ""

# This will keep the screen paused, waiting for a keystroke to end the script
$HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | OUT-NULL
$HOST.UI.RawUI.Flushinputbuffer()