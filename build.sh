if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "setup.sh must be run as root. Try sudo bash setup.sh. Exiting."
    exit
fi
bash ./programs-install.sh
bash ./vscodesetup.sh
bash ./setdefaults.sh
#bash ./eduroam-oxford-setup.sh
bash ./setup_bashrc.sh
