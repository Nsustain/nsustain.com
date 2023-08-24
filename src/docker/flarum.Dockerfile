# -------------------------------------------------------------------
# nsustain/flarum image is built using this Dockerfile.
# Docker Hub:
#   https://hub.docker.com/repository/docker/nsustain/flarum
#
# Most of the times, we build this image with:
# Example:
#   docker build --no-cache -t nsustain/flarum:1.6.3 -t nsustain/flarum:latest -f flarum.Dockerfile .
#   docker scan nsustain/flarum:1.6.3 -f ./flarum.Dockerfile
#   docker scan nsustain/flarum:latest -f ./flarum.Dockerfile
#   sudo docker push nsustain/flarum:1.6.3
#   sudo docker push nsustain/flarum:latest
# -------------------------------------------------------------------
FROM alpine:latest

# "Users SHOULD use reverse-DNS notation to prevent labels from
# conflicting with those used by other software."
# Source:
#   https://docs.docker.com/compose/compose-file/#labels-1
LABEL com.nsustain.version="1.8.0"
LABEL com.nsustain.description="Nsustain.com"
LABEL com.nsustain.maintainer="Soobin Rho <soobinrho@nsustain.com>"

ENV FLARUM_VERSION="v1.8.0"

# We included randomized secrets here so that you can can run
# our image out of the box without any extra configuration.
# Use these env variables just for development environments.
# Never use these passwords in production environments.
ENV FLARUM_TITLE="Nsustain Development Server"
ENV FLARUM_DESCRIPTION="A forum created for the environment and sustainability."
ENV FLARUM_WELCOME_TITLE="🌳 For the environment and sustainability"
ENV FLARUM_WELCOME_MESSAGE="We are a group of dedicated volunteers who are committed to helping find solutions to problems related to environmental sustainability. With our skills and expertise, we are ready to assist and support any efforts to make a positive impact on the planet."
ENV FLARUM_ADMIN_PASS="369FQUv4eS"
ENV FLARUM_ADMIN_USER="nim3594"
ENV FLARUM_ADMIN_MAIL="dev@nsustain.com"

# Either http:// or https:// should exist.
# Otherwise, all forum internal links will behave unexpectedly.
ENV FORUM_URL="http://127.0.0.1"

# FORUM_URL (without http:// or https://) and (without www)
ENV FORUM_URL_BASE="127.0.0.1"

ENV DB_NAME="flarum"
ENV DB_USER="flarum"
ENV DB_PASS="qdKiSiEPxVuFggmN3s5B9ubno4h3QUy5f3S6EAZ9o9"

ENV DEBUG="false"
ENV DB_HOST="mariadb"
ENV DB_PORT="3306"
ENV DB_PREF="flarum_"

# Flarum installation.
# Source:
#   https://github.com/mondediefr/docker-flarum/blob/master/Dockerfile
RUN apk update \
 && apk upgrade --no-cache \
 && apk add --no-cache \
    bash \
    curl \
    certbot \
    certbot-nginx \
    git \
    nginx \
    icu-data-full \
    libcap \
    vim \
    php82 \
    php82-ctype \
    php82-curl \
    php82-dom \
    php82-exif \
    php82-fileinfo \
    php82-fpm \
    php82-gd \
    php82-gmp \
    php82-iconv \
    php82-intl \
    php82-mbstring \
    php82-mysqlnd \
    php82-opcache \
    php82-pecl-apcu \
    php82-openssl \
    php82-pdo \
    php82-pdo_mysql \
    php82-phar \
    php82-session \
    php82-tokenizer \
    php82-xmlwriter \
    php82-zip \
    php82-zlib \
    mysql-client \
    mariadb-client \
 && ln -s /usr/bin/php82 /usr/bin/php \
 && cd /tmp \
 && curl --progress-bar http://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && chmod +x /usr/local/bin/composer \
 && mkdir -p /var/www/html/flarum \
 && COMPOSER_CACHE_DIR="/tmp" composer create-project flarum/flarum:$VERSION /var/www/html/flarum

RUN composer clear-cache \
 && rm -rf /tmp/* \
 && rm -rf /etc/nginx/http.d/* \
 && setcap CAP_NET_BIND_SERVICE=+eip /usr/sbin/nginx \
 && chown -R nginx:nginx /var/www/html/flarum \
 && chown -R nginx:nginx /usr/lib/php82 \
 && chmod -R 775 /var/www/html/flarum \
 && chmod -R 775 /usr/lib/php82 \
 && apk add --update libintl \
 && apk add --virtual build_deps gettext \
 && cp /usr/bin/envsubst /usr/local/bin/envsubst \
 && apk del build_deps

 # It works well in Docker Compose up to this point.
 # However, it turns out that this code needs modification
 # when it's deployed to K8s. What happens is that when K8s volume
 # mounts with the hostPath mechanism, container's target location
 # is overwritten by the host's origin location.
 # Thus, this is the reason why we copy to slightly different directories here.
RUN mkdir -p /var/www/html/flarum.backup \
 && mkdir -p /etc/nginx.backup \
 && \cp -r /var/www/html/flarum/. /var/www/html/flarum.backup \
 && \cp -r /etc/nginx/. /etc/nginx.backup

HEALTHCHECK --interval=2m --timeout=2m CMD curl -f http://127.0.0.1/php-fpm-ping || exit 1

COPY ./copied-inside-container/flarumInstall.yaml /flarumInstall.yaml
COPY ./copied-inside-container/flarumEntryPoint /flarumEntryPoint
COPY ./copied-inside-container/config.php /config.php
COPY ./copied-inside-container/nginx.conf /etc/nginx.backup/nginx.conf
COPY ./copied-inside-container/www.conf /etc/php82/php-fpm.d/www.conf

# WORKDIR actually may change depending on the base image we use.
# Therefore, it's a good practice to always set WORKDIR explicitly.
WORKDIR /var/www/html/flarum

ENTRYPOINT ["/flarumEntryPoint"]

# -------------------------------------------------------------------
# Useful Dockerfile syntax
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