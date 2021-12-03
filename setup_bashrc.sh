#!/bin/bash


#ADD A CALL TO THE .cvm_bashrc.sh FILE TO THE .bashrc FILE
stringsmall="source .cvm_bashrc.sh"
string="\n#CUSTOM BASHRC BY CVM\nsource .cvm_bashrc.sh\n"

if ! pcregrep -qM "$stringsmall" .bashrc; then
	printf  "$string" >> .bashrc
fi

#COPY THE .cvm_bashrc.sh FILE TO HOME FOLDER
cp $(shell pwd)/cvm_bashrc.sh /home/chris/.cvm_bashrc.sh

