{% if grains['id'] == pillar['whonix_ws_template']+'-browser' %}


harden-whonix--install-packages:
  pkg.installed:
    - pkgs:
      - sandbox-app-launcher

/etc/systemcheck.d/50_user.conf:
  file.managed:
    - user: root
    - mode: 644
    - makedirs: True
    - contents:
      - # systemcheck_skip_functions+=" check_tor_bootstrap "
      - systemcheck_skip_functions+=" check_operating_system "
      - SYSTEMCHECK_DISABLE_TRANS_PORT_TEST="1"

# Deactivate sdwdate Connectivity Test
#/usr/libexec/helper-scripts/te_pe_tb_check:
#  file.managed:
#    - user: root
#    - mode: 755
#    - makedirs: True
#    - contents: |
#        #!/bin/bash
#        exit 0

#edit-te_pe_tb_check:
#  cmd.run:
#    - name: sed -i "307,372 {s/^/#/}" /usr/libexec/helper-scripts/onion-time-pre-script
#    - runas: root
    
#exit-0-te_pe_tb_check:
#  cmd.run:
#    - name: sed -i "374s/exit_code=2/exit_code=0/" /usr/libexec/helper-scripts/onion-time-pre-script
#    - runas: root

# Tor Browser Updater
/etc/torbrowser.d/50_user.conf:
  file.managed:
    - user: root
    - mode: 755
    - makedirs: True
    - contents:
      - TB_NO_TOR_CON_CHECK="1"

/etc/sysctl.d/30_security-misc.conf:
  file.append:
    - text: |
        net.ipv4.tcp_sack=0
        net.ipv4.tcp_dsack=0
        net.ipv4.tcp_fack=0


mask-systemcheck:
   cmd.run:
     - name: systemctl mask systemcheck
     - runas: root

harden-whonix--reduce-kernel-leaks:
  cmd.run:
    - name: systemctl enable hide-hardware-info.service

harden-whonix--hidepid:
  cmd.run:
    - name: systemctl enable proc-hidepid.service
    
harden-whonix--remount-secure:
  cmd.run:
    - name: touch /etc/noexec

permission-hardening:
  cmd.run:
    - name: systemctl enable permission-hardening.service
    
wait-for-sdwdate:
  file.managed:
    - name: /etc/whonix_firewall.d/50_user.conf
    - user: root
    - mode: 644
    - makedirs: True
    - contents:
      - firewall_mode=

lock-root-account:
  cmd.run:
    - name: sudo passwd --lock root

{% else %}

# Harden Malloc
# https://www.kicksecure.com/wiki/Hardened_Malloc
# http://www.w5j6stm77zs6652pgsij4awcjeel3eco7kvipheu6mtr623eyyehj4yd.onion/wiki/Hardened_Malloc
# Breaks split-browser

/etc/ld.so.preload:
  file.managed:
    - user: root
    - mode: 755
    - makedirs: True
    - contents:
      - /usr/lib/libhardened_malloc.so/libhardened_malloc.so

harden-whonix--check-malloc:
  cmd.run:
    - name: hardened-malloc-enabled-test

# Install sandbox-app-launcher
# https://www.kicksecure.com/wiki/Sandbox-app-launcher
# http://www.w5j6stm77zs6652pgsij4awcjeel3eco7kvipheu6mtr623eyyehj4yd.onion/wiki/Sandbox-app-launcher
# Read the documentation in order to learn how to use sandbox-app-launcher.

harden-whonix--install-packages:
  pkg.installed:
    - pkgs:
      - sandbox-app-launcher

# Deactivate whonixcheck Tor Bootstrap Test
# http://www.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/wiki/Whonix-Gateway_Security_Hardening
# prevent polluting TransPort
# http://www.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/wiki/Systemcheck_Hardening

/etc/systemcheck.d/50_user.conf:
  file.managed:
    - user: root
    - mode: 644
    - makedirs: True
    - contents:
      - # systemcheck_skip_functions+=" check_tor_bootstrap "
      - systemcheck_skip_functions+=" check_operating_system "
      - SYSTEMCHECK_DISABLE_TRANS_PORT_TEST="1"

# Deactivate sdwdate Connectivity Test
#/usr/libexec/helper-scripts/te_pe_tb_check:
#  file.managed:
#    - user: root
#    - mode: 755
#    - makedirs: True
#    - contents: |
#        #!/bin/bash
#        exit 0

#edit-te_pe_tb_check:
#  cmd.run:
#    - name: sed -i "307,372 {s/^/#/}" /usr/libexec/helper-scripts/onion-time-pre-script
#    - runas: root
    
#exit-0-te_pe_tb_check:
#  cmd.run:
#    - name: sed -i "374s/exit_code=2/exit_code=0/" /usr/libexec/helper-scripts/onion-time-pre-script
#    - runas: root

# Tor Browser Updater
/etc/torbrowser.d/50_user.conf:
  file.managed:
    - user: root
    - mode: 755
    - makedirs: True
    - contents:
      - TB_NO_TOR_CON_CHECK="1"

# Disable TCP SACK
# http://www.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/wiki/Whonix-Workstation_Security_Hardening

/etc/sysctl.d/30_security-misc.conf:
  file.append:
    - text: |
        net.ipv4.tcp_sack=0
        net.ipv4.tcp_dsack=0
        net.ipv4.tcp_fack=0

# systemcheck hardening
# http://www.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/wiki/Systemcheck_Hardening
mask-systemcheck:
   cmd.run:
     - name: systemctl mask systemcheck
     - runas: root

# Reduce Kernel Information Leaks
# https://www.kicksecure.com/wiki/Security-misc#Restrict_Hardware_Information_to_Root

harden-whonix--reduce-kernel-leaks:
  cmd.run:
    - name: systemctl enable hide-hardware-info.service

harden-whonix--hidepid:
  cmd.run:
    - name: systemctl enable proc-hidepid.service
    
harden-whonix--remount-secure:
  cmd.run:
    - name: touch /etc/noexec

# enable permission hardening
# http://www.w5j6stm77zs6652pgsij4awcjeel3eco7kvipheu6mtr623eyyehj4yd.onion/wiki/SUID_Disabler_and_Permission_Hardener

permission-hardening:
  cmd.run:
    - name: systemctl enable permission-hardening.service
    
# block networking until sdwdate finishes
# http://www.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/wiki/Network_Time_Synchronization#qubes-whonix-sup-sup-
wait-for-sdwdate:
  file.managed:
    - name: /etc/whonix_firewall.d/50_user.conf
    - user: root
    - mode: 644
    - makedirs: True
    - contents:
      - firewall_mode=

# lock root
# http://www.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/wiki/Root#Disable_Root_Account
lock-root-account:
  cmd.run:
    - name: sudo passwd --lock root

{% endif %}
