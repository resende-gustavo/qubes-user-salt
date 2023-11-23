#!/usr/bin/bash

command -v ask_for_password >/dev/null || . /lib/dracut-crypt-lib.sh

PROMPT="Boot to RAM? (n)"
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

