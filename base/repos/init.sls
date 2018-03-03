# Contents of /srv/pillar/repos/init.sls
# ----
# repos:
#   notesalexp: "deb http://notesalexp.org/debian/stretch/ stretch main"
# ----

{% for repo, reponame in pillar.get('repos', {}).items() %}
base:
  pkgrepo.managed:
   - name: {{reponame}}
   - gpgcheck: 1
   - require_in:
     - pkg: {{repo}}-keyring

  pkg.latest:
    - name: {{repo}}-keyring
    - refresh: True
    - skip_verify: True

{% endfor %}
