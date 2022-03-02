#!/bin/bash
# @file ssh-keys.sh
# @brief Provisioning script for Vagrantbox pegasus.
#
# @description The scripts create some ssh-keys to use with Vagrantbox ``pegasus`` and adds the key to the ssh agent.
# The other existing private keys are added as well (keys are copied into the Vagrantbox during provisioning).
#
# IMPORTANT: DON'T RUN THIS SCRIPT DIRECTLY - Script is invoked by Vagrant during link:https://www.vagrantup.com/docs/provisioning[provisioning].
#
# ==== Arguments
#
# The script does not accept any parameters.

DIR="/home/vagrant/.ssh"
KEY="id_rsa"

echo -e "$LOG_INFO Start the ssh-agent in background"
eval "$(ssh-agent -s)"

echo "[INFO] Create $DIR/$KEY"
ssh-keygen -t rsa -N "" -C "sebastian@sommerfeld.io" -f "$DIR/$KEY"

#chown vagrant:vagrant "$DIR/$KEY"
#chown vagrant:vagrant "$DIR/$KEY.pub"

echo -e "$LOG_INFO Add keys to the ssh-agent"
ssh-add "$DIR/$KEY"

for k in /home/vagrant/.ssh/*.key
do
  echo "[INFO] Add key: $k"
  ssh-add "$k"
done

echo "[DONE] Finished ssh key setup"
