SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ./tools.sh
#haven't tested yet that this works:
cat $SCRIPT_DIR/configlist.txt | xargs -t -d '\n' -I% installconfig %


exit

#appendifnotthere "export PATH=\"\$PATH:/$HOME/.local/bin\"" ~/.profile

code --install-extension "asvetliakov.vscode-neovim"
code --install-extension "autopep8"



