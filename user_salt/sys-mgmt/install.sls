{% from "/srv/user_salt/sys-mgmt/mgmt-template.jinja" import mgmt_common %}
{% from "/srv/formulas/base/virtual-machines-formula/qvm/template.jinja" import load %}

{% load_yaml as defaults -%}
name: sys-mgmt
present:
  - class: DispVM
  - template: default-dvm
  - label: black
prefs:
  - autostart: false
  - label: black
  - netvm: none
features:
 - set:
   - servicevm: 1 
{%- endload %}
        
{{ load(defaults) }}
{{ mgmt_common(defaults.name) }}
