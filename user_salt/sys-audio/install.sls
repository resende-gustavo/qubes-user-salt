{% from "/srv/user_salt/sys-audio/audio-macros.jinja" import sys_audio_dom0 %}
{% from "/srv/user_salt/sys-audio/audio-macros.jinja" import sys_audio_template %}

{% if grains['id'] == 'dom0' %}

{{ sys_audio_dom0 }}

{% elif grains['id'] == pillar['default_template']+'-audio' %}

{{ sys_audio_template }}

{% endif %}
