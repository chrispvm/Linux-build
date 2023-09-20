.PHONY: run install pullconfigs installbashrc

run: 
	@echo " make install: installs everyhing\n make installconfigs: only installs the config files\n make pullconfigs: pulls all the config files from this pc into the repo"

install: 
	@bash installall.sh

pullconfigs.sh:
	@bash pullconfigs.sh

installconfigs.sh:
	@bash installconfigs.sh




