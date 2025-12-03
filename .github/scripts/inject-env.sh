#!/usr/bin/env bash

# This script receives Helm rendered YAML from stdin and modifies it.

# Ensure yq is installed
if ! command -v yq &> /dev/null; then
  echo "❌ yq not installed"
  exit 1
fi

# Modify Deployment manifest ONLY
yq eval '
  (.kind == "Deployment") |
  .spec.template.spec.containers[0].env += [
    {"name": "DB_URL", "valueFrom": {"secretKeyRef": {"name": "proj-hugin-api", "key": "DB_URL"}}},
    {"name": "ACCESS_TOKEN", "valueFrom": {"secretKeyRef": {"name": "proj-hugin-api", "key": "ACCESS_TOKEN"}}},
    {"name": "REFRESH_TOKEN", "valueFrom": {"secretKeyRef": {"name": "proj-hugin-api", "key": "REFRESH_TOKEN"}}}
  ]
' -
