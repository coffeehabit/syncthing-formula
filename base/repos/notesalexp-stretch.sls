base:
  pkgrepo.managed:
   - name: deb http://notesalexp.org/debian/stretch/ stretch main
   - gpgcheck: 1
   - require_in:
     - pkg: notesalexp-keyring

  pkg.latest:
    - name: notesalexp-keyring
    - refresh: True
    - skip_verify: True
