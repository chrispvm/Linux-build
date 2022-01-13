#Call this script together with the containing path  and the folder 
# to be copied as argument: 
# Argument 1: The path of the folder to sync.
# It will move that folder to the git repo and then add a symlink on the 
# original location.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "removing copy of config $1 in this repo"
rm $SCRIPT_DIR/configs/$base && sed -i "s@$1@@" $SCRIPT_DIR/configlist.txt
