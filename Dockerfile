FROM abernix/meteord:base
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sed 's/lxc-docker/lxc-docker-1.10.3/' | sh

ENTRYPOINT /bin/sh

# start docker listening on host docker sock
CMD docker daemon -H unix:///var/run/docker.sock

ENTRYPOINT bash $METEORD_DIR/run_app.sh
