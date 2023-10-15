{% from "/srv/user_salt/kicksecure/kicksecure-macros.jinja" import kicksecure_dom0 %}
{% from "/srv/user_salt/kicksecure/kicksecure-macros.jinja" import kicksecure_template %}

{% if grains['id'] == 'dom0' %}

{{ kicksecure_dom0() }}

{% elif grains['id'] == 'kicksecure' %}

{{ kicksecure_template() }}

{% endif %}
