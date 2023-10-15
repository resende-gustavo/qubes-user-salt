{% from "/srv/user_salt/split-gpg/split-gpg-macros.jinja" import split_gpg_server %}
{% from "/srv/user_salt/split-gpg/split-gpg-macros.jinja" import split_gpg_vault %}
{% from "/srv/user_salt/split-gpg/split-gpg-macros.jinja" import split_gpg_client %}

{% if grains['id'] == 'dom0' %}

{{ split_gpg_server('split',pillar['default_template'],'true','false') }}

{% elif grains['id'] =='split-keys-client-dvm' or grains['id'] == 'split-gpg-client-dvm' %}

{{ split_gpg_client('true') }}

{% elif grains['id'] == 'split-gpg-vault' %}

{{ split_gpg_vault() }}

{% endif %} 
