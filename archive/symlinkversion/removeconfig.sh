#Call this script together with the containing path  and the folder 
# to be copied as argument: 
# Argument 1: The path of the folder to sync.
# It will move that folder to the git repo and then add a symlink on the 
# original location.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

dir=$(dirname $1)
base=$(basename $1)
echo $dir
echo $base

rm $dir/$base
mv $SCRIPT_DIR/configs/$base $dir/$base 
sed -i "s@$dir/$base@@" $SCRIPT_DIR/configlist.txt
