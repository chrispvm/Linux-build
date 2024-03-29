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
cp -r $SCRIPT_DIR/configs/bspwm $homeusr/.config/
cp -r $SCRIPT_DIR/configs/cvmrc $homeusr/.config/
cp -r $SCRIPT_DIR/configs/sxhkd $homeusr/.config/
cp -r $SCRIPT_DIR/configs/nvim $homeusr/.config/
cp -r $SCRIPT_DIR/configs/vscode/keybindings.json $homeusr/.config/Code/User/
cp -r $SCRIPT_DIR/configs/vscode/settings.json $homeusr/.config/Code/User/



#ADD A CALL TO THE .cvm_bashrc.sh FILE TO THE .bashrc FILE
echo "Adding a call to the .cvm_bashrc.sh file to the .bashrc file"
# I have stringsmall here because the \n causes problems with the conditional
stringsmall="source $HOME/.config/cvmrc/cvm_bashrc.sh"
string="\n#CUSTOM BASHRC BY CVM\nsource $HOME/.config/cvmrc/cvm_bashrc.sh\n"
if ! pcregrep -qM "$stringsmall" $HOME/.bashrc; then
        printf  "$string" >> $HOME/.bashrc
fi

touch $HOME/.bash_profile
stringsmall="~/.bashrc"
string="\n#CUSTOM BASHRC CALL BY CVM\nif [ -f ~/.bashrc ]; then\n      . ~/.bashrc\nfi"
if ! pcregrep -qM "$stringsmall" $HOME/.bash_profile; then
        printf  "$string" >> $HOME/.bash_profile
fi


sed -i "s@sourcedir\=WILLBEREPLACED@sourcedir\=$(pwd)@" $HOME/.config/cvmrc/cvm_bashrc.sh



#appendifnotthere "export PATH=\"\$PATH:/$HOME/.local/bin\"" ~/.profile

code --install-extension "asvetliakov.vscode-neovim"
code --install-extension "autopep8"
code --install-extension "james-yu.latex-workshop"
code --install-extension "DanielSanMedium.dscodegpt"

# install gnome settings and shell extensions and keybindings and so on:
#dconf load / < ./configs/dconf_settings.ini
load_dconf /org/gnome/
# stuff below is when I did this manually for each thing:
# Shell extensions
#gnome-extensions enable noannoyance@sindex.com
#gnome-extensions enable launch-new-instance@gnome-shell-extensions.gcampax.github.com
#gnome-extensions enable dash-to-panel@jderose9.github.com
#gnome-extensions enable drive-menu@gnome-shell-extensions.gcampax.github.com

#load_dconf org/gnome/desktop/wm/keybindings
#load_dconf org.gnome.shell.extensions.dash-to-panel


git config --global user.email "c.vanmerwijk@gmail.com"
git config --global credential.helper store # This makes it so that my github password/authentication token gets automatically stored on the first login.


dropbox update
echo "y" | dropbox autostart




echo "============================================"
echo "===== Finished installconfigs.sh"
echo "============================================"

