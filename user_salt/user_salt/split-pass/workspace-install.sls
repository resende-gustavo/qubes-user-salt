{% from "/srv/user_salt/split-pass/split-pass-macros.jinja" import split_pass_dom0 %}
{% from "/srv/user_salt/split-pass/split-pass-macros.jinja" import split_pass_template %}
{% from "/srv/user_salt/split-pass/split-pass-macros.jinja" import split_pass_client %}

{% if pillar['SPLIT_PASS'] == 'true' %}
{% if grains['id'] == 'dom0' %}

{{ split_pass_dom0(pillar['WORKSPACE'],pillar['TEMPLATE'],pillar['KEYS_CLIENT']) }}

{% elif grains['id'] == pillar['TEMPLATE'] %}

{{ split_pass_template() }}

{% elif grains['id'] == pillar['WORKSPACE'] or grains['id'] == pillar['WORKSPACE']+'-keys-client-dvm' %}

{{ split_pass_client(pillar['WORKSPACE']) }}

{% endif %}
{% endif %}
