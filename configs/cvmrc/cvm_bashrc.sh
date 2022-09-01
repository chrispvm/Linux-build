#!/bin/bash

sourcedir=WILLBEREPLACED

function mynotebooks() {
	cd ~/Dropbox/programming/ML/cvmdl/notebooks
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

function openall(){
	ls -1 | while read myfile ; do xdg-open "$myfile" ; done
}


function cvmaddpackage () {
	sudo apt install $1 -y && echo "$1" >> $sourcedir/packages.txt
}
function cvmremovepackage () {
	sudo apt remove $1 -y
	sed -i "s/$1//" $sourcedir/packages.txt
}
function cvmaddalias () {
	echo "alias $1=$2" >> $sourcedir/cvm_bashrc.sh
}
function cvmgitpush () {
	dir=$(pwd)
	cd $sourcedir
	git add .
	git commit -m "autocommit"
	git push
	cd $dir
}

source $HOME/.config/cvmrc/pythonpathsrc.sh

alias open=xdg-open
alias nautilus="nautilus ."
alias vscode="code"
alias term="gnome-terminal"
alias python="python3"
alias ls="ls --color --group-directories-first"
#alias search="((xdg-open \"\$(fzf)\" & disown) >> /dev/null) & disown && exit"

function search(){
	file=$(fzf)
	xdg-open "$file" & disown
	#exit
}
