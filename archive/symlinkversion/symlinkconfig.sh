SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


dir=$(dirname $1)
base=$(basename $1)

echo "executing symlinkconfig on $dir/$base"

#this needs to be first, so that if it is a symlink the next command doesn't delete the source dir
echo "removing file. It's fine if the next line says that it doesn't exist, or that it's a directory"
rm $dir/$base
echo "removing directory. It's fine if the next line says that it doesn't exist."
rm -r $dir/$base/
ln -s $SCRIPT_DIR/configs/$base $dir/$base 

