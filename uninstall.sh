#!/bin/bash

#uninstall stuff
what=${PWD##*/}
extension=.sh
#peut être extension vide 
 
echo "killing running instances"
killall $what

echo "remove symbolic link from usr bin"
sudo rm /usr/bin/$what

echo "done."



#uninstall stuff
what="acpi-hibernate"
extension=.sh
#peut être extension vide 
 
echo "killing running instances"
killall $what

echo "remove symbolic link from usr bin"
sudo rm /usr/bin/$what

echo "done."



#install stuff
what="acpihibernate"
extension=.sh
#peut être extension vide 
 
echo "killing running instances"
killall $what

echo "remove symbolic link from usr bin"
sudo rm /usr/bin/$what

echo "done."

