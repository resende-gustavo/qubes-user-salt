{% from "/srv/user_salt/split-ssh/split-ssh-macros.jinja" import split_ssh_client %}
{% from "/srv/user_salt/split-ssh/split-ssh-macros.jinja" import split_ssh_dom0 %}
{% from "/srv/user_salt/split-ssh/split-ssh-macros.jinja" import split_ssh_template %}
{% from "/srv/user_salt/split-ssh/split-ssh-macros.jinja" import split_ssh_vault %}

{% if grains['id'] == 'dom0' %}

{{ split_ssh_dom0('split',pillar['default_template'],'false') }}

{% elif grains['id'] == 'split-ssh-client-dvm' or grains['id'] == 'split-keys-client-dvm'%}

{{ split_ssh_client('split') }}

{% elif grains['id'] == pillar['default_template'] %}

{{ split_ssh_template() }}

{% elif grains['id'] == 'split-ssh-vault' %}

{{ split_ssh_vault() }}

{% endif %}
