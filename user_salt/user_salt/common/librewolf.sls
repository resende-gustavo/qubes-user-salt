remove-firefox:
  pkg.removed:
    - pkgs:
      - firefox
    
add-librewolf-repo:
  cmd.run:
    - name: sudo dnf config-manager --add-repo https://rpm.librewolf.net/librewolf-repo.repo
    - runas: root
    
install-librewolf:
  pkg.installed:
    - pkgs:
      - librewolf
