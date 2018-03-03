# Contents of /srv/pillar/users/init.sls:
# ----
#   users:
#     jackie: 1011
# 
#   home_dirs:
#     Documents/Exports: jackie
#     Scripts/Bash/test: jackie
# ----

# Create default users
{% for user, uid in pillar.get('users', {}).items() %}
{{user}}:
  user.present:
    - uid: {{uid}}
    - optional_groups:
      - company_llc
      
{% endfor %}

# Create home directories
{% for dir, user in pillar.get('home_dirs', {}).items() %}
/home/{{user}}/{{dir}}:
  file.directory:
    - user: {{user}}
    - group: {{user}}
    - mode: 755
    - makedirs: True

{% endfor %}
