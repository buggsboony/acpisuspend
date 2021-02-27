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



#arr=(XHC LID0 RP03 RP04)
arr=(XHC)

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



systemctl suspend
