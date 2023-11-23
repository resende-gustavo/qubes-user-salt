add-repos:
  file.append:
    - name: /etc/pacman.conf
    - text: |
        [selinux]
        Server = https://github.com/archlinuxhardened/selinux/releases/download/ArchLinux-SELinux
        SigLevel = Never

update-repos:
  cmd.run:
    - name: pacman -Syy
    - runas: root

install-requiriments:
  pkg.installed:
    - pkgs:
      - git
      - make
      - gcc

