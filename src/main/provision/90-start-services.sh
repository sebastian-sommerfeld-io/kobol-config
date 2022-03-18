#!/bin/bash
# @file 90-start-services.sh
# @brief Start all relevant services.
#
# @description The script starts all relevant services. By doing this the services can handle their restart policies
# on their own (at least for docker services).
#
# NOTE: This script only needs to run after initial setup. There is no need to run this script regularly.
#
# ==== Arguments
#
# The script does not accept any parameters.


(
  path="$HOME/work/repos/sebastian-sommerfeld-io/kobol-config/src/main/docker/services/ops"
  echo -e "$LOG_INFO Start containers from '$path'"
  cd "$path" || exit
  docker-compose up -d
)
