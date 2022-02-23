#!/bin/bash
# @file start.sh
# @brief Start Vagrantbox pegasus.
#
# @description When virtual machines are booted for the first time, VMs get provisioned.
#
# include::ROOT:partial$vagrantboxes/pegasus/services.adoc[]
#
# ==== Arguments
#
# The script does not accept any parameters.

#echo -e "$LOG_INFO Prepare .target directory for vagrantbox"
#mkdir .target

echo -e "$LOG_INFO Start Vagrant Boxes"
time vagrant up

echo -e "$LOG_DONE ------------------------------------------------------------------"
echo -e "$LOG_DONE All Vagrant Boxes up and running"
echo -e "$LOG_DONE ------------------------------------------------------------------"
