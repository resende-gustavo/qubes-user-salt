{% from "/srv/user_salt/split-email/split-email-macros.jinja" import split_email_dom0 %}
{% from "/srv/user_salt/split-email/split-email-macros.jinja" import split_email_reader_dvm %}
{% from "/srv/user_salt/split-email/split-email-macros.jinja" import split_email_receiver_dvm %}
{% from "/srv/user_salt/split-email/split-email-macros.jinja" import split_email_sender_dvm %}
{% from "/srv/user_salt/split-email/split-email-macros.jinja" import split_email_template %}

{% if pillar['SPLIT_EMAIL'] == 'true' %}

{% if grains['id'] == 'dom0' %}

{{ split_email_dom0(pillar['WORKSPACE'],pillar['TEMPLATE']) }}

{% elif grains['id'] == pillar['WORKSPACE']+'-mail-reader-dvm' %}

{{ split_email_reader_dvm(pillar['USERNAME'],pillar['EMAIL'],pillar['SIG_MESSAGE'],pillar['SHORT_NAME'],pillar['POSTFIX'],pillar['MSMTP']) }}

{% elif grains['id'] == pillar['WORKSPACE']+'-mail-receiver-dvm' %}

{{ split_email_receiver_dvm(pillar['IMAP'],pillar['IMAP_PORT'],pillar['EMAIL'],pillar['PASS']) }}

{% elif grains['id'] == pillar['WORKSPACE']+'-mail-sender-dvm' %}

{{ split_email_sender_dvm(pillar['POSTFIX'],pillar['EMAIL'],pillar['SMTP'],pillar['SMTP_PORT'],pillar['PASS'],pillar['MSMTP']) }}

{% elif grains['id'] == pillar['TEMPLATE']+'-email'%}

{{ split_email_template(pillar['POSTFIX'],pillar['MSMTP']) }}

{% endif %}

{% endif %}
