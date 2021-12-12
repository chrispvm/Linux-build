#!/bin/bash
homefolder=/home/chris
echo "==================================================="

#COPY THE .cvm_bashrc.sh FILE TO HOME FOLDER
echo "Placing .cvm_bashrc.sh and pythonpathsrc.sh file in home folder"
cp $(pwd)/cvm_bashrc.sh /home/chris/.cvm_bashrc.sh
cp $(pwd)/pythonpathsrc.sh /home/chris/.pythonpathsrc.sh

#ADD A CALL TO THE .cvm_bashrc.sh FILE TO THE .bashrc FILE
echo "Adding a call to the .cvm_bashrc.sh file to the .bashrc file"
stringsmall="source $homefolder/.cvm_bashrc.sh"
string="\n#CUSTOM BASHRC BY CVM\nsource $homefolder/.cvm_bashrc.sh\n"
if ! pcregrep -qM "$stringsmall" /home/chris/.bashrc; then
	printf  "$string" >> /home/chris/.bashrc
fi

