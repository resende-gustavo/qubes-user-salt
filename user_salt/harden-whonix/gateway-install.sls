# Harden Malloc
# https://www.kicksecure.com/wiki/Hardened_Malloc
# http://www.w5j6stm77zs6652pgsij4awcjeel3eco7kvipheu6mtr623eyyehj4yd.onion/wiki/Hardened_Malloc

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

# Enable Seccomp and Connection Padding
# http://www.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/wiki/Whonix-Gateway_Security
/usr/local/etc/torrc.d/50_user.conf:
  file.managed:
    - user: root
    - mode: 644
    - makedirs: True
    - contents:
      - CONTROL_PORT_FILTER_PROXY_ENABLE=0
      - Sandbox 1
      - ConnectionPadding 1
      
# Seccomp fix
# http://forums.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/t/cannot-use-seccomp-in-sys-whonix-after-update/10267/2
seccomp-fix:
  cmd.run:
    - name: sed -i "/\ClientOnionAuthDir/d" /etc/torrc.d/65_gateway.conf
    - runas: root



# TODO: deactivate whonixcheck onion-grater

# prevent running apt and prevent polluting TransPort
# http://www.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/wiki/Systemcheck_Hardening

/etc/systemcheck.d/50_user.conf:
  file.managed:
    - user: root
    - mode: 644
    - makedirs: True
    - contents: 
      - systemcheck_skip_functions+=" check_control_port_filter_running "
      - systemcheck_skip_functions+=" check_operating_system "
      - SYSTEMCHECK_DISABLE_TRANS_PORT_TEST="1"

harden-whonix--stop-onion-grater:
  cmd.run:
    - name: service onion-grater stop
    - runas: root

harden-whonix--mask-onion-grater:
  cmd.run:
    - name: systemctl mask onion-grater
    - runas: root

# Deactive Onion-Grater in Firewall
# http://www.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/wiki/Whonix-Gateway_Security_Hardening

/usr/local/etc/whonix_firewall.d/50_user.conf:
  file.managed:
    - user: root
    - mode: 755
    - makedirs: True
    - contents:
      - CONTROL_PORT_FILTER_PROXY_ENABLE=0

harden-whonix--reload-firewall:
  cmd.run:
    - name: whonix_firewall



# systemcheck hardening
# http://www.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/wiki/Systemcheck_Hardening
mask-systemcheck:
   cmd.run:
     - name: systemctl mask systemcheck
     - runas: root

# Reduce Kernel Information Leaks
# http://www.dds6qkxpwdeubwucdiaord2xgbbeyds25rbsgr73tbfpqpt4a6vjwsyd.onion/wiki/Security-misc#Restrict_Hardware_Information_to_Root

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
    - order: last
    - name: systemctl enable permission-hardening.service
