#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

main() {
        curl \
                --silent \
                --header "PRIVATE-TOKEN: $GITLAB_SUDO_TOKEN" \
                "$GITLAB_BASE_URL/api/v4/projects/$1/variables" | \
                jq -c '.[] | select(.key | contains("'$2'"))' | jq -r .value
}

main "$1" "$2"

