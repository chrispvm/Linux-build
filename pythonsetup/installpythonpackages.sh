source ./tools.sh
dir=$(pwd)
source ~/.bashrc

cleancomments $dir/pythonpackages.txt | xargs -t -I% conda install % -y



pip install virtualenv
