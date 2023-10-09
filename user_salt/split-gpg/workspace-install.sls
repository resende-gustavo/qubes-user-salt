{% from "/srv/user_salt/split-gpg/split-gpg-macros.jinja" import split_gpg_server %}
{% from "/srv/user_salt/split-gpg/split-gpg-macros.jinja" import split_gpg_vault %}
{% from "/srv/user_salt/split-gpg/split-gpg-macros.jinja" import split_gpg_client %}

{% if pillar['SPLIT_GPG'] == 'true' %}
{% if grains['id'] == 'dom0' %}

{{ split_gpg_server(pillar['WORKSPACE'],pillar['TEMPLATE'],pillar['THUNDERBIRD'],pillar['KEYS_CLIENT']) }}

{% elif grains['id'] == pillar['WORKSPACE']+'-keys-client-dvm' or grains['id'] == pillar['WORKSPACE']+'-gpg-client-dvm' %}

{{ split_gpg_client(pillar['THUNDERBIRD']) }}

{% elif grains['id'] == pillar['WORKSPACE']+'-gpg-vault' %}

{{ split_gpg_vault() }}

{% endif %}
{% endif %}
