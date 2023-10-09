# Harden Malloc
# https://www.kicksecure.com/wiki/Hardened_Malloc
# http://www.w5j6stm77zs6652pgsij4awcjeel3eco7kvipheu6mtr623eyyehj4yd.onion/wiki/Hardened_Malloc

/etc/ld.so.preload:
  file.managed:
    - user: root
    - mode: 640
    - makedirs: True
    - contents:
      - /usr/lib/libhardened_malloc.so/libhardened_malloc.so

harden-whonix--check-malloc:
  cmd.run:
    - name: hardened-malloc-enabled-test

# Deactive Onion-Grater in Firewall
# http://www.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/wiki/Whonix-Gateway_Security_Hardening

/usr/local/etc/whonix_firewall.d/50_user.conf:
  file.managed:
    - user: root
    - mode: 640
    - makedirs: True
    - contents:
      - CONTROL_PORT_FILTER_PROXY_ENABLE=0

harden-whonix--reload-firewall:
  cmd.run:
    - name: whonix_firewall

harden-whonix--mask-onion-grater:
  cmd.run:
    - name: systemctl mask onion-grater

# Deactivate whonixcheck onion-grater Running Test

/etc/systemcheck.d/50_user.conf:
  file.managed:
    - user: root
    - mode: 640
    - makedirs: True
    - contents:
      - whonixcheck_skip_functions+=" check_control_port_filter_running "

# Reduce Kernel Information Leaks
# https://www.kicksecure.com/wiki/Security-misc#Restrict_Hardware_Information_to_Root

harden-whonix--reduce-kernel-leaks:
  cmd.run:
    - name: systemctl enable hide-hardware-info.service

#
#/etc/hide-hardware-info.d/50_user.conf:
#  file.managed:
#    - user: root
#    - mode: 640
#    - makedirs: True
#    - contents:
#      - sysfs_whitelist=0
#

harden-whonix--hidepid:
  cmd.run:
    - name: systemctl enable proc-hidepid.service
    
harden-whonix--remount-secure:
  cmd.run:
    - name: touch /etc/noexec
