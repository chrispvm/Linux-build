echo "Do you want to install the configs from this repo? It will overwrite the existing configs."
read response
if [ $response == "y" ]; then
	setconfs="y"
else
	if [ $response == "n" ]; then
		setconfs="n"
	else
		echo "response must be y or n. Aborting."
		exit
	fi
fi
echo "Starting installation."
bash ./installprograms.sh
if [ $setconfs == "y" ]; then
	bash ./installconfigs.sh
fi
bash ./pythonsetup/installpythonpackages.sh

sudo bash ./setdefaults.sh
#bash ./setup_eduroam_oxford.sh
