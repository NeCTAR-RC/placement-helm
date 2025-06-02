{{- define "placement-conf" }}
[keystone_authtoken]

auth_type = password
service_token_roles_required = True
service_type = placement
project_domain_name = Default
user_domain_name = Default

project_name = {{ .Values.conf.keystone_authtoken.project_name }}
username = {{ .Values.conf.keystone_authtoken.username }}
auth_url = {{ .Values.conf.keystone_authtoken.auth_url }}
www_authenticate_uri = {{ .Values.conf.keystone_authtoken.auth_url }}

{{- if .Values.conf.keystone_authtoken.memcached_servers }}
memcached_servers = {{ join "," .Values.conf.keystone_authtoken.memcached_servers }}
{{- end }}

[oslo_policy]
policy_file = /etc/placement/policy.yaml

{{- end }}
