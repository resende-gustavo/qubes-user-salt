openbsd-qube--create-qube:
  qvm.vm:
     - name: openbsd
     - present:
        - class: StandaloneVM
        - label: black
        - virt_mode: hvm
     - prefs:
        - label: black

openbsd-audio-model--set-feature:
  cmd.run:
    - name: qvm-features openbsd audio-model ac97
    
openbsd-stubdom--set-feature:
  cmd.run:
    - name: qvm-features openbsd stubdom-qrexec 1
    
openbsd-uefi--set-feature:
  cmd.run:
    - name: qvm-features openbsd uefi 1
    
openbsd-xml--create-config-file:
  file.managed:
    - name: /etc/qubes/templates/libvirt/xen/by-name/openbsd.xml
    - source: salt://openbsd/openbsd.xml
    - mode: 644
    - user: root
    - makedirs: True
