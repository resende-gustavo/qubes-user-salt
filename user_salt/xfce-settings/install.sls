update-xfce-settings--create-script:
  file.managed:
    - source: salt://xfce-settings/update-xfce-settings.sh
    - name: /usr/bin/update-xfce-settings
    - mode: 755