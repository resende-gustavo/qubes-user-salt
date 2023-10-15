mac-randomize:
  file.managed:
    - name: /etc/NetworkManager/conf.d/50-macrandomize.conf
    - user: root
    - contents: |
        [device]
        wifi.scan-rand-mac-address=yes
        [connection]
        wifi.cloned-mac-address=stable
        ethernet.cloned-mac-address=stable
        connection.stable-id=random
        ipv6.dhcp-duid=stable-uuid
        ipv6.ip6-privacy=2

mac-hide-hostname:
  file.managed:
    - name: /etc/NetworkManager/conf.d/50-hide-hostname.conf
    - user: root
    - contents: |
        [ipv4]
        dhcp-send-hostname=false
        [ipv6]
        dhcp-send-hostname=false
