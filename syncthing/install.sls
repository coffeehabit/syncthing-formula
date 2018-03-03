{% if grains['os'] = 'debian' %}
  include:
    repos.deb-syncthing
{% endif %}

syncthing:
  pkg.installed
