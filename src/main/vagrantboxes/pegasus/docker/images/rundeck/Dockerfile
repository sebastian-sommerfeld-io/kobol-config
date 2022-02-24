FROM rundeck/rundeck:3.4.10
LABEL maintainer="sebastian@sommerfeld.io"

COPY assets/inventory.yml /home/rundeck/inventory.yml

ENV SERVER_URL=http://localhost:7440 \
    RUNDECK_GRAILS_URL=http://localhost:7440 \
    RUNDECK_SERVER_ADDRESS=0.0.0.0
