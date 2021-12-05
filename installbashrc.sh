#!/bin/bash

echo "==================================================="

#COPY THE .cvm_bashrc.sh FILE TO HOME FOLDER
echo "Placing .cvm_bashrc.sh file in home folder"
cp $(pwd)/cvm_bashrc.sh /home/chris/.cvm_bashrc.sh


#ADD A CALL TO THE .cvm_bashrc.sh FILE TO THE .bashrc FILE
echo "Adding a call to the .cvm_bashrc.sh file to the .bashrc file"
stringsmall="source .cvm_bashrc.sh"
string="\n#CUSTOM BASHRC BY CVM\nsource .cvm_bashrc.sh\n"
if ! pcregrep -qM "$stringsmall" /home/chris/.bashrc; then
	printf  "$string" >> /home/chris/.bashrc
fi

