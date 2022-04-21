#!/bin/bash
#Simple installer
#install stuff
what=${PWD##*/}   
what=acpihibernate
extension=.sh
#peut être extension vide

echo "Set executable..."
chmod +x $what$extension
#echo "lien symbolique vers usr bin"
sudo ln -s "$PWD/$what$extension" /usr/bin/$what
echo "done."


what="acpihibernate"   
extension=.sh
#peut être extension vide

echo "Set executable..."
chmod +x $what$extension
#echo "lien symbolique vers usr bin"
sudo ln -s "$PWD/$what$extension" /usr/bin/$what
echo "done."
