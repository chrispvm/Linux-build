SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "SCRIPT_DIR in tools.sh: $SCRIPT_DIR"
command_exists () { 
        type "$1" &> /dev/null ; 
}
startmessage()   { 
        echo "==== Started installing $1" 
}
endmessage()     { 
        echo "==== Finished installing $1" 
}
upgrade_aptget(){
        echo "=================================================="
        echo "==== Starting apt update/upgrade"
        echo "=================================================="
        sudo apt update -y && sudo apt upgrade -y
        echo "=================================================="
        echo "==== Starting apt-get autoremove"
        sudo apt-get autoremove -y
        echo "=================================================="
        echo "==== Finished apt-get update/upgrade & autoremove"
        echo "=================================================="
}

cleancomments (){
        sed -e "s/\#[^\n]*//" -e "s/ //g" -e "/^$/d" $1
}
#command_to_each_line_in_file (){
#       
#}

appendifnotthere (){
	if ! pcregrep -qM "$1" $2; then
		printf  "$1" >> $2 
	fi
}
# started just doing this manually:
#installconfig() {
#	dir=$(dirname $1)
#	base=$(basename $1)
#	echo "copying $SCRIPT_DIR/configs/$base to $dir/$base"
#	cp -r $SCRIPT_DIR/configs/$base $dir/$base
#}
pullconfig() {
	dir=$(dirname $1)
	base=$(basename $1)
	cp -r $dir/$base $SCRIPT_DIR/configs/$base
}
aptinstallpackage() {
        startmessage $1
        sudo apt install $1
}

export -f command_exists startmessage endmessage upgrade_aptget cleancomments appendifnotthere pullconfig aptinstallpackage
