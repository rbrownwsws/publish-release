#!/usr/bin/env bash
set -euo pipefail

API_HEADERS=(
  --header "Accept: application/vnd.github+json"
  --header "Authorization: Bearer ${GITHUB_API_TOKEN}"
  --header "X-GitHub-Api-Version: 2026-03-10"
)

curl --silent --show-error --fail-with-body \
  --request PATCH \
  "${API_HEADERS[@]}" \
  --header "Content-Type: application/json" \
  --data '{"draft":false}' \
  "${GITHUB_API_URL}/repos/${GITHUB_REPOSITORY}/releases/${RELEASE_ID}" >/dev/null
