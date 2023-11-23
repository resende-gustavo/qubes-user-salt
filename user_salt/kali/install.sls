resize2fs /dev/xvda3:
  cmd.run:
    - runas: root

enable-current-testing:
  cmd.run:
    - name: sed -i 's/bookworm/trixie/g' /etc/apt/sources.list
  
uptodate:
  pkg.uptodate:
    - refresh: True
    - dist_upgrade: True

python3-apt:
  pkg.installed:
    - refresh: True

kali:
  file.managed:
    - name: /etc/apt/sources.list.d/kali.list
    - mode: 644
    - contents:
      - deb https://http.kali.org/kali kali-rolling main contrib non-free

create-keys:
  file.managed:
    - name: /home/user/keys/kali.asc
    - source: salt://kali/kali.asc
    - makedirs: true

import-keys:
  cmd.run:
    - name: gpg --import kali.asc
    - cwd: /home/user/keys/

upgrade_again:
  pkg.uptodate:
    - refresh: True
    - dist_upgrade: True

installed:
  pkg.installed:
    - pkgs:
      - qubes-core-agent-networking
      - kali-linux-default
      - kali-desktop-xfce
