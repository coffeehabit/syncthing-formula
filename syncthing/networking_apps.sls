{% if grains['os'] = 'debian' %}
  include:
    repos.syncthing
{% endif %}

syncthing:
  pkg.installed
