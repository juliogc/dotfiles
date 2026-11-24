#!/usr/bin/env zsh

#! ▀█▀ ▀▀█ ░░▄▀ █▀▀ █▄░█ █░█
#! ░█░ ▄██ ▄▀░░ ██▄ █░▀█ ▀▄▀

# Opt out of T3 Code product analytics (PostHog at ingest.t3.codes) and relay
# client tracing. Local diagnostics (logs/*.trace.ndjson) keep working.
export T3CODE_TELEMETRY_ENABLED=false

# Turn off OpenTelemetry export entirely, including any OTLP endpoint set in
# T3 Code's observability settings.
export T3CODE_OTEL_SDK_DISABLED=true
