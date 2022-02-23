#!/bin/bash
# @file install-node.sh
# @brief Install node and npm.
#
# @description The script installs link:https://nodejs.org/en[node] using link:https://github.com/nvm-sh/nvm[nvm (node version manager)].
#
# IMPORTANT: DON'T RUN THIS SCRIPT DIRECTLY - Script is invoked by Vagrant during link:https://www.vagrantup.com/docs/provisioning[provisioning].
#
# ==== Arguments
#
# The script does not accept any parameters.

(
  echo -e "$LOG_INFO Install node and npm"
  cd /home/vagrant || exit

  curl -sL https://deb.nodesource.com/setup_17.x | sudo -E bash -
  sudo apt-get install -y nodejs
  npm install -g npm@latest

  echo -e "$LOG_INFO node version = $(node --version)"
  echo -e "$LOG_INFO npm version = $(npm --version)"
  echo -e "$LOG_DONE Installed node and npm"
)
