
qvm-clone-template:
  qvm.clone:
    - name: {{ pillar['debian_minimal_template'] }}-kali
    - source: {{ pillar['debian_minimal_template'] }}


resize-kali-template-root:
  cmd.run:
    - name: qvm-volume extend {{ pillar['debian_minimal_template'] }}-kali:root 60G
