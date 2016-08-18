FROM abernix/meteord:base
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sh

# start docker listening on host docker sock
RUN docker daemon -H unix:///var/run/docker.sock