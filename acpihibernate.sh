#!/bin/bash

GREEN='\033[0;32m' 
LGREEN='\033[1;32m' 
WHITE='\033[1;37m'
YELL='\033[1;33m'
RED='\033[0;31m'
LRED='\033[1;31m'
MAG='\033[0;35m'
LMAG='\033[1;35m'
CYAN='\033[0;36m'
LCYAN='\033[1;36m'
NC='\033[0m' # No Color


t="$1"
if [ -z "$t" ] ; then
    t=0
fi
seconds=$(echo "$t*60"|bc);
echo "Will hibernate in $t min(s) or [$seconds] secondes, At:"
date -d "today + $t minutes"
sleep $seconds

#arr=(XHC LID0 RP03 RP04)
#arr=(XHC) #2021-09-30 18:31:21
#arr=(XHC XDCI)

#ALL  (works): 
#arr=(XHC XDCI PEG0 PEGP PEG1 PEGP PEG2 PEGP RP09 PXSX RP10 PXSX RP11 PXSX RP12 PXSX RP13 PXSX RP01 PXSX RP02 PXSX RP03 PXSX RP01 PXSX RP02 PXSX RP03 PXSX RP04 PXSX RP05 PXSX RP06 PXSX RP07 PXSX RP08 PXSX RP17 PXSX RP18 PXSX RP19 PXSX RP20 PXSX RP14 PXSX RP15 PXSX RP16 PXSX GLAN XDCI HDAS)
#TEst after full shutdown
#2021-10-01 22:40:47  -     arr=(XHC RP07 PXSX RP08 PXSX RP17 PXSX RP18 PXSX RP19 PXSX RP20 PXSX RP14 PXSX RP15 PXSX RP16 PXSX GLAN XDCI HDAS)
#arr=(XHC XDCI PEG0 PEGP PEG1 PEGP PEG2 PEGP RP09 PXSX RP10 PXSX RP11 PXSX RP12 PXSX RP13 PXSX RP01 PXSX RP02 PXSX RP03 PXSX RP01 PXSX RP02 PXSX RP03 PXSX RP04 PXSX RP05 PXSX RP06 PXSX RP07 PXSX RP08 PXSX RP17 PXSX RP18 PXSX RP19 PXSX RP20 PXSX RP14 PXSX RP15 PXSX RP16 PXSX GLAN XDCI HDAS)
#arr=(XHC RP07 PXSX RP08 PXSX RP17 PXSX RP18 PXSX RP19 PXSX RP20 PXSX RP14 PXSX RP15 PXSX RP16 PXSX GLAN XDCI HDAS) #Celui la ne fonctionne pas

#2021-10-02 14:03:28 - j'ai enlevé : PEG0 PEGP PEG1 PEGP PEG2 PEGP RP09 PXSX 
arr=(XHC XDCI RP10 PXSX RP11 PXSX RP12 PXSX RP13 PXSX RP01 PXSX RP02 PXSX RP03 PXSX RP01 PXSX RP02 PXSX RP03 PXSX RP04 PXSX RP05 PXSX RP06 PXSX RP07 PXSX RP08 PXSX RP17 PXSX RP18 PXSX RP19 PXSX RP20 PXSX RP14 PXSX RP15 PXSX RP16 PXSX GLAN XDCI HDAS)
# Ce qui interesse est dans : RP01 PXSX RP02 PXSX RP03 PXSX RP04 PXSX RP05 PXSX RP06 PXSX 
#2021-10-03 13:40:05 J'enleve les autres poru conserver RP01 PXSX RP02 PXSX RP03 PXSX RP04 PXSX RP05 PXSX RP06 PXSX 
arr=(XHC XDCI RP10 RP01 PXSX RP02 PXSX RP03 PXSX RP04 PXSX RP05 PXSX RP06 PXSX) #ça a fonctionné


for v in "${arr[@]}"
do

 
    what=$v
    echo "Looking for $what" 
    foundline=$(cat /proc/acpi/wakeup  | grep $what | grep enable | wc -l)
    echo "Found line : $foundline"
    if [ $foundline -gt 0 ]; then
        echo "must disable [$what]";
        #echo "echo $what >/proc/acpi/wakeup"
        sudo sh -c "echo $what >/proc/acpi/wakeup"
    else
    echo "$what Already disabled, ok";
    fi
done

## Grant sudo access to systemctl suspend
# sudo nano /etc/sudoers    
# # Allow acpisuspend to wait and suspend
# boony ALL = (ALL) NOPASSWD: /usr/bin/systemctl suspend


echo "Hibernate now !"
systemctl hibernate
