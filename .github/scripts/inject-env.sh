#!/usr/bin/env bash

yq eval '
  .spec.template.spec.containers[0].env += [
    {"name": "DB_URL", "valueFrom": {"secretKeyRef": {"name": "proj-hugin-api", "key": "DB_URL"}}},
    {"name": "ACCESS_TOKEN", "valueFrom": {"secretKeyRef": {"name": "proj-hugin-api", "key": "ACCESS_TOKEN"}}},
    {"name": "REFRESH_TOKEN", "valueFrom": {"secretKeyRef": {"name": "proj-hugin-api", "key": "REFRESH_TOKEN"}}}
  ]
' -
