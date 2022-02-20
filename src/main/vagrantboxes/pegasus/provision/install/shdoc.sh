#!/bin/bash
# @file shdoc.sh
# @brief Install shdoc, gawk and pandoc.
#
# @description The script installs link:https://github.com/reconquest/shdoc[shdoc] (Markdown docs generator for bash
# scripts), gawk (dependency) and Pandoc (Markdown to Asciidoc converter).
#
# IMPORTANT: DON'T RUN THIS SCRIPT DIRECTLY - Script is invoked by Vagrant during link:https://www.vagrantup.com/docs/provisioning[provisioning].
#
# ==== Arguments
#
# The script does not accept any parameters.


echo "[INFO] Install shdoc and dependencies"

sudo apt-get install -y gawk
sudo mkdir -p /opt/shdoc
(
  cd /opt/shdoc || exit
  sudo git clone --recursive https://github.com/reconquest/shdoc
  cd shdoc || exit
  sudo make install
)

echo "[INFO] Install pandoc"
sudo apt-get install -y pandoc

echo "[DONE] Installed shdoc"
