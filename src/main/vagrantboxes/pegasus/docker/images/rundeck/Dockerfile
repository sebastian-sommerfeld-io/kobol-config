FROM rundeck/rundeck:3.4.10
LABEL maintainer="sebastian@sommerfeld.io"

USER root
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y --update ppa:ansible/ansible \
    && apt-get install -y ansible

USER "${uid}:${gid}"

COPY assets/inventory.ini /home/rundeck/inventory.ini

ENV SERVER_URL=http://localhost:7440 \
    RUNDECK_GRAILS_URL=http://localhost:7440 \
    RUNDECK_SERVER_ADDRESS=0.0.0.0 \
    RUNDECK_STORAGE_PROVIDER=file \
    RUNDECK_PROJECT_STORAGE_TYPE=file
