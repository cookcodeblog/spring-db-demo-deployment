{{/*
Expand the name of the chart.
*/}}
{{- define "spring-db-demo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "spring-db-demo.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "spring-db-demo.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "spring-db-demo.labels" -}}
helm.sh/chart: {{ include "spring-db-demo.chart" . }}
{{ include "spring-db-demo.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "spring-db-demo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "spring-db-demo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "spring-db-demo.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "spring-db-demo.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
spring-db-demo app labels
*/}}
{{- define "spring-db-demo.app.labels" -}}
app: {{ include "spring-db-demo.name" . }}
app.kubernetes.io/component: {{ include "spring-db-demo.name" . }}
app.kubernetes.io/instance: {{ include "spring-db-demo.name" . }}
app.kubernetes.io/name: java
app.kubernetes.io/part-of: {{ include "spring-db-demo.name" . }}-app
app.openshift.io/runtime: java
app.openshift.io/runtime-version: openjdk-8-el7
{{- end }}


{{/*
spring-db-demo app labels
*/}}
{{- define "spring-db-demo.app.selectorLabels" -}}
app: {{ include "spring-db-demo.name" . }}
deploymentconfig: {{ include "spring-db-demo.name" . }}
{{- end }}


