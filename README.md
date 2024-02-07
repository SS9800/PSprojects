This is a collection of useful powershell scripts. See below for more details on each individual script.


1.**AD management Script:**
I made this script to automate the most repetitive tasks I've personally seen when it comes to AD user management. The script gives you 3 options to choose from
1. Create a new user-creates a new user in the "Staff" OU, where users in my organization are typically placed. 
2. Offboard user-This will disable the specified users account, reading from user input. 
3. reset user's password-This will reset the users password to one specified via user input.

2.**Utilization script**
This script reports multiple different system utilization rates, including CPU,RAM,HDD and GPU. It reports each value in 5 second intervals, repeatedly, until the script is stopped. 

3.**Remote computer info script**
This script connects to a remote host via hostname, and prompts the user on what info they would like to see. It starts  by displaying the current date along with the current uptime.They are then given 3 options:

1.network information-This will run  Get-NetIPConfiguration -All  on the remote machine, showing the current IP configs. 

2.Current services-=this gives the user the option to see all running, stopped, or all services on the remote host.

3.Event logs-This gives the user event logs from the past 24 hours, including system, security and Application logs.

**Server Hardening scripts**
This is a collection of small scripts that will be used for server security hardening when deploying a new windows server instance. the collection of scripts completes the following:
1. Creates RDP group, enabling members of this group to RDP to the machine and denying ones who aren't.
2. Enables windows firewall. 
