{% from "/srv/user_salt/split-email/split-email-macros.jinja" import split_email_dom0 %}
{% from "/srv/user_salt/split-email/split-email-macros.jinja" import split_email_reader_dvm %}
{% from "/srv/user_salt/split-email/split-email-macros.jinja" import split_email_receiver_dvm %}
{% from "/srv/user_salt/split-email/split-email-macros.jinja" import split_email_sender_dvm %}
{% from "/srv/user_salt/split-email/split-email-macros.jinja" import split_email_template %}

{% if grains['id'] == 'dom0' %}

{{ split_email_dom0('split',pillar['default_template']) }}

{% elif grains['id'] == pillar['WORKSPACE']+'mail-reader-dvm' %}

{{ split_email_reader_dvm('your_name','your_email','regards,','short_name','false','true') }}

{% elif grains['id'] == pillar['WORKSPACE']+'mail-receiver-dvm' %}

{{ split_email_receiver_dvm('imap_server','imap_port','your_email','password') }}

{% elif grains['id'] == pillar['WORKSPACE']+'mail-sender-dvm' %}

{{ split_email_sender_dvm('false','your_email','smtp_server','smtp_port','password','true') }}

{% elif grains['id'] == pillar['TEMPLATE']+'-mail'%}

{{ split_email_template('false','true') }}

{% endif %}

