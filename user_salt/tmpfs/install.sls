enable-ephemeral-volatile:
  cmd.run:
    - name: qvm-pool set vm-pool -o ephemeral_volatile=true

tmpfs-qube.sh:
  file.managed:
    - name: /usr/bin/qvm-tmpfs
    - makedirs: True
    - mode: 755
    - contents: |
        #!/bin/bash
        sudo swapoff -a
        mkdir $HOME/tmp
        sudo mount -t tmpfs -o size=2G $1 $HOME/tmp/
        qvm-pool add -o revisions_to_keep=1 -o dir_path=$HOME/tmp/ tmpfs_pool file
        qvm-create $1 -P tmpfs_pool -t fedora-38-xfce -l red --property netvm=sys-whonix

rmtmpfs-qube.sh:
  file.managed:
    - name: /usr/bin/qvm-tmpfsrm
    - makedirs: True
    - mode: 755
    - contents: |
        #!/bin/bash
        qvm-kill $1
        qvm-remove -f $1
        qvm-pool rm tmpfs_pool
        sudo umount $1
        sudo rm -rf $HOME/tmp/
        sudo rm -rf /var/log/libvirt/libxl/$1.log
        sudo rm -rf /var/log/libvirt/libxl/$1.log
        sudo rm -rf /var/log/qubes/vm-$1.log
        sudo rm -rf /var/log/qubes/guid.$1.log
        sudo rm -rf /var/log/qubes/guid.$1.log.old
        sudo rm -rf /var/log/qubes/qrexec.$1.log
        sudo rm -rf /var/log/qubes/qubesdb.$1.log
        sudo rm -rf /var/log/qubesdb.$1.log
        sudo rm -rf /var/log/guid/$1.log
        sudo rm -rf /var/log/qrexec.$1.log
        sudo rm -rf /var/log/pacat.$1.log
        sudo rm -rf /var/log/xen/console/guest-$1.log
        
shadow-qube:
  file.managed:
    - name: /usr/bin/shadow-qube
    - source: salt://tmpfs/shadow-qube
    - mode: 755
    - user: root
  
watch:
  file.managed:
    - name: /usr/bin/watch
    - source: salt://tmpfs/watch
    - mode: 755
    - user: root
  
quick-shadow:
  file.managed:
    - name: /usr/bin/qshadow
    - source: salt://tmpfs/qshadow
    - mode: 755
    - user: root
    
cleanup-remnants:
  file.managed:
    - name: /usr/bin/cleanup-remnants
    - source: salt://tmpfs/cleanup-remnants
    - mode: 755
    - user: root
  
module-setup:
  file.managed:
    - name: /usr/lib/dracut/modules.d/01ramboot/module-setup.sh
    - source: salt://tmpfs/01ramboot/module-setup.sh
    - makedirs: True
    - mode: 755

pass:
  file.managed:
    - name: /usr/lib/dracut/modules.d/01ramboot/pass.sh
    - source: salt://tmpfs/01ramboot/pass.sh
    - makedirs: True
    - mode: 755

tmpfs:
  file.managed:
    - name: /usr/lib/dracut/modules.d/01ramboot/tmpfs.sh
    - source: salt://tmpfs/01ramboot/tmpfs.sh
    - makedirs: True
    - mode: 755

ramboot-conf:
  file.managed:
    - name: /etc/dracut.conf.d/ramboot.conf
    - source: salt://tmpfs/ramboot.conf
    - makedirs: True
    - mode: 644

qshadow-fedora-menu-entry:
  file.managed:
    - name: /usr/share/applications/qshadow-fedora.desktop
    - source: salt://tmpfs/qshadow-fedora.desktop

qshadow-reader-menu-entry:
  file.managed:
    - name: /usr/share/applications/qshadow-reader.desktop
    - source: salt://tmpfs/qshadow-reader.desktop
    
qshadow-kali-menu-entry:
  file.managed:
    - name: /usr/share/applications/qshadow-kali.desktop
    - source: salt://tmpfs/qshadow-kali.desktop
    
qshadow-whonix-menu-entry:
  file.managed:
    - name: /usr/share/applications/qshadow-tor.desktop
    - source: salt://tmpfs/qshadow-tor.desktop

stateless--update-dracut:
  cmd.run:
     - name: dracut --verbose --force
