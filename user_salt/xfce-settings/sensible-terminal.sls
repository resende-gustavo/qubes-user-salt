install-sensible-terminal:
  file.managed:
    - name: /usr/bin/qubes-sensible-terminal
    - source: salt://xfce-settings/qubes-sensible-terminal
    - mode: 755
