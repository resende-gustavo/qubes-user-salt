{% from "/srv/user_salt/split-git/split-git-macros.jinja" import split_git_dom0 %}
{% from "/srv/user_salt/qubes-contrib/split-git.jinja" import split_git_package %}

{% if grains['id'] == 'dom0' %}

{{ split_git_dom0('split',pillar['default_template']) }}

{% elif grains['id'] == pillar['default_template']+'-git' %}

{{ split_git_package() }}

{% endif %}
