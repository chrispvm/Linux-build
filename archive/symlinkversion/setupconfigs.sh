SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


source ./tools.sh
installconfig() {
	
}
#haven't tested yet that this works:
cat $SCRIPT_DIR/configlist.txt | xargs -t -d '\n' -I% $SCRIPT_DIR/symlinkconfig.sh %


exit


# Add a symlink in the vscode folder to my settings.json file
mkdir $HOME/.config/Code/User/
rm $HOME/.config/Code/User/settings.json 
rm $HOME/.config/Code/User/keybindings.json
ln -s $SCRIPT_DIR/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
ln -s $SCRIPT_DIR/vscode/settings.json $HOME/.config/Code/User/settings.json

# Remove the existing ~/.config folder if it exists, then add a symlink to the repo config folder.
rm $HOME/.config
rm -r $HOME/.config/
ln -s $SCRIPT_DIR/config $HOME/.config

#appendifnotthere "export PATH=\"\$PATH:/$HOME/.local/bin\"" ~/.profile

code --install-extension "asvetliakov.vscode-neovim"
code --install-extension "autopep8"



