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


foundline=$(cat /proc/acpi/wakeup  | grep XHC | grep enable | wc -l)

if [ $foundline = 0 ]; then
    echo "must disable it";
    sudo sh -c "echo XHC >/proc/acpi/wakeup"
else
echo "Already disabled, ok";
fi



systemctl suspend
