
wget https://cat.eduroam.org/user/API.php?action=downloadInstaller&lang=en&device=linux&profile=1078 --referer=https://cat.eduroam.org/user/
 
chmod +x eduroam-linux-UoO-Oxford_Users.py
conda install distro -y
python eduroam-linux-UoO-Oxford_Users.py
