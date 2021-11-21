if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "programs-setup.sh must be run as root. Try sudo bash programs-setup.sh. Exiting."
    exit
fi
echo "==== Executing programs-setup.sh from $PWD"

#Setup
command_exists () { 
	type "$1" &> /dev/null ; 
}
startmessage()	 { 
	echo "==== Started installing $1" 
}
endmessage()	 { 
	echo "==== Finished installing $1" 
}
upgrade_aptget(){
	echo "=================================================="
	echo "==== Starting apt update/upgrade"
	echo "=================================================="
	apt update -y && apt upgrade -y
#	echo "==== Starting apt-get update/upgrade"
#	apt-get update -y && apt-get upgrade -y
	echo "=================================================="
	echo "==== Starting apt-get autoremove"
	apt-get autoremove -y
	echo "=================================================="
	echo "==== Finished apt-get update/upgrade & autoremove"
	echo "=================================================="
}
#install_with_wget() {  }
#set_default_application() {  }

#Start installing
cd /home/chris/Downloads
echo "==== Starting installation from $PWD"
# apt full-upgrade
# do-release-upgrade
upgrade_aptget

#Curl
startmessage "curl"
apt install curl -y
endmessage "curl"

#Chrome
startmessage "chrome"
if ! command_exists google-chrome
then
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	yes | dpkg -i google-chrome-stable_current_amd64.deb
	rm google-chrome-stable_current_amd64.deb
fi
endmessage "chrome"

#Gyazo
startmessage "gyazo"
apt install gdebi -y
if ! command_exists gyazo; then
	yes | curl -s https://packagecloud.io/install/repositories/gyazo/gyazo-for-linux/script.deb.sh | bash
	apt install gyazo -y
#	rm gyazo-for-linux
fi
endmessage "gyazo"

#Tilde
startmessage "tilde"
apt install tilde -y
endmessage "tilde"

# Git
startmessage "git"
apt install git
endmessage "git"


startmessage "github gcmcore"
if ! command_exists git-credential-manager-core ; then
	curl -sSL https://packages.microsoft.com/config/ubuntu/21.04/prod.list | tee /etc/apt/sources.list.d/microsoft-prod.list
	curl -sSL https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc
	sudo apt-get install gcmcore
	git-credential-manager-core configure
fi
endmessage "github gcmcore"

#Skype
startmessage "Skype"
if ! command_exists skypeforlinux
then
	wget https://go.skype.com/skypeforlinux-64.deb
	apt install ./skypeforlinux-64.deb -y
	rm skypeforlinux-64.deb
fi
endmessage "skype"


#Signal
startmessage "Signal"
if ! command_exists signal-desktop
then
	yes | snap install signal-desktop
#	# 1. Install our official public software signing key	
#	yes | wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
#	cat signal-desktop-keyring.gpg | tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
#
#	# 2. Add our repository to your list of repositories
#	echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
#  	tee -a /etc/apt/sources.list.d/signal-xenial.list
#
#	# 3. Update your package database and install signal
#	apt update && sudo apt install signal-desktop
fi
endmessage "Signal"

#vscode
startmessage "vscode"
if ! command_exists code; then
#	wget https://go.microsoft.com/fwlink/?LinkID=760868
#	apt install ./code_
	apt install software-properties-common apt-transport-https
	apt-mark auto software-properties-common apt-transport-https
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
	sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	apt install code
	rm packages.microsoft.gpg

fi
endmessage "vscode"

#expressvpn
startmessage "expressvpn"
if ! command_exists expressvpn ; then
	wget https://www.expressvpn.works/clients/linux/expressvpn_3.11.0.16-1_amd64.deb
	apt install ./expressvpn_3.11.0.16-1_amd64.deb -y
	printf "EF9QKZLL89HTGICMRVKVA43" | expressvpn activate
	#NEED TO FIX THE ABOVE, MAYBE USING EXPECT PACKAGE
	rm expressvpn_3.11.0.16-1_amd64.deb
fi
endmessage "expressvpn"


#exa
startmessage "exa"
if ! command_exists exa ; then
	wget http://archive.ubuntu.com/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb
	apt install ./exa_0.9.0-4_amd64.deb
	rm ./exa_0.9.0-4_amd64.deb
fi
endmessage "exa"

#pycharm
startmessage "pycharm"
if ! command_exists pycharm; then
	wget https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=linux&code=PCC
	tar –xvzf pycharm-community-2021.2.3.tar.gz
fi
endmessage "pycharm"

#Cisco Anyconnect
# Gave up on this because they use an indirect download link.
#startmessage "Cisco AnyConnect"
#if ! command_exists anyconnect ; then
#	wget https://register.it.ox.ac.uk/oxonly/downloads/vpn/linux/anyconnect/anyconnect-linux64-4.10.00093-predeploy-k9.tar.gz
#	tar -C /AnyConnectChris -zxvf anyconnect-linux64-4.10.00093-predeploy-k9.tar.gz
#	
#	rm anyconnect-linux64-4.10.00093-predeploy-k9.tar.gz
#fi
#endmessage "Cisco AnyConnect"


#Adding some aliases
string="if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi"


apt install qbittorrent -y
apt install vlc -y
apt install trash-cli -y
apt install htop -y
apt install vim -y
apt install neovim -y
apt install pcregrep -y
#apt-get install compiz compizconfig-settings-manager compiz-plugins
apt install texlive-full -y
apt install default-jre -y
apt install php7.4-cli -y
apt install nautilus-dropbox -y


#Shell Extensions:
apt install gnome-shell-extension-no-annoyance
gnome-extensions enable noannoyance@sindex.com

#snaps
yes | snap install pycharm-community --classic
yes | snap install gh

#cuda toolkit for pytorch with GPU:
apt install nvidia-cuda-toolkit -y
apt install nvtop -y


#Default filetypes
xdg-mime default vlc.desktop video/mkv

#Finished
upgrade_aptget
apt-get clean
