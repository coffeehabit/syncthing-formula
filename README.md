# Constant revolution
My shared SaltStack configuration for a secure and commercially cloudless home network.

## Materials
* A SaltStack master server.
* https://docs.syncthing.net/rest/system-config-get.html
* This is a home environment that consists of your "everyday devices," e.g. i386, x86_64, ARM, aka computers, running Android or debian-flavored linux.
** SaltStack also works on Windows and Mac devices, but this setup is personalized for Debian. Maybe Arch and Raspbian, down the line.
      
# syncthing
Install Syncthing and sync indicated directories.

# syncthing.repo
Install Debian repo if needed to install Syncthing. Requires apt-transport-https. Broken, won't fix.
    
# References
1. Syncthing: https://syncthing.net/
2. Repository management: https://docs.saltstack.com/en/latest/ref/states/all/salt.states.pkgrepo.html
