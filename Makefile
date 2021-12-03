.PHONY: run install pushbashrc pullbashrc

run: 
	@echo "To install this, command make install"

install: 
	@sudo bash setup.sh


#pushbashrc:
#	@sudo cp $(shell pwd)/cvm_bashrc.sh /home/chris/.cvm_bashrc.sh

#pullbashrc:
#	@sudo cp /home/chris/.cvm_bashrc.sh $(shell pwd)/cvm_bashrc.sh
#	echo $(shell pwd)/cvm_bashrc.sh


