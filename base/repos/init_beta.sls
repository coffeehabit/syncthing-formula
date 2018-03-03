# Contents of /srv/pillar/repos/init.sls
# ----
# repos:
#   repo1:
#     humanname: 
#     name: "deb http://notesalexp.org/debian/stretch/ stretch main"
#     key_url: 
#   repo2:
#     humanname: deb-syncthing
#     name: "deb http://notesalexp.org/debian/stretch/ stretch main"
#     key_url: https://syncthing.net/release-key.txt
# ----

{% for repo, args in pillar.get('repos', {}).items() %}
base:
  pkgrepo.managed:
   - humanname: {{args.humanname}}
   - name: {{args.name}}
   - file: /etc/apt/sources.list
   - key_url: {{args.key_url}}
   - gpgcheck: 1
   - require_in:
     - pkg: {{args.humanname}}-keyring

  pkg.latest:
    - name: {{args.humanname}}-keyring
    - refresh: True
    - skip_verify: True

{% endfor %}
