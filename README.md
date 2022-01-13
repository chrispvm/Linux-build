# Linux-Setup

## commands:

make install: installs everything

setupvscode.sh
* Installs a symlink at the correct location of vscode's settings.json file, to the settings.json file in this repo. 
* Installs my extensions.


At install, a symlink to the config folder will be added at ~/.config, so most config files are stored there.

Files:
config/cvm_bashrc.sh will be set up to be called by bashrc
config/pythonpathsrc.sh is called by cvm_bashrc.sh


##Adding configs
addconfig.sh /path/file movesan existing file/folder at /path/file to the repo, and then calls addsymlink.sh. Also adds /path/file to the list of synced config files at configlist.txt

addsymlink.sh /path/file adds a symlink to file at /path/file.

removeconfig.sh /path/file moves a synced folder back to where its symlink is, and removes it from configlist.txt.

setupconfigs.sh calls addsymlink.sh for each path in configlist.txt.:q
