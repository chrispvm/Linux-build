#!/bin/bash

echo "==================================================="
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# not currently using above but maybe should if absolute directory chagnes.

#I used to directly add links to cvm_bashrc.sh and pythonpaths.sh
##COPY THE .cvm_bashrc.sh FILE TO HOME FOLDER
#echo "Placing .cvm_bashrc.sh and pythonpathsrc.sh file in home folder"
##Add link to Linux-build folder on this computer to cvm_bashrc.sh
#cp $(pwd)/cvm_bashrc.sh $(pwd)/.cvm_bashrc.sh
#sed -i "s@sourcedir\=WILLBEREPLACED@sourcedir\=$(pwd)@" $(pwd)/.cvm_bashrc.sh
##Move the files.
#mv $(pwd)/.cvm_bashrc.sh $HOME/.cvm_bashrc.sh
#cp $(pwd)/pythonpathsrc.sh $HOME/.pythonpathsrc.sh


#ADD A CALL TO THE .cvm_bashrc.sh FILE TO THE .bashrc FILE
echo "Adding a call to the .cvm_bashrc.sh file to the .bashrc file"
# I have stringsmall here because the \n causes problems with the conditional
stringsmall="source $HOME/.config/cvmrc/cvm_bashrc.sh"
string="\n#CUSTOM BASHRC BY CVM\nsource $HOME/.config/cvmrc/cvm_bashrc.sh\n"
if ! pcregrep -qM "$stringsmall" $HOME/.bashrc; then
	printf  "$string" >> $HOME/.bashrc
fi

echo "$HOME"
