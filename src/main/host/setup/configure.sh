#!/bin/bash
# @file configure.sh
# @brief Configure the physical workstation with name kobol.
#
# @description The scripts configure the physical workstation with name kobol.
#
# * Setup symlinks for Docker utils and wrapper scripts
#
# ==== Arguments
#
# The script does not accept any parameters.

echo -e "$LOG_INFO  ========== Variables ===================================================="
echo -e "$LOG_INFO  HOME  ..................  $HOME"
echo -e "$LOG_INFO  ========================================================================="

# @description Write an entry to /usr/bin for a given script to make it executable from everywhere. Permissions are set
# to ``+x`` as well.
#
# @arg $1 string Path to the actual script <mandatory>
# @arg $2 string Name of the executable (without /usr/bin) <mandatory>
function set_executable() {
  if [ -z "$1" ]
  then
    echo -e "$LOG_ERROR Param missing -> exit"
    exit 0
  fi

  if [ -z "$2" ]
  then
    echo -e "$LOG_ERROR Param missing -> exit"
    exit 0
  fi

  echo -e "$LOG_INFO Create symlink for /usr/bin/$2"
  sudo ln -s "$1" "/usr/bin/$2"
  chmod +x "/usr/bin/$2"
}

set_executable /home/sebastian/work/repos/sommerfeld.sebastian/kobol-configuration/src/main/host/util/kobol.sh kobol
