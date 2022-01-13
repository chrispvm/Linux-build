#This file doesn't work yet.

#wget https://cat.eduroam.org/user/API.php?action=downloadInstaller&lang=en&device=linux&profile=1078 --referer=https://cat.eduroam.org/user/
 
chmod +x ./thirdparty/eduroam-linux-UoO-Oxford_Users.py
yes | pip install distro
python ./thirdparty/eduroam-linux-UoO-Oxford_Users.py
