# Contents of /srv/pillar/users/init.sls:
# ----
#   users:
#     debbie: 1011
# 
#   home_dirs:
#     Documents/Certificates: debbie
#     Mobile/Certificates: debbie
# ----

include:
  - users

# Create home directories
{% for dir, user in pillar.get('home_dirs', {}).items() %}
/home/{{user}}/{{dir}}:
  file.directory:
    - user: {{user}}
    - group: {{user}}
    - mode: 755
    - makedirs: True

{% endfor %}
