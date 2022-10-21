# ---------------------------------------------------------------
# nsustain/flarum image is built using this Dockerfile.
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

# Unlike RUN, which runs commands at the build time,
# CMD is what the image runs when we use "docker run ..."
# The difference between CMD and ENTRYPOINT is that
# extra arguments at "docker run <HERE>" override CMD,
# while ENTRYPOINT is still preserved.
# CMD [ "sh", "-c", "echo Hello World" ]
