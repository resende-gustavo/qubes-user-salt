workspace-template--create-qube:
  qvm.clone:
    - name: {{ pillar['TEMPLATE'] }}-{{ pillar['WORKSPACE'] }}
    - source: {{ pillar['TEMPLATE'] }}
     
workspace-dvm--create-qube:
  qvm.vm:
    - name: {{ pillar['WORKSPACE'] }}-dvm
    - present:
      - template: {{ pillar['TEMPLATE'] }}-{{ pillar['WORKSPACE'] }}
      - label: red
    - prefs:
      - label: red
      - template_for_dispvms: True
        
workspace--create-qube:
  qvm.vm:
    - name: {{ pillar['WORKSPACE'] }}
    - present:
      - class: DispVM
      - template: {{ pillar['WORKSPACE'] }}-dvm
      - label: red
    - prefs:
      - label: red

workspace-data--create-qube:
  qvm.vm:
    - name: {{ pillar['WORKSPACE'] }}-data
    - present:
      - template: {{ pillar['default_template'] }}
      - label: red
    - prefs:
      - label: red
