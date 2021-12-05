#if [[ $(/usr/bin/id -u) -ne 0 ]]; then
#    echo "$0 must be run as root. Try sudo bash $0. Exiting."
#    exit
#fi

sudo bash ./installprograms.sh
bash ./setupvscode.sh
sudo bash ./setdefaults.sh
#bash ./setup_eduroam_oxford.sh
sudo bash ./installbashrc.sh
sudo bash ./setsettings.sh
