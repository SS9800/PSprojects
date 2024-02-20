write-host "Please enter a username" 
$username = read-host
new-localuser -Name $username -PasswordNeverExpires
