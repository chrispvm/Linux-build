.PHONY: run install pullconfigs installbashrc

run: 
	@echo " make install: installs everyhing\n make installbashrc: only installs the bashrc config files\n make pullconfigs: pulls all the config files from this pc into the repo"

install: 
	@bash installall.sh

pullconfigs:
	@bash pullconfigs.sh

installconfigs:
	@bash installconfigs.sh




