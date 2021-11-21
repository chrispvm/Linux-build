run: 
	@echo "To install this, command make install"

install: 
	@sudo bash setup.sh


grabbashrc:
	@cp /home/chris/.cvm_bashrc.sh $(pwd)/.cvm_bashrc.sh


