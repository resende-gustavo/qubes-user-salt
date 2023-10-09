{% from "/srv/user_salt/qrsync/qrsync-template.jinja" import qrsync_setup %}
{% from "/srv/user_salt/qrsync/qrsync-template.jinja" import qrsync_policy %}
{% from "/srv/user_salt/qrsync/qrsync-template.jinja" import qrsync_template %}

{% if grains['id'] == 'dom0' %}

{{ qrsync_setup('qrsync-server','qrsync-client') }}
{{ qrsync_policy('qrsync-server','qrsync-client') }}

{% elif grains['id'] == pillar['default_template']+'-qrsync' %}

{{ qrsync_template() }}

{% endif %}
