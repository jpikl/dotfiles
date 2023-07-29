# shellcheck shell=bash

## Simplified yarn audit
alias yarnsa=$'yarn audit --json | jq \'select(.type == "auditAdvisory") | .data.advisory.module_name\' -r | sort -u'
