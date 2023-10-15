/var/lib/qubes/vm-kernels/mirage-firewall:
  file.directory:
    - mode: 755
    - makedirs: True

mirage_extracted:
  archive.extracted:
    - name: /var/lib/qubes/vm-kernels/
    - source: salt://mirage/mirage-firewall.tar.bz2
    - source_hash: 833cea063ab8fa87954c56e75e326f0d0ac9b9a2ee8e88a05e2a50af50666ef2
    - archive_format: tar
    - options: -j

sys-mirage-firewall-dvm:
  qvm.vm:
    - name: sys-mirage-firewall-dvm
    - present:
      - template: {{ pillar['default_template'] }}
      - label: green
    - prefs:
      - label: green
      - template_for_dispvms: True

sys-mirage-firewall:
  qvm.vm:
    - name: sys-mirage-firewall
    - present:
      - class: DispVM
      - template: sys-mirage-firewall-dvm
      - label: green
    - prefs:
      - kernel: mirage-firewall
      - kernelopts: ''
      - mem: 32
      - vcpus: 1
      - kernel: mirage-firewall
      - maxmem: 32
      - provides-network: True
      - netvm: sys-net
      - default_dispvm: ''
      - virt_mode: pvh

mirage-firewall-features:
  qvm.features:
    - name: sys-mirage-firewall
    - enable:
      - qubes-firewall
      - no-default-kernelopts
