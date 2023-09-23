SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ./tools.sh
#haven't tested yet that this works:
#cat $SCRIPT_DIR/configlist.txt | xargs -t -d '\n' -I% pullconfig %


homeusr=$HOME

cp -r $homeusr/.config/bspwm $SCRIPT_DIR/configs/
cp -r $homeusr/.config/cvmrc $SCRIPT_DIR/configs/ 
cp -r $homeusr/.config/sxhkd $SCRIPT_DIR/configs/
cp -r $homeusr/.config/nvim $SCRIPT_DIR/configs/

cp -r $homeusr/.config/Code/User/keybindings.json $SCRIPT_DIR/configs/vscode/
cp -r $homeusr/.config/Code/User/settings.json $SCRIPT_DIR/configs/vscode/


#capture gnome settings and shell extensions and keybindings and so on
#dconf dump / > ./conigs/dconf_settings.ini
dump_dconf org/gnome
#Below is when i did this manually for each thing
#dconf dump /org/gnome/desktop/wm/keybindings/ > ./configs/gnome/dconf-gnome-keybindings.ini
#dconf dump /org.gnome.shell.extensions.dash-to-panel/ > ./configs/gnome/dconf-dash-to-panel-settings.ini
#dump_dconf org.gnome.desktop.wm.keybindings
#dump_dconf org.gnome.shell.extensions.dash-to-panel

