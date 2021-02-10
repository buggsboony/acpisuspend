#!/bin/bash
#Simple installer
#install stuff
what=${PWD##*/}   
extension=.sh
#peut être extension vide

echo "Set executable..."
chmod +x $what$extension
#echo "lien symbolique vers usr bin"
sudo ln -s "$PWD/$what$extension" /usr/bin/$what
echo "done."


what="acpi-hibernate"   
extension=.sh
#peut être extension vide

echo "Set executable..."
chmod +x $what$extension
#echo "lien symbolique vers usr bin"
sudo ln -s "$PWD/$what$extension" /usr/bin/$what
echo "done."
