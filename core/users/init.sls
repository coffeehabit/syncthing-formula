{% for user, uid in pillar.get('users', {}).items() %}
{{user}}:
  user.present:
    - uid: {{uid}}
    - optional_groups:
      - company_llc
      
/home/{{user}}/DCIM:
  file.directory:
    - user: {{user}}
    - group: {{user}}
    - mode: 755
    - makedirs: True

{% endfor %}
