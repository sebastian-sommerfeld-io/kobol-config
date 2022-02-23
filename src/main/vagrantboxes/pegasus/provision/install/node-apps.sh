#!/bin/bash
# @file node-apps.sh
# @brief Install node applications.
#
# @description The script installs applications for link:https://nodejs.org/en[node].
#
# * @antora/cli@2.3 @antora/site-generator-default@2.3
# * @bitwarden/cli
# * folderslint
# * gulp-cli
# * webserver
#
# IMPORTANT: DON'T RUN THIS SCRIPT DIRECTLY - Script is invoked by Vagrant during link:https://www.vagrantup.com/docs/provisioning[provisioning].
#
# ==== Arguments
#
# The script does not accept any parameters.


echo "[INFO] Install node apps"

npm install --global @antora/cli@2.3 @antora/site-generator-default@2.3
#npm install --global @bitwarden/cli
npm install --global folderslint
npm install --global gulp-cli
npm install --global webserver

echo "[DONE] Installed node apps"
