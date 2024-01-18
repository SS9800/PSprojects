#import AD module
try {
import-module ActiveDirectory -ErrorAction stop
}catch{
#module already imported, continue with script
}

#connect to DC
Enter-PSSession OLMC-IN-DC01
write-host -ForegroundColor "yellow"  "connected to DC01"

#prompt user on what they would like to do in active directory
do {write-host -ForegroundColor Cyan "What would you like to do? Please enter a number:  
  1.Create new Active directory user  2.Offboard Active directory user   3.reset user's password" 
 $userinput = read-host
 #if the user input equals 1, write which option they chose
 if ($userinput -eq 1) {write-host -foregroundcolor Yellow "You chose to create a new user."
  new-ADuser -path DC=OLMC,DC=org OU=Staff}
#if user input equals 2, offboard specified user
elseif ($userInput -eq 2) {write-host -ForegroundColor Yellow "you chose to offboard an active user."
$accountname = read-host "what is the username of the account to be disabled?"
Disable-ADAccount -Identity $accountname
}
#finally, if the user chooses option 3, it prompts for the users account name as well as what they would like the new password to be.
elseif ($userinput -eq 3) {write-host -ForegroundColor Yellow "you chose to reset a user's password."

$accountname = read-host "who's password are you resetting?"

$newpassword = read-host "enter the new password" -AsSecureString

$user = get-ADuser -identity $accountname
if ($user) {
set-adaccountpassword -identity $user -newpassword $newpassword -Reset}}

else {
write-host -ForegroundColor Red "Invalid input. Please enter 1,2 or 3"
}}
while ($userinput -ne 1 -and $userinput -ne 2 -and $userinput -ne 3)
#invalidates any user input that strays from 1,2 or 3.
