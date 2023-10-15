default-browser-vm:
  file.managed:
    - name: /usr/share/applications/browser_vm.desktop
    - mode: 644
    - user: root
    - order: first
    - contents: |
        [Desktop Entry]
        Encoding=UTF-8
        Name=BrowserVM
        Exec=qvm-open-in-dvm %u
        Terminal=false
        X-MultipleArgs=false
        Type=Application
        Categories=Network;WebBrowser;
        MimeType=x-scheme-handler/unknown;x-scheme-handler/about;text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;

default-browser:
  cmd.run:
    - name: xdg-settings set default-web-browser BrowserVM
    - order: last
