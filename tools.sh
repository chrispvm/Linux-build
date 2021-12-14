#Setup
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
        apt update -y && apt upgrade -y
        echo "=================================================="
        echo "==== Starting apt-get autoremove"
        apt-get autoremove -y
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

