#if [[ $(/usr/bin/id -u) -ne 0 ]]; then
#    echo "$0 must be run as root. Try sudo bash $0. Exiting."
#    exit
#fi
echo "==== Executing $0 from $PWD"

source ./tools.sh

#Start installing
dir=$PWD
cd /tmp 
echo "==== Starting installation from $PWD"
upgrade_aptget

#Curl (first, because needed to install rest)
sudo apt install curl -y

# Take the packages.txt file, remove all comments, spaces, and empty lines, 
# then pass each line via xargs to apt install.

echo "======================================================="
echo "==== Starting apt install packages"
echo "======================================================="
cleancomments $dir/packages.txt | xargs -I% bash -c 'aptinstallpackage % -y'
#cleancomments $dir/packages.txt | xargs -t -I% apt install % -y
#sed -e "s/\#[^\n]*//" -e "s/ //g" -e "/^$/d" $dir/packages.txt | xargs -t -I% apt install % -y
echo "======================================================="
echo "==== Finished apt install packages"
echo "==== Starting snap install packages"
echo "======================================================="
#snaps
yes | sudo snap install pycharm-community --classic
yes | sudo snap install gh
yes | sudo snap install signal-desktop



echo "======================================================="
echo "==== Finished snap install packages"
echo "==== Starting manually installing packages"
echo "======================================================="


#Chrome
startmessage "chrome"
if ! command_exists google-chrome
then
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	yes | sudo dpkg -i google-chrome-stable_current_amd64.deb
	rm google-chrome-stable_current_amd64.deb
fi
endmessage "chrome"

#Gyazo
startmessage "gyazo"
sudo apt install gdebi -y
if ! command_exists gyazo; then
	yes | curl -s https://packagecloud.io/install/repositories/gyazo/gyazo-for-linux/script.deb.sh | bash
	sudo apt install gyazo -y
#	rm gyazo-for-linux
fi
endmessage "gyazo"

# github
startmessage "github gcmcore"
#if ! command_exists git-credential-manager-core ; then
#	curl -sSL https://packages.microsoft.com/config/ubuntu/21.04/prod.list | tee /etc/apt/sources.list.d/microsoft-prod.list
#	curl -sSL https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc
#	sudo apt-get install gcmcore
#	git-credential-manager-core configure
#fi
# I havent tested the below yet, but above doesn't seem to work.
if ! command_exists git-credential-manager-core ; then
	wget "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.696/gcmcore-linux_amd64.2.0.696.deb" -O /tmp/gcmcore.deb
	sudo dpkg -i /tmp/gcmcore.deb
	git-credential-manager-core configure
fi
endmessage "github gcmcore"


#maybe I should delete this since I'm already doing snap install gh
startmessage "github cli"
if ! command_exists gh ; then
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
	sudo apt update
	sudo apt install gh
fi
endmessage "github cli"

#Skype
startmessage "Skype"
if ! command_exists skypeforlinux
then
	wget https://go.skype.com/skypeforlinux-64.deb
	sudo apt install ./skypeforlinux-64.deb -y
	rm skypeforlinux-64.deb
fi
endmessage "skype"


#Signal
#startmessage "Signal"
#if ! command_exists signal-desktop
#then
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
#fi
#endmessage "Signal"

#vscode
startmessage "vscode"
if ! command_exists code; then
	sudo apt install software-properties-common apt-transport-https -y
	sudo apt-mark auto software-properties-common apt-transport-https
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
	sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	sudo apt update
	echo "might get an error with this, I don't know why but it seems to still work"
	sudo apt install code
	rm packages.microsoft.gpg
fi
endmessage "vscode"

#expressvpn
startmessage "expressvpn"
if ! command_exists expressvpn ; then
	wget https://www.expressvpn.works/clients/linux/expressvpn_3.11.0.16-1_amd64.deb
	sudo apt install ./expressvpn_3.11.0.16-1_amd64.deb -y
	printf "EF9QKZLL89HTGICMRVKVA43" | expressvpn activate
	#NEED TO FIX THE ABOVE, MAYBE USING EXPECT PACKAGE
	rm expressvpn_3.11.0.16-1_amd64.deb
fi
endmessage "expressvpn"


#pycharm
# installing this with a snap now, below
#startmessage "pycharm"
#if ! command_exists pycharm-community; then
#	wget https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=linux&code=PCC
#	tar –xvzf pycharm-community-2021.2.3.tar.gz
#fi
#endmessage "pycharm"

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

startmessage "Nvidia Toolkit"
if ! command_exists nvcc; then
	wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
	sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
	wget https://developer.download.nvidia.com/compute/cuda/11.7.1/local_installers/cuda-repo-ubuntu2004-11-7-local_11.7.1-515.65.01-1_amd64.deb
	#sudo dpkg -i cuda-repo-ubuntu2004-11-7-local_11.7.1-515.65.01-1_amd64.deb
	#Haven't tested below yet, but is supposed to do same as line above but auto yes
	#expect -c "spawn sudo dpkg -i cuda-repo-ubuntu2004-11-7-local_11.7.1-515.65.01-1_amd64.deb; expect -exact \"Do you want to continue? \[Y/n\] \"; send -- \"y\""
	#actually will just use "yes" command:
	yes | sudo dpkg -i cuda-repo-ubuntu2004-11-7-local_11.7.1-515.65.01-1_amd64.deb
	sudo cp /var/cuda-repo-ubuntu2004-11-7-local/cuda-*-keyring.gpg /usr/share/keyrings/
	sudo apt-get update
	sudo apt-get -y install cuda
fi
sudo apt install nvidia-cuda-toolkit
sudo apt install nvtop

endmessage "Nvidia Toolkit"


startmessage "Anaconda"
if ! command_exists conda; then
	wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -O ./Anaconda.sh
	sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 -y
	sudo chmod +x ./Anaconda.sh
	cp $dir/expectscripts/AnacondaExpect.exp ./AnacondaExpect.exp
	expect AnacondaExpect.exp
	#./Anaconda.sh
	rm ./Anaconda.sh ./AnacondaExpect.exp
	conda update conda
	conda update anaconda
	conda update --all
fi
endmessage "Anaconda"
#Finished
upgrade_aptget
sudo apt-get clean

# go back to original directory
cd $dir
echo "currently in directory $PWD"


echo "======================================================="
echo "===== Finished installprograms.sh"
echo "======================================================="
