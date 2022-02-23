#!/bin/bash
# @file rundeck-cli.sh
# @brief Install rundeck-cli.
#
# @description The script installs link:https://docs.rundeck.com/docs/learning/howto/learn-rd-cli.html[rundeck-cli]. The
# installation targets the rundeck container, which is started by default in Vagrantbox ``pegasus``.
#
# IMPORTANT: DON'T RUN THIS SCRIPT DIRECTLY - Script is invoked by Vagrant during link:https://www.vagrantup.com/docs/provisioning[provisioning].
#
# ==== Arguments
#
# The script does not accept any parameters.


echo "[INFO] Install rundeck-cli"
curl -s https://packagecloud.io/install/repositories/pagerduty/rundeck/script.deb.sh | os=any dist=any bash
sudo apt-get install -y rundeck-cli
echo -e "rd version = $(rd version)"

echo "[INFO] Configure environment variables"
echo "export RD_URL=http://rundeck:7440" > /home/vagrant/.rd/rd.conf
RD_CONF="export RD_CONF=/home/vagrant/.rd/rd.conf"
grep -qxF "$RD_CONF" /home/vagrant/.bashrc || echo "RD_CONF" >> /home/vagrant/.bashrc
echo "[DONE] Installed rundeck-cli"
