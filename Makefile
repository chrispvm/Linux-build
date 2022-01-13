.PHONY: run install pullconfigs installbashrc

run: 
	@echo "To install this, command make install. This will overwrite all config paths added to this repo."

install: 
	@bash installall.sh

pullconfigs:
	@bash pullconfigs.sh

installbashrc:
	@bash installbashrc.sh




