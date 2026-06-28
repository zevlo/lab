{{- define "sidecar.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "sidecar.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "sidecar.labels" -}}
app.kubernetes.io/name: {{ include "sidecar.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "sidecar.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sidecar.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
