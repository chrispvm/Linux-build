source ./tools.sh
dir=$(pwd)
source ~/.bashrc

cleancomments $dir/pythonsetup/pythonpackages.txt | xargs -t -I% bash -c 'conda install % -y'

conda install pytorch torchvision torchaudio cudatoolkit=11.6 -c pytorch -c conda-forge

pip install virtualenv
