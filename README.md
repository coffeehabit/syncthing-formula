# saltstack
My shared SaltStack master branch.

Instructions:
1. Clone to your /srv/salt directory.
2. Here are my default file_roots:
    base:
      # Telemetry
      /srv/salt/base
    debug:
      # Diagnostics, don't keep on end station.
      /srv/salt/debug
    admin:
      # Admin station tools
      /srv/salt/admin
    
