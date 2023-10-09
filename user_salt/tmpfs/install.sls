enable-ephemeral-volatile:
  cmd.run:
    - name: qvm-pool set vm-pool -o ephemeral_volatile=true

tmpfs-qube.sh:
  file.managed:
    - name: /home/user/.local/bin/qvm-tmpfs
    - makedirs: True
    - mode: 755
    - user: user
    - contents: |
        #!/bin/bash
        sudo swapoff -a
        mkdir $HOME/tmp
        sudo mount -t tmpfs -o size=2G $1 $HOME/tmp/
        qvm-pool add -o revisions_to_keep=1 -o dir_path=$HOME/tmp/ tmpfs_pool file
        qvm-create $1 -P tmpfs_pool -t fedora-38-xfce -l red --property netvm=sys-whonix

rmtmpfs-qube.sh:
  file.managed:
    - name: /home/user/.local/bin/qvm-tmpfsrm
    - makedirs: True
    - mode: 755
    - user: user
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
        
/usr/lib/dracut/modules.d/01ramboot/module-setup.sh:
  file.managed:
     - makedirs: True
     - contents: |
         #!/usr/bin/bash

         check() {
             return 0
         }

         depends() {
             return 0
         }

         install() {
                 inst_simple "$moddir/tmpfs.sh" "/usr/bin/tmpfs"
                 inst_hook cleanup 00 "$moddir/pass.sh"
         }

/usr/lib/dracut/modules.d/01ramboot/pass.sh:
  file.managed:
     - makedirs: True
     - contents: |
         #!/usr/bin/bash
         
         command -v ask_for_password > /dev/null || . /lib/dracut-crypt-lib.sh

         PROMPT="Boot to RAM? [N]"
         CMD="/usr/bin/tmpfs"
         TRY="3"

         ask_for_password \
             --cmd "$CMD" \
             --prompt "$PROMPT" \
             --tries "$TRY" \
             --ply-cmd "$CMD" \
             --ply-prompt "$PROMPT" \
             --ply-tries "$TRY" \
             --tty-cmd "$CMD" \
             --tty-prompt "$PROMPT" \
             --tty-tries "$TRY" \
             --tty-echo-off 

/usr/lib/dracut/modules.d/01ramboot/tmpfs.sh:
  file.managed:
     - makedirs: True
     - contents: |
         #!/usr/bin/bash
         case "${line:-Nn}" in
                 [Yy]* )
                         mkdir /mnt
                         umount /sysroot
                         mount /dev/mapper/qubes_dom0-root /mnt
                         modprobe zram
                         echo 12G > /sys/block/zram0/disksize
                         /mnt/usr/sbin/mkfs.ext2 /dev/zram0
                         mount /dev/zram0 /sysroot
                         cp -a /mnt/* /sysroot
                         exit 0
                         ;;
                 [Nn]* )
                         exit 0
                         ;;
                 * )
                         exit 1
                         ;;
         esac

/etc/dracut.conf.d/ramboot.conf:
  file.managed:
     - makedirs: True
     - contents: |
         add_dracutmodules+=" ramboot "
         add_drivers+=" zram "

stateless--change-permissions:
  cmd.run:
     - name: chmod 755 /usr/lib/dracut/modules.d/01ramboot/tmpfs.sh /usr/lib/dracut/modules.d/01ramboot/module-setup.sh

stateless--update-dracut:
  cmd.run:
     - name: dracut --verbose --force
