{% from "/srv/user_salt/split-dmcrypt/split-dmcrypt-macros.jinja" import dmcrypt_dom0 %}
{% from "/srv/user_salt/split-dmcrypt/split-dmcrypt-macros.jinja" import dmcrypt_template %}

{% if grains['id'] == 'dom0' %}

{{ dmcrypt_dom0() }}

{% elif grains['id'] == pillar['default_template']+'-dmcrypt' %}

{{ dmcrypt_template() }}

{% endif %}
