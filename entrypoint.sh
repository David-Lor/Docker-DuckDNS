#!/bin/sh

# HTTPS API Reference: https://www.duckdns.org/spec.jsp

SLEEP_TIME=$(($FREQUENCY * 60))

TOKEN=$(cat /run/secrets/token || echo ${TOKEN})
test "${TOKEN}" || { echo "Token not defined!"; exit 1; }
test "${DOMAINS}" || { echo "Domain/s not defined!"; exit 1; }

while true; do
    RESPONSE=$(curl -s "https://www.duckdns.org/update?domains=${DOMAINS}&token=${TOKEN}")

    if [ "${RESPONSE}" = "OK" ]; then
        echo "Updated @ $(date)"
    else
        echo "Failed to update @ $(date)"
    fi

    sleep $SLEEP_TIME
done
