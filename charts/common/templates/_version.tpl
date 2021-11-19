{{- define "common.version.inicial-replicas.annotation" -}}
conductor.com.br/initial-replicas: {{ .replicas | quote }}
{{- end }}

{{- define "common.version.inicial-replicas.deployment" -}}
{{- $resource := lookup "apps/v1" "Deployment" .namespace .name }}
{{- if and $resource }}
{{- get $resource.metadata.annotations "conductor.com.br/initial-replicas" | default "" }}
{{- else }}
{{- "" }}
{{- end }}
{{- end }}