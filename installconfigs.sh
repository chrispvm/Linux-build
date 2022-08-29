SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ./tools.sh
#haven't tested yet that this works:
echo "============================================"
echo "===== Starting installconfigs.sh"
echo "============================================"
#cat $SCRIPT_DIR/configlist.txt | xargs -t -d '\n' -I% bash -c 'installconfig %'

homeusr=$HOME
echo "home user directory: $homeusr"

cp -r $SCRIPT_DIR/configs/bspwm $homeusr/.config/bspwm
cp -r $SCRIPT_DIR/configs/cvmrc $homeusr/.config/cvmrc
cp -r $SCRIPT_DIR/configs/sxhkd $homeusr/.config/sxhkd
cp -r $SCRIPT_DIR/configs/nvim $homeusr/.config/nvim



#appendifnotthere "export PATH=\"\$PATH:/$HOME/.local/bin\"" ~/.profile

#code --install-extension "asvetliakov.vscode-neovim"
#code --install-extension "autopep8"


echo "============================================"
echo "===== Finished installconfigs.sh"
echo "============================================"

