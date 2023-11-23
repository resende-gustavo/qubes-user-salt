rc-local:
  file.append:
    - name: /rw/config/rc.local
    - mode: 755
    - contents: |
        test ! -d /home/user/QubesIncoming || find '/home/user/QubesIncoming/' -mindepth 1 -type d -exec rmdir '{}' \;