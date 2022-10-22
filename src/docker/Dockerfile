# -------------------------------------------------------------------
# nsustain/flarum image is built using this Dockerfile.
# Dockerhub:
# https://hub.docker.com/repository/docker/nsustain/flarum
#
# Most of the times, we use this file with:
# Examples:
#   docker build --no-cache -t nsustain/flarum:0.1 -t nsustain/flarum:latest .
# -------------------------------------------------------------------
FROM alpine:latest
LABEL version="0.1"
LABEL description="Nsustain.com"
LABEL org.opencontainers.image.authors="soobinrho@nsustain.com"
LABEL maintainer="Soobin Rho <soobinrho@nsustain.com>"

ENV FLARUM_VERSION="v1.5.0"

# Flarum installation.
# Source:
#   https://github.com/mondediefr/docker-flarum/blob/master/Dockerfile
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache \
    bash \
    curl \
    git \
    icu-data-full \
    libcap \
    nginx \
    php8 \
    php8-ctype \
    php8-curl \
    php8-dom \
    php8-exif \
    php8-fileinfo \
    php8-fpm \
    php8-gd \
    php8-gmp \
    php8-iconv \
    php8-intl \
    php8-mbstring \
    php8-mysqlnd \
    php8-opcache \
    php8-pecl-apcu \
    php8-openssl \
    php8-pdo \
    php8-pdo_mysql \
    php8-phar \
    php8-session \
    php8-tokenizer \
    php8-xmlwriter \
    php8-zip \
    php8-zlib \
    mariadb-client \
    su-exec \
    s6 \
 && cd /tmp \
 && curl --progress-bar http://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && chmod +x /usr/local/bin/composer \
 && mkdir -p /var/www/html/flarum \
 && COMPOSER_CACHE_DIR="/tmp" composer create-project flarum/flarum:$VERSION /var/www/html/flarum \
 && composer clear-cache \
 && rm -rf /tmp/* \
 && setcap CAP_NET_BIND_SERVICE=+eip /usr/sbin/nginx \
 && chown -R nginx:nginx /var/www/html/flarum \
 && chmod -R 775 /var/www/html/flarum

COPY ./flarumInstall.yaml /flarumInstall.yaml
COPY ./flarumEntryPoint /flarumEntryPoint

# WORKDIR actually may change depending on the base image we use.
# Therefore, it's a good practice to always set WORKDIR explicitly.
WORKDIR /var/www/html/flarum

ENTRYPOINT ["/flarumEntryPoint"]
# CMD ["tail", "-f", "/dev/null"]
# CMD ["sh"]

# -------------------------------------------------------------------
# Notes for future (Uncomment to use)
# -------------------------------------------------------------------

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

# ADD [--chown=<user>:<group>] [--checksum=<checksum>] <src>... <dest>

# Unlike RUN, which runs commands at the build time,
# CMD is what the image runs when we use "docker run ..."
# The difference between CMD and ENTRYPOINT is that
# extra arguments at "docker run <HERE>" override CMD,
# while ENTRYPOINT is still preserved.
#
# CMD [ "sh", "-c", "echo Hello World" ]


# "The best use for ENTRYPOINT is to set the image’s main command,
# allowing that image to be run as though it was that command
# (and then use CMD as the default flags)."
# Example:
#   ENTRYPOINT ["s3cmd"]
#   CMD ["--help"]
# Source:
#   https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
#
# Difference between exec form and shell form:
# Exec form: ENTRYPOINT ["executable", "param1", "param2"]
# Shell form: ENTRYPOINT command param1 param2
# Exec form is preferred because shell form "will not receive Unix signals -
# so your executable will not receive a SIGTERM from docker stop <container>."
# Source:
#   https://docs.docker.com/engine/reference/builder
#
# ENTRYPOINT ["sh", "-c", "echo Hello World"]
