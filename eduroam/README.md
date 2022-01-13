The following worked when trying to install eduroam. I don't know how reproducible it is:

1. bash setupeduroam.sh
2. a window pops up. Use your "Remote Access Account" credentials
3. For some reason when I then connect to eduroam, I still get a popup asking for authorization. Do the following, which I got from this website: https://hdkb.clemson.edu/phpkb/article.php?id=137

IN THE WIRELESS SECURITY TAB THERE ARE MANY SETTINGS TO CONFIGURE          

  In the Security drop-down box select WPA & WPA2 Enterprise. 
  In the Authentication drop-down menu select PEAP. 
  Leave the Anonymous identity box empty
  Leave the PEAP version drop-down set to Automatic. 
  In the Inner authentication drop-down select MSCHAPv2. 
  Finally provide your username@clemson.edu and password. 
  Once you have finished click on Apply.       

The only thing I also had to do that wasn't listed there is to mark "no cat profile needed" or something like that.
