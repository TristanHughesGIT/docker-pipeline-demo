{{- define "bookstore-api.name" -}}
bookstore-api
{{- end }}

{{- define "bookstore-api.fullname" -}}
{{ include "bookstore-api.name" . }}-{{ .Release.Name }}
{{- end }}
