#!/bin/bash
# @file run.sh
# @brief Run Conky instances on kobol laptop.
#
# @description The script starts all Conky instances on kobol laptop. Normally this script is triggered automatically
# when the machine started (the script is configured as a startup application by provisioning script).
#
# CAUTION: Run on host ``kobol`` only!
#
# ==== Arguments
#
# The script does not accept any parameters.


case $HOSTNAME in
  ("kobol") echo -e "$LOG_INFO Run Conky on machine '$HOSTNAME'";;
  (*)       echo -e "$LOG_ERROR Script not running on expected machine!!! Run on 'kobol' only!!!" && exit;;
esac


echo -e "$LOG_INFO Copy launcher to autostart"
cp "assets/conky-launcher.desktop" "$HOME/.config/autostart/conky-launcher.desktop"

echo -e "$LOG_INFO Start all conky instances in background"
sleep 120 && conky -c "$HOME/work/repos/sebastian-sommerfeld-io/kobol-config/src/main/conky/.conkyrc" &
sleep 120 && conky -c "$HOME/work/repos/sebastian-sommerfeld-io/kobol-config/src/main/conky/.conkyrc_services" &
