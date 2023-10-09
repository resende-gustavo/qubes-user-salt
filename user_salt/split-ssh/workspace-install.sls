{% from "/srv/user_salt/split-ssh/split-ssh-macros.jinja" import split_ssh_client %}
{% from "/srv/user_salt/split-ssh/split-ssh-macros.jinja" import split_ssh_dom0 %}
{% from "/srv/user_salt/split-ssh/split-ssh-macros.jinja" import split_ssh_template %}
{% from "/srv/user_salt/split-ssh/split-ssh-macros.jinja" import split_ssh_vault %}

{% if pillar['SPLIT_SSH'] == 'true' %}
{% if grains['id'] == 'dom0' %}

{{ split_ssh_dom0(pillar['WORKSPACE'],pillar['TEMPLATE'],pillar['KEYS_CLIENT']) }}

{% elif grains['id'] == pillar['WORKSPACE']+'-ssh-client-dvm' or grains['id'] == pillar['WORKSPACE']+'-keys-client-dvm'%}

{{ split_ssh_client(pillar['WORKSPACE']) }}

{% elif grains['id'] == pillar['TEMPLATE'] %}

{{ split_ssh_template() }}

{% elif grains['id'] == pillar['WORKSPACE']+'-ssh-vault' %}

{{ split_ssh_vault() }}

{% endif %}
{% endif %}
