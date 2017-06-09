# ------------------------------------------------------------------------------------
# Filename: Randomizer.ps1
# Last Edited: 05-25-2017    
# 
# Purpose: This script will spit out a random restaurant location (as an example)
#
# Instructions: Change the restaurants/wording to any value that you want to randomize
#
# Change Log:
# v1.00, 09-24-2015 - Initial
# v1.01, 05/25/2017 - Minor text fixes, added instructions, added banner
# ------------------------------------------------------------------------------------

# Set the variables in memory
$Response = 'Y'
$RestaurantName = $Null
$RestaurantList = @()
$WriteOutList = $Null
$Choice = $Null
$Answer = $Null
$Y = "Y"
$N = "N"

# Beginning part of the script that takes the input from the user and puts it in variable $Answer
Write-Host ""
Write-Host "Welcome to the Restaurant Randomizer!" -ForegroundColor Green
Write-Host ""	
$Answer = Read-Host 'Would you like to load the pre-populated food selections? (y/n)'

# Below does the auto randomization from the given array of choices (restaurants)
if ($Answer -eq $Y) {
	
	Write-Host ""
	Write-Host "Using magic to determine best place to eat" -ForegroundColor Green
	Start-Sleep -s 3
	$Auto = ($a = "Wendy's","Burger King","Taco Johns","Chipotle","Arby's","McDonald's","Dairy Queen","Broadway Pizza","Panera","Applebee's") | Get-Random
	Write-Host ""
    Write-Host ""
	Write-host "The restaurant choice today is - " $Auto -ForegroundColor Yellow
	}

# If the operator doesn't choose a value, and simply presses enter, it will begin asking for input for restaurants
elseif ($Answer -eq $NULL) {
	
	Write-Host ""
	Write-Host ""
	Write-Host "Below is a list of commonly visited places nearby, to give you some inspiration" -ForegroundColor Yellow
	Write-Host ""
	Write-Host "Wendy's"
	Write-Host "Taco Johns"
	Write-Host "Chipotle"
	Write-Host "McDonald's"
	Write-Host "Burger King"
	Write-Host "Dairy Queen"
	Write-Host "Arby's"
	Write-Host ""

# Loops the Do function until the character N is chosen, then it will randomize from the input choices provided
	Do
{
	$RestaurantName = Read-Host 'Please enter a restaurant name'
	$Response = Read-Host 'Would you like to add an additional choice? (y/n) default is Y'
	$RestaurantList += $RestaurantName
}
Until ($Response -eq 'n')

$Choice = Get-Random $RestaurantList
Write-Host ""
Write-Host ""
Write-Host "Using magic to determine best place to eat" -ForegroundColor Green
Start-Sleep -s 3
Write-Host ""
Write-Host ""
Write-Host "The restaurant choice today is - $Choice" -ForegroundColor Yellow}

# If anything else is set, wether it be N or any other selection of characters, it will begin to ask for restaurant choices
else {
	
	Write-Host ""
	Write-Host ""
	Write-Host "Below is a list of commonly visited places nearby, to give you some inspiration" -ForegroundColor Yellow
	Write-Host ""
	Write-Host "Wendy's"
	Write-Host "Taco Johns"
	Write-Host "Chipotle"
	Write-Host "McDonald's"
	Write-Host "Burger King"
	Write-Host "Dairy Queen"
	Write-Host "Arby's"
	Write-Host ""
	
	Do
{
	$RestaurantName = Read-Host 'Please enter a restaurant name'
	$Response = Read-Host 'Would you like to add an additional choice? (y/n) default is Y'
	$RestaurantList += $RestaurantName
}
Until ($Response -eq 'n')

$Choice = Get-Random $RestaurantList
Write-Host ""
Write-Host ""
Write-Host "Using magic to determine best place to eat" -ForegroundColor Green
Start-Sleep -s 3
Write-Host ""
Write-Host ""
Write-Host "The restaurant choice today is - $Choice" -ForegroundColor Yellow}

# This will keep the screen paused, waiting for a keystroke to end the script
$HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | OUT-NULL
$HOST.UI.RawUI.Flushinputbuffer()