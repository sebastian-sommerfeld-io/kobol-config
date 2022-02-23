#!/bin/bash
# @file configure.sh
# @brief Provisioning script for Vagrantbox ``pegasus``.
#
# @description The scripts adds settings to the ``~/.bashrc`` file of the user "vagrant".
#
# * Update bash prompt
# * Write aliases to .bashrc file
# * Setup symlinks for Docker wrapper scripts
#
# IMPORTANT: DON'T RUN THIS SCRIPT DIRECTLY - Script is invoked by Vagrant during link:https://www.vagrantup.com/docs/provisioning[provisioning].
#
# ==== Arguments
#
# The script does not accept any parameters.

export home="/home/vagrant"

echo "[INFO]  ========== Variables ===================================================="
echo "[INFO]  HOME  ..................  $HOME"
echo "[INFO]  home variable  .........  $home"
echo "[INFO]  ========================================================================="

# Update bash prompt
bashrc="$home/.bashrc"
promptDefinition="\${debian_chroot:+(\$debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
grep -qxF "export PS1='${promptDefinition}'" "$bashrc" || echo "export PS1='${promptDefinition}'" >>"$bashrc"
echo "[DONE] Changed prompt"

# Write aliases to .bashrc file
aliases=(
  'alias ll="ls -alFh --color=auto"'
  'alias ls="ls -a --color=auto"'
  'alias grep="grep --color=auto"'
  "cheatsheet() { clear && curl \"cheat.sh/\$1\" ; }"
  'alias pull-all-repos="git all pull"'
  'export LOG_DONE="[\e[32mDONE\e[0m]"'
  'export LOG_ERROR="[\e[1;31mERROR\e[0m]"'
  'export LOG_INFO="[\e[34mINFO\e[0m]"'
  'export LOG_WARN="[\e[93mWARN\e[0m]"'
  'export Y="\e[93m" # yellow'
  'export P="\e[35m" # pink'
  'export D="\e[0m"  # default (= white)'
)
for alias in "${aliases[@]}"; do
  grep -qxF "$alias" "$bashrc" || echo "$alias" >> "$bashrc"
done
echo "[DONE] Added aliases to $home/.bashrc (if not existing)"

# Setup symlinks for Docker wrapper scripts
sudo ln -s /home/vagrant/work/repos/sommerfeld.sebastian/kobol-configuration/src/main/vagrantboxes/pegasus/provision/wrappers/groovy.sh /usr/bin/groovy
sudo ln -s /home/vagrant/work/repos/sommerfeld.sebastian/kobol-configuration/src/main/vagrantboxes/pegasus/provision/wrappers/hugo.sh /usr/bin/hugo
sudo ln -s /home/vagrant/work/repos/sommerfeld.sebastian/kobol-configuration/src/main/vagrantboxes/pegasus/provision/wrappers/mvn.sh /usr/bin/mvn
sudo ln -s /home/vagrant/work/repos/sommerfeld.sebastian/kobol-configuration/src/main/vagrantboxes/pegasus/provision/wrappers/python.sh /usr/bin/py
sudo ln -s /home/vagrant/work/repos/sommerfeld.sebastian/kobol-configuration/src/main/vagrantboxes/pegasus/provision/wrappers/shellcheck.sh /usr/bin/shellcheck
sudo ln -s /home/vagrant/work/repos/sommerfeld.sebastian/kobol-configuration/src/main/vagrantboxes/pegasus/provision/wrappers/yamllint.sh /usr/bin/yamllint
echo "[DONE] Symlink setup for Docker wrapper scripts"
