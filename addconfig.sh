#Call this script together with the containing path to be added 
# Argument 1: The path of the folder to sync.
# It will add that folder to the git repo 
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


echo "adding config at $1. Making ./configs folder if not exists."
mkdir -p ./configs
echo "copying file/dir and adding it to configlist.txt"
pullconfig $1 && echo "$1" >> $SCRIPT_DIR/configlist.txt
