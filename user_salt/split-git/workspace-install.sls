{% from "/srv/user_salt/split-git/split-git-macros.jinja" import split_git_dom0 %}
{% from "/srv/user_salt/qubes-contrib/split-git.jinja" import split_git_package %}

{% if pillar['SPLIT_GIT'] == 'true' %}

{% if grains['id'] == 'dom0' %}

{{ split_git_dom0(pillar['WORKSPACE'],pillar['TEMPLATE']) }}

{% elif grains['id'] == pillar['TEMPLATE']+'-git' %}

{{ split_git_package() }}

{% endif %}
{% endif %}
