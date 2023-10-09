{% from "/srv/user_salt/sys-corridor/corridor-macros.jinja" import dom0_corridor %}
{% from "/srv/user_salt/sys-corridor/corridor-macros.jinja" import template_corridor %}

{% if grains['id'] == 'dom0' %}

{{ dom0_corridor() }}

{% elif grains['id'] == pillar['kicksecure_template']+'-corridor' %}

{{ template_corridor() }}

{% endif %}
