{% from "/srv/user_salt/voip/voip-macros.jinja" import get_qip %}
{% from "/srv/user_salt/voip/voip-macros.jinja" import gateway %}
{% from "/srv/user_salt/voip/voip-macros.jinja" import workstation %}

{% if grains['id'] == 'dom0' %}

{{ get_qip() }}

{% elif grains['id'] == pillar['whonix_ws_template']+'-voip' %}

{{ gateway() }}

{% elif grains['id'] == pillar['whonix_gw_template']+'-voip' %}

{{ workstation() }}

{% endif %}
