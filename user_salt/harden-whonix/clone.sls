{%- import "/srv/formulas/base/virtual-machines-formula/qvm/whonix.jinja" as whonix -%}

whonix-gateway-backup-template:
  qvm.clone:
     - name: backup-whonix-gateway-{{ whonix.whonix_version }}
     - source: whonix-gateway-{{ whonix.whonix_version }}

whonix-workstation-backup-template:
  qvm.clone:
     - name: backup-whonix-workstation-{{ whonix.whonix_version }}
     - source: whonix-workstation-{{ whonix.whonix_version }}
