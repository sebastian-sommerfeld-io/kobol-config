#!/bin/bash
# @file init.sh
# @brief Provisioning script for Vagrantbox ``pegasus``.
#
# @description The scripts initializes the docker container ``rundeck`` with projects and jobs.
#
# IMPORTANT: DON'T RUN THIS SCRIPT DIRECTLY - Script is invoked by Vagrant during link:https://www.vagrantup.com/docs/provisioning[provisioning].
#
# ==== Arguments
#
# The script does not accept any parameters.


IMAGE="pegasus/rundeck-cli"
TAG="latest"

RD_PROJECT="vagrantbox-pegasus"


echo "[INFO] Initialize Rundeck"
until curl --output /dev/null --silent --head --fail http://localhost:7440; do
  echo "[INFO] ...  waiting for rundeck  ..."
  sleep 10
done
echo "[INFO] Rundeck is up and running"


echo "[INFO] Create project $RD_PROJECT"
docker run --rm --network=host "$IMAGE:$TAG" rd projects create --project="$RD_PROJECT" -- \
   --project.description='Jobs and scheduled tasks for Vagrantbox pegasus' \
   --project.disable.executions='false' \
   --project.disable.schedule='false' \
   --project.execution.history.cleanup.batch='500' \
   --project.execution.history.cleanup.enabled='false' \
   --project.execution.history.cleanup.retention.days='60' \
   --project.execution.history.cleanup.retention.minimum='50' \
   --project.execution.history.cleanup.schedule='0 0 0 1/1 * ? *' \
   --project.jobs.gui.groupExpandLevel='1' \
   --project.label='Vagrantbox Pegasus' \
   --project.name="$RD_PROJECT" \
   --project.nodeCache.enabled='true' \
   --project.nodeCache.firstLoadSynch='true' \
   --project.output.allowUnsanitized='false' \
   --project.ssh-authentication='privateKey' \
   --project.ssh-command-timeout='0' \
   --project.ssh-connect-timeout='0' \
   --project.ssh-keypath='/home/rundeck/.ssh/id_rsa' \
   --resources.source.1.type='local' \
   --resources.source.2.config.file='/home/rundeck/inventory.yml' \
   --resources.source.2.config.format='resourceyaml' \
   --resources.source.2.config.generateFileAutomatically='true' \
   --resources.source.2.config.includeServerNode='true' \
   --resources.source.2.type='file' \
   --service.FileCopier.default.provider='jsch-scp' \
   --service.NodeExecutor.default.provider='jsch-ssh'


echo "[INFO] Upload ssh keys to Rundeck"
(
  cd /home/vagrant/.ssh || exit

  keys=(
    'id_rsa'
#   'gitlab.key'
  )

  for k in "${keys[@]}"; do
    docker run --rm --network=host \
      --volume "$(pwd):$(pwd)" \
      --workdir "$(pwd)" \
      "$IMAGE:$TAG" rd keys create --file "$k" --path "keys/rundeck/$k" --type privateKey
  done
)

echo "[INFO] Upload ssh keys to Rundeck"

echo "[DONE] Finished Rundeck initialization"
