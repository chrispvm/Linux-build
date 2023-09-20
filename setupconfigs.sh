SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ./tools.sh
#haven't tested yet that this works:
cat $SCRIPT_DIR/configlist.txt | xargs -t -d '\n' -I% installconfig %

#appendifnotthere "export PATH=\"\$PATH:/$HOME/.local/bin\"" ~/.profile

code --install-extension "asvetliakov.vscode-neovim"
code --install-extension "autopep8"
code --install-extension "james-yu.latex-workshop"

# Shell extensions
gnome-extensions enable noannoyance@sindex.com

dconf load /org/gnome/desktop/wm/keybindings/ < ./configs/gnome/dconf-settings.ini

git config --global user.email "c.vanmerwijk@gmail.com"
git config --global credential.helper store # This makes it so that my github password/authentication token gets automatically stored on the first login.


dropbox update
echo "y" | dropbox autostart
#dropbox start

