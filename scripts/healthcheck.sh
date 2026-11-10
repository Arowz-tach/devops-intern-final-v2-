#!/usr/bin/env bash
set -euo pipefail

URL="${1:-http://localhost:8080}"

status="$(curl --silent --output /dev/null --write-out '%{http_code}' --max-time 5 "$URL" || true)"

if [ "$status" = "200" ]; then
    echo "OK: $URL returned HTTP 200"
    exit 0
fi

if [ "$status" = "000" ] || [ -z "$status" ]; then
    echo "FAIL: could not connect to $URL" >&2
    exit 2
fi

echo "FAIL: $URL returned HTTP $status (expected 200)" >&2
exit 1
