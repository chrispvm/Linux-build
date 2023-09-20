
# Shell extensions
gnome-extensions enable noannoyance@sindex.com

#dconf dump /org/gnome/desktop/wm/keybindings/ > dconf-keybindings.ini 
dconf load /org/gnome/desktop/wm/keybindings/ < dconf-settings.ini

git config --global user.email "c.vanmerwijk@gmail.com"
git config --global credential.helper store # This makes it so that my github password/authentication token gets automatically stored on the first login.


dropbox update
echo "y" | dropbox autostart
#dropbox start
