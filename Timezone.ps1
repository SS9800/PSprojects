    #change timezone to EST
    change-timezone "eastern standard time"
    #set trusted time source, in this case time.windows.com
    w32tm /config /manualpeerlist: time.windows.com /syncfromflags:manual /reliable:yes /update