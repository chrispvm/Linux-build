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
echo "making ./configs dir. It's fine if the next line gives an error that it already exists:"
mkdir ./configs
mv $dir/$base $SCRIPT_DIR/configs/$base && bash $SCRIPT_DIR/symlinkconfig.sh $dir/$base && echo "$dir/$base" >> $SCRIPT_DIR/configlist.txt
