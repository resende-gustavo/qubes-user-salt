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

