#!/usr/bin/env bash

. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/common.sh"

for setup_script in "$SETUP_DIR"/*.sh; do
  log_info "--------------------------------------------------------------------------------"
  log_info "# Executing setup $(basename "$setup_script")"
  log_info "--------------------------------------------------------------------------------"

  bash <<EOF
    . "$TEST_DIR/common.sh"
    export SETUP_SCRIPT=$(basename "$setup_script")
    export SETUP_ID="\${SETUP_SCRIPT%.*}"
    set -eu
    . "$setup_script"
EOF
done
