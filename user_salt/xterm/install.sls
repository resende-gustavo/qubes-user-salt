{% if grains['id'] == 'debian' %}

xresources--install:
  file.append:
    - name: /etc/X11/Xresources/x11-common
    - text: |
        ! CGA colour palette
        
        !*color0:                       #000000
        !*color1:                       #AA0000
        !*color2:                       #00AA00
        !*color3:                       #AA5500
        !*color4:                       #0000AA
        !*color5:                       #AA00AA
        !*color6:                       #00AAAA
        !*color7:                       #AAAAAA
        !*color8:                       #555555
        !*color9:                       #FF5555
        !*color10:                      #55FF55
        !*color11:                      #FFFF55
        !*color12:                      #5555FF
        !*color13:                      #FF55FF
        !*color14:                      #55FFFF
        !*color15:                      #FFFFFF
        
        ! Qubes favourite tango palette (improved with cyan)
        
        #define TANGO_Butter1           #c4a000
        #define TANGO_Butter2           #edd400
        #define TANGO_Butter3           #fce94f
        #define TANGO_Orange1           #ce5c00
        #define TANGO_Orange2           #f57900
        #define TANGO_Orange3           #fcaf3e
        #define TANGO_Chocolate1        #8f5902
        #define TANGO_Chocolate2        #c17d11
        #define TANGO_Chocolate3        #e9b96e
        #define TANGO_Chameleon1        #4e9a06
        #define TANGO_Chameleon2        #73d216
        #define TANGO_Chameleon3        #8ae234
        #define TANGO_SkyBlue1          #204a87
        #define TANGO_SkyBlue2          #3465a4
        #define TANGO_SkyBlue3          #729fcf
        #define TANGO_Plum1             #5c3566
        #define TANGO_Plum2             #75507b
        #define TANGO_Plum3             #ad7fa8
        #define TANGO_ScarletRed1       #a40000
        #define TANGO_ScarletRed2       #cc0000
        #define TANGO_ScarletRed3       #ef2929
        #define TANGO_Aluminium1        #2e3436
        #define TANGO_Aluminium2        #555753
        #define TANGO_Aluminium3        #888a85
        #define TANGO_Aluminium4        #babdb6
        #define TANGO_Aluminium5        #d3d7cf
        #define TANGO_Aluminium6        #eeeeec
        
        *color0:  TANGO_Aluminium1
        *color1:  TANGO_ScarletRed2
        *color2:  TANGO_Chameleon1
        *color3:  TANGO_Chocolate2
        *color4:  TANGO_SkyBlue1
        *color5:  TANGO_Plum2
        *color6:  #06989a
        *color7:  TANGO_Aluminium4
        
        *color8:  TANGO_Aluminium3
        *color9:  TANGO_ScarletRed3
        *color10: TANGO_Chameleon3
        *color11: TANGO_Butter3
        *color12: TANGO_SkyBlue3
        *color13: TANGO_Plum3
        *color14: #34e2e2
        *color15: TANGO_Aluminium6
        
        *.foreground:   #E0E0E0
        *.background:   #000000
        *.cursorColor:  #E0E0E0
        
        xterm*faceName: Monospace:pixelsize=14:antialias=true
        xterm*cursorBlink:                true
        
        XTerm.vt100.locale: false
        XTerm.vt100.utf8: false
        *selectToClipboard: true
        
        !XTerm.vt100.scrollBar: false
        xterm*rightScrollBar: true


xterm.sh:
  file.managed:
    - name: /etc/X11/xinit/xinitrc.d/xterm.sh
    - source: salt://xterm/xterm-debian.sh
    - mode: 755

set-xterm-default:
  cmd.run:
    - name: sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/xterm 1
    - runas: root

create-xterm-symlink:
  file.managed:
    - name: /usr/share/applications/xterm.desktop
    - source: /usr/share/applications/debian-xterm.desktop

{% else %}

xresources--install:
  file.append:
    - name: /etc/X11/Xresources
    - text: |
        ! CGA colour palette
        
        !*color0:                       #000000
        !*color1:                       #AA0000
        !*color2:                       #00AA00
        !*color3:                       #AA5500
        !*color4:                       #0000AA
        !*color5:                       #AA00AA
        !*color6:                       #00AAAA
        !*color7:                       #AAAAAA
        !*color8:                       #555555
        !*color9:                       #FF5555
        !*color10:                      #55FF55
        !*color11:                      #FFFF55
        !*color12:                      #5555FF
        !*color13:                      #FF55FF
        !*color14:                      #55FFFF
        !*color15:                      #FFFFFF
        
        ! Qubes favourite tango palette (improved with cyan)
        
        #define TANGO_Butter1           #c4a000
        #define TANGO_Butter2           #edd400
        #define TANGO_Butter3           #fce94f
        #define TANGO_Orange1           #ce5c00
        #define TANGO_Orange2           #f57900
        #define TANGO_Orange3           #fcaf3e
        #define TANGO_Chocolate1        #8f5902
        #define TANGO_Chocolate2        #c17d11
        #define TANGO_Chocolate3        #e9b96e
        #define TANGO_Chameleon1        #4e9a06
        #define TANGO_Chameleon2        #73d216
        #define TANGO_Chameleon3        #8ae234
        #define TANGO_SkyBlue1          #204a87
        #define TANGO_SkyBlue2          #3465a4
        #define TANGO_SkyBlue3          #729fcf
        #define TANGO_Plum1             #5c3566
        #define TANGO_Plum2             #75507b
        #define TANGO_Plum3             #ad7fa8
        #define TANGO_ScarletRed1       #a40000
        #define TANGO_ScarletRed2       #cc0000
        #define TANGO_ScarletRed3       #ef2929
        #define TANGO_Aluminium1        #2e3436
        #define TANGO_Aluminium2        #555753
        #define TANGO_Aluminium3        #888a85
        #define TANGO_Aluminium4        #babdb6
        #define TANGO_Aluminium5        #d3d7cf
        #define TANGO_Aluminium6        #eeeeec
        
        *color0:  TANGO_Aluminium1
        *color1:  TANGO_ScarletRed2
        *color2:  TANGO_Chameleon1
        *color3:  TANGO_Chocolate2
        *color4:  TANGO_SkyBlue1
        *color5:  TANGO_Plum2
        *color6:  #06989a
        *color7:  TANGO_Aluminium4
        
        *color8:  TANGO_Aluminium3
        *color9:  TANGO_ScarletRed3
        *color10: TANGO_Chameleon3
        *color11: TANGO_Butter3
        *color12: TANGO_SkyBlue3
        *color13: TANGO_Plum3
        *color14: #34e2e2
        *color15: TANGO_Aluminium6
        
        *.foreground:   #E0E0E0
        *.background:   #000000
        *.cursorColor:  #E0E0E0
        
        xterm*faceName: Monospace:pixelsize=14:antialias=true
        xterm*cursorBlink:                true
        
        XTerm.vt100.locale: false
        XTerm.vt100.utf8: false
        *selectToClipboard: true
        
        !XTerm.vt100.scrollBar: false
        xterm*rightScrollBar: true


xterm.sh--crate-file:
  file.managed:
    - name: /etc/X11/xinit/xinitrc.d/xterm.sh
    - source: salt://xterm/xterm.sh
    - mode: 755

set-xterm-default:
  cmd.run:
    - name: sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/xterm 1
    - runas: root


{% endif %}
