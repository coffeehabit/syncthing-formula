openvpn:
  pkg.installed
  
#Copy VPN profiles:
#  file.recurse

blueman-applet:
  pkg.installed

# SYNCTHING
include:
  repos.syncthing

syncthing:
  pkg.installed
