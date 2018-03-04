# Constant revolution
My shared SaltStack configuration for a secure and commercially cloudless home network.

## We assume the following
* Haphazard familiarity with networking protocols.
* There exists, real or virtual, a SaltStack master server.
* This is a home environment that consists of your "everyday devices," e.g. i386, x86_64, ARM, aka computers, running Android or debian-flavored linux.
** SaltStack also works on Windows and Mac devices, but this setup is personalized for Debian. Maybe Arch and Raspbian, down the line.

# Instructions
1. Clone this repo to your base file_roots or /srv/salt directory.
2. Here are my default file_roots:
    base:
      /srv/salt
      
# syncthing
Install Syncthing and sync indicated directories.

# syncthing.repo
Install Debian repo if needed to install Syncthing. Requires apt-transport-https. Broken, won't fix.
    
# References
1. Syncthing: https://syncthing.net/
2. Repository management: https://docs.saltstack.com/en/latest/ref/states/all/salt.states.pkgrepo.html
