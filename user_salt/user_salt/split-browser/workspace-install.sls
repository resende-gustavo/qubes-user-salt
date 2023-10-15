{% from "/srv/user_salt/split-browser/split-browser-macros.jinja" import split_browser_dom0 %}
{% from "/srv/user_salt/qubes-contrib/split-browser.sls" import split_browser_package %}

{% if pillar['SPLIT_BROWSER'] == 'true' %}

{% if grains['id'] == 'dom0' %}

{{ split_browser_dom0(pillar['WORKSPACE']) }}

{% elif grains['id'] == pillar['default_template']+'-browser' or pillar['whonix_ws_template']+'-browser' %}

{{ split_browser_package() }}

{% endif %}

{% endif %}
