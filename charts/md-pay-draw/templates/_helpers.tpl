{{- define "md-pay-draw.namespace" -}}
{{- if .Values.namespace.create -}}
{{ include "common.name.value" . }}
{{- else -}}
{{ .Release.Namespace }}
{{- end }}
{{- end }}

{{- define "md-pay-draw.service.label" -}}
{{- if .Values.service.labels }}
{{- include "common.label.value" (dict "Values" .Values "Release" .Release "labels" .Values.service.labels) }}
{{- else }}
{{- include "md-pay-draw.label" (dict "Values" .Values "Release" .Release )}}
{{- end }}
{{- end }}

{{- define "md-pay-draw.label" -}}
{{- include "common.label.value" (dict "Values" .Values "Release" .Release "labels" .Values.labels) }}
{{- end }}

{{- define "md-pay-draw.label.immutable" -}}
{{- $resource := (lookup "apps/v1" "Deployment" .Release.Namespace (include "common.name.value" .)) }}
{{- if $resource }}
{{- $resource.spec.selector.matchLabels | toYaml }}
{{- else }}
{{- include "md-pay-draw.label" .}}
{{- end }}
{{- end }}
