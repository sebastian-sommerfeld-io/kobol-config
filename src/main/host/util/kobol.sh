#!/bin/bash
# @file kobol.sh
# @brief Utility script for easieer use of the most frequent commands.
#
# @description The utility scripts provides short commands to run the most frequent commands to avoid navigating through
# the directory tree over and over again just to invoke a certain script.
#
# * ``kobol pegasus-up`` -> Run the startup script for Vagrantbox pegasus
# * ``kobol pegasus-ssh`` -> perform ``vagrant ssh`` on Vagrantbox pegasus
# * ``kobol pegasus-down`` -> Run the shutdown script for Vagrantbox pegasus
# * ``kobol pegasus-clean`` -> Run the cleanup script for Vagrantbox pegasus
#
# * Setup symlinks for Docker utils and wrapper scripts
#
# ==== Arguments
#
# The script does not accept any parameters.


PEGASUS="/home/sebastian/work/repos/sommerfeld.sebastian/kobol-configuration/src/main/vagrantboxes/pegasus"


# @description Print help information about this script. Used when script is called with ``-h``, ``--help`` or without
# any arguments.
function help() {
  echo -e "$LOG_INFO Usage: kobol COMMAND"
  echo -e "$LOG_INFO"
  echo -e "$LOG_INFO A utility script for easy access to commands and functions on machine 'kobol'"
  echo -e "$LOG_INFO"
  echo -e "$LOG_INFO Options:"
  echo -e "$LOG_INFO   -h, --help        show help"
  echo -e "$LOG_INFO"
  echo -e "$LOG_INFO Commands:"
  echo -e "$LOG_INFO   pegasus-up        Run the startup script for Vagrantbox pegasus"
  echo -e "$LOG_INFO   pegasus-ssh       ssh into Vagrantbox pegasus"
  echo -e "$LOG_INFO   pegasus-down      Run the shutdown script for Vagrantbox pegasus"
  echo -e "$LOG_INFO   pegasus-clean     Run the cleanup script for Vagrantbox pegasus"
}


if [ -z "$1" ]; then
  help
elif [[ "$1" == "-h" ]]; then
  help
elif [[ "$1" == "--help" ]]; then
  help
elif [[ "$1" == "pegasus-up" ]]; then
  (
    cd "$PEGASUS" || exit
    bash ./start.sh
  )
elif [[ "$1" == "pegasus-ssh" ]]; then
  (
    cd "$PEGASUS" || exit
    vagrant ssh
  )
elif [[ "$1" == "pegasus-down" ]]; then
  (
    cd "$PEGASUS" || exit
    bash ./stop.sh
  )
elif [[ "$1" == "pegasus-clean" ]]; then
  (
    cd "$PEGASUS" || exit
    bash ./clean.sh
  )
fi
