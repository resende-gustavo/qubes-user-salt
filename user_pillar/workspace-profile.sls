## WORKSPACE OPTIONS

WORKSPACE: 'NAME'
TEMPLATE: 'fedora-XX-xfce'
SPLIT_SSH: 'true'
SPLIT_GPG: 'true'
SPLIT_EMAIL: 'true'
SPLIT_BROWSER: 'true'
SPLIT_GIT: 'true'
THUNDERBIRD: 'true'  # Depends on SPLIT_GPG
KEYS_CLIENT: 'true'  # Depends on SPLIT_GPG and/or SPLIT_SSH

## USER CREDENTIALS

MSMTP: 'false'
POSTFIX: 'true'
USERNAME: 'yourname'
IMAP: 'imap.server.here'
IMAP_PORT: '993'
SMTP: 'smtp.server.here'
SMTP_PORT: '587'
EMAIL: 'user@mail.org'
PASS: 'p4ssw0rd'
SIG_MESSAGE: 'regards,'
SHORT_NAME: 'yourname'
