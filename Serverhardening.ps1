    #to start, we'll enable Windows firewall on all 3 firewall profiles
    set-netfirewallprofile -profile private, domain, public -enabled True
    
    #allow windows firewall to log failed/successful connections
    Set-NetFirewallProfile -Profile Domain,Public,Private -LogAllowed True -LogBlocked True
    
    # Disable all incoming traffic
    Set-NetFirewallProfile -Profile Domain,Public,Private -DefaultInboundAction Block

    
    # Allow incoming RDP traffic
    New-NetFirewallRule -DisplayName "Allow RDP" -Profile Private -Direction Inbound -Action Allow -Protocol TCP -LocalPort 3389
