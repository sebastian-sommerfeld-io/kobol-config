FROM rundeck/rundeck:3.4.10
LABEL maintainer="sebastian@sommerfeld.io"

USER root
RUN apt-get update \
    && apt-get install -y git

USER "${uid}:${gid}"
ENV SERVER_URL=http://localhost:7440 \
    RUNDECK_GRAILS_URL=http://localhost:7440 \
    RUNDECK_SERVER_ADDRESS=0.0.0.0
