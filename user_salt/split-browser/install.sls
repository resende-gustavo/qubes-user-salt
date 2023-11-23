{% from "/srv/user_salt/split-browser/split-browser-macros.jinja" import split_browser_dom0 %}
{% from "/srv/user_salt/qubes-contrib/split-browser.sls" import split_browser_package %}
{% from "/srv/user_salt/split-browser/split-browser-macros.jinja" import set_browser_firefox %}
{% from "/srv/user_salt/split-browser/split-browser-macros.jinja" import set_browser_mullvad %}

{% if grains['id'] == 'dom0' %}

{{ split_browser_dom0('split') }}

{% elif grains['id'] == pillar['default_template']+'-browser' %}

{{ split_browser_package() }}

{% elif grains['id'] == pillar['whonix_ws_template']+'-browser' %}

{{ split_browser_package() }}

{% elif grains['id'] == split-firefox-dvm %}

{{ set_browser_firefox() }}

{% elif grains['id'] == split-mullvad-dvm %}

{{ set_browser_mullvad() }}

{% endif %}
