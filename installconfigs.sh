SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ./tools.sh
#haven't tested yet that this works:
echo "============================================"
echo "===== Starting installconfigs.sh"
echo "============================================"
#cat $SCRIPT_DIR/configlist.txt | xargs -t -d '\n' -I% bash -c 'installconfig %'

homeusr=$HOME
echo "home user directory: $homeusr"
echo "copying over config files"
cp -r $SCRIPT_DIR/configs/bspwm $homeusr/.config/bspwm
cp -r $SCRIPT_DIR/configs/cvmrc $homeusr/.config/cvmrc
cp -r $SCRIPT_DIR/configs/sxhkd $homeusr/.config/sxhkd
cp -r $SCRIPT_DIR/configs/nvim $homeusr/.config/nvim




#ADD A CALL TO THE .cvm_bashrc.sh FILE TO THE .bashrc FILE
echo "Adding a call to the .cvm_bashrc.sh file to the .bashrc file"
# I have stringsmall here because the \n causes problems with the conditional
stringsmall="source $HOME/.config/cvmrc/cvm_bashrc.sh"
string="\n#CUSTOM BASHRC BY CVM\nsource $HOME/.config/cvmrc/cvm_bashrc.sh\n"
if ! pcregrep -qM "$stringsmall" $HOME/.bashrc; then
        printf  "$string" >> $HOME/.bashrc
fi


sed -i "s@sourcedir\=WILLBEREPLACED@sourcedir\=$(pwd)@" $HOME/.config/cvmrc/.cvm_bashrc.sh



#appendifnotthere "export PATH=\"\$PATH:/$HOME/.local/bin\"" ~/.profile

#code --install-extension "asvetliakov.vscode-neovim"
#code --install-extension "autopep8"


echo "============================================"
echo "===== Finished installconfigs.sh"
echo "============================================"

