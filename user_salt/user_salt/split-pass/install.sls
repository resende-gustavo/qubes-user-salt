{% from "/srv/user_salt/split-pass/split-pass-macros.jinja" import split_pass_dom0 %}
{% from "/srv/user_salt/split-pass/split-pass-macros.jinja" import split_pass_template %}
{% from "/srv/user_salt/split-pass/split-pass-macros.jinja" import split_pass_client %}

{% if pillar['SPLIT_PASS'] == 'true' %}
{% if grains['id'] == 'dom0' %}

{{ split_pass_server('split-pass',pillar['default_template'],'false') }}

{% elif grains['id'] == pillar['default_template'] %}

{{ split_pass_template() }}

{% elif grains['id'] == 'split-pass' or grains['id'] == 'split-keys-client-dvm' %}

{{ split_pass_client('split-pass') }}

{% endif %}
{% endif %}
