#!/bin/bash

function cvmsetup() {
	sudo bash /home/chris/Dropbox/Linux-setup/setup.sh
}

function mynotebooks() {
	cd ~
	cd Dropbox/programming/ML/PycharmProjects/CvmML/notebooks
	jupyter notebook
}

function resetwifi(){
	nmcli networking off
	nmcli networking on
}


function anyconnectgui(){
#	expressvpn disconnect
#	resetwifi
	/opt/cisco/anyconnect/bin/vpnui
}

function anyconnect(){
	printf 'bras4309@OX.AC.UK\nC0nsequences5!\ny' | /opt/cisco/anyconnect/bin/vpn -s connect vpn.ox.ac.uk
}

function exitanyc(){
	sudo pkill vpnui
	sudo pkill vpn
#	resetwifi
}

function vpn(){
#	pkill vpnui
#	reset_wifi
#	local PID=$!
#	echo "reset"
#	wait $PID
#	echo "waited"
	expressvpn connect
}

function exitvpn(){
	expressvpn disconnect
#	resetwifi
}

function cap () { tee /tmp/cvm_terminalout; }

function ret () { cat /tmp/cvm_terminalout; }

alias open=xdg-open
alias nautilus="nautilus ."
alias vscode="code"
alias term="gnome-terminal"
function openall(){
	ls -1 | while read myfile ; do xdg-open "$myfile" ; done
}

