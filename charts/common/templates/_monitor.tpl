{{- define "common.monitor.datadog.labels" -}}
tags.datadoghq.com/env: {{ .environment }}
tags.datadoghq.com/service: {{ .service }}
tags.datadoghq.com/version: {{ .version }}
{{- end }}

{{- define "common.monitor.datadog.admission" -}}
admission.datadoghq.com/enabled: "true"
{{- end }}

{{- define "common.monitor.datadog.java.log" -}}
[{
  "source": "java",
  "service": "{{ .service }}",
  "log_processing_rules": [{
    "type": "multi_line",
    "name": "log_start_with_date",
    "pattern": "\\d{4}-\\d{2}-\\d{2}\\s\\d{2}:\\d{2}:\\d{2}\\.\\d{3}"
  }]
}]
{{- end }}