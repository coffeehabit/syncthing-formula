# Contents of /srv/pillar/users/init.sls:
# ----
#   users:
#     debbie: 1011
# ----

# Create default users
{% for user, uid in pillar.get('users', {}).items() %}
{{user}}:
  user.present:
    - uid: {{uid}}
      
{% endfor %}
