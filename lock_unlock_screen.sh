#!/bin/bash

###Referencia: https://superuser.com/users/241800/hashbrown###
exec >> /var/log/lock_screen.log 2>&1
#prints out, among other things;
#      string "org.kde.screensaver"
#transform it to 'org.kde.screensaver'
service=$(\
    dbus-send \
        --session \
        --dest=org.freedesktop.DBus \
        --type=method_call \
        --print-reply \
        /org/freedesktop/DBus org.freedesktop.DBus.ListNames \
    | grep -o '[^"]*.screensaver'
)

#prints out, among other things;
#method bool org.freedesktop.ScreenSaver.SetActive(bool e)
#transform it to 'org.freedesktop.ScreenSaver'
interface=$(
    qdbus \
        $service /ScreenSaver \
    | grep -oP '[^ ]*(?=.SetActive)'
)

path='/ScreenSaver'

#monitor it with a while loop
dbus-monitor "type='signal',interface='$interface',member='ActiveChanged',path='$path'" \
| while read -r line; do
    #ignore the metadata and pull the 'boolean <true/false>' line
    read line

    #check if it is set to true
    if echo $line | grep -q 'true'; then
        echo "Locked at $(date)"
    else
        echo "Unlocked at $(date)"
    fi
done