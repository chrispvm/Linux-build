if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "setup.sh must be run as root. Try sudo bash setup.sh. Exiting."
    exit
fi
bash ./programs-setup.sh
cp /home/chris/.cvm_bashrc.sh /home/chris/Dropbox/Linux-setup/.cvm_bashrc.sh

nvim /usr/share/applications/defaults.list -c ":%s/org.gnome.Totem.desktop/vlc.desktop" -c ":wq"

#bash ./eduroam-oxford-setup.sh
