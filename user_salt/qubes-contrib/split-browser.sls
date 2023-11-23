{% macro split_browser_package() -%}
        
{% if grains['os'] == 'Fedora' %}

template-contrib--install-repo:
  pkg.installed:
     - order: 1
     - pkgs:
        - qubes-repo-contrib

template-contrib--enable-repo-contrib:
  cmd.run:
    - order: 2
    - name: dnf config-manager --set-enabled qubes-contrib-vm-r4.2-current-testing

{% elif grains['os'] == 'Debian' %}

apt-update:
  cmd.run:
    - order: 1
    - name apt update -y

template-contrib--enable-repo-contrib-debian:
  cmd.run:
    - order: 2
    - name: sed -i '6s/#//' /etc/apt/sources.list.d/qubes-contrib-r4.2.list

apt-update-repo:
  cmd.run:
    - order: 3
    - name apt update -y
    
template-contrib--install-repo:
  pkg.installed:
     - order: 4
     - pkgs:
        - qubes-repo-contrib

{% endif %}
        
template-contrib--install-packages:
  pkg.installed:
     - pkgs:
        - qubes-split-browser
        - qubes-split-browser-disp

create-mullvad-parameter:
  file.managed:
    - order: last
    - name: /etc/split-browser-disp/23-mullvad.bash.EXAMPLE
    - mode: 755
    - contents: |
        SB_FIREFOX_DIR=/home/user/.mb/mullvad-browser/Browser
        SB_FIREFOX=( ./start-mullvad-browser )

{%- endmacro %}
