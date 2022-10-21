# ---------------------------------------------------------------
# nsustain/flarum image is built using this Dockerfile.
# Dockerhub:
# https://hub.docker.com/repository/docker/nsustain/flarum
#
# Most of the times, we use this file with:
# Examples:
#   docker build -t nsustain/flarum:0.1 -5 nsustain/flarum:latest
# ---------------------------------------------------------------
FROM alpine:latest
LABEL version="0.1"
LABEL description="Flarum image customized for Nsustain.com"
LABEL org.opencontainers.image.authors="soobinrho@nsustain.com"

# WORKDIR /path/to/workdir
# ADD [--chown=<user>:<group>] [--checksum=<checksum>] <src>... <dest>

# RUN /bin/sh -c '<COMMANDS> \
#                 <COMMANDS>'

EXPOSE 80/tcp
EXPOSE 443/tcp



# Why do we use volumes instead of bind mounts?
# "While bind mounts are dependent on the directory structure and OS of
# the host machine, volumes are completely managed by Docker ...
# Volumes are easier to back up or migrate than bind mounts."
# By the way, you don't have to create a volume yourself.
# Docker creates a volume itself if the volume doesn't exist.
# Source:
#   https://docs.docker.com/storage/volumes/
#
# VOLUME ["/flarum/"]

# Unlike RUN, which runs commands at the build time,
# CMD is what the image runs when we use "docker run ..."
# The difference between CMD and ENTRYPOINT is that
# extra arguments at "docker run <HERE>" override CMD,
# while ENTRYPOINT is still preserved.
#
# CMD [ "sh", "-c", "echo Hello World" ]


# Difference between exec form and shell form:
# Exec form: ENTRYPOINT ["executable", "param1", "param2"]
# Shell form: ENTRYPOINT command param1 param2
# Exec form is preferred because shell form "will not receive Unix signals -
# so your executable will not receive a SIGTERM from docker stop <container>."
# Source:
#   https://docs.docker.com/engine/reference/builder
#
# ENTRYPOINT ["sh", "-c", "echo Hello World"]
