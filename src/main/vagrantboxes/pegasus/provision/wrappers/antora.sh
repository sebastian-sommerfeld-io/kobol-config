#!/bin/bash
# @file antora.sh
# @brief Wrapper to use Antora from Docker container when using the default ``antora`` command.
#
# @description The script is a wrapper to use Antora from a Docker container when using the default ``antora`` command.
# The script delegates the all tasks to a container using image ``link:https://hub.docker.com/r/antora/antora[antora/antora]``.
#
# In order to use the ``antora`` command, the ``xref:src_main_vagrantboxes_pegasus_provision_configure.adoc[configure.sh]``
# script adds a symlink to access this script via ``/usr/bin/antora``.
#
# ==== Arguments
#
# * *$@* (array): Original arguments


echo -e "$LOG_INFO Using the wrapper for Antora inside Docker from this Vagrantbox"
echo -e "$LOG_INFO Working dir = $(pwd)"

MOUNT_POINT="/antora"
IMAGE="antora/antora"
TAG="latest"

docker run -it --rm -u "$(id -u)" \
  --volume "$(pwd):$MOUNT_POINT:Z" \
  --volume "$(pwd):$(pwd):Z" \
  --workdir "$(pwd)" \
  "$IMAGE:$TAG" "$@"
