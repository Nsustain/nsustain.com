# ----------------------------------------------------------------
# This is a mariadb image with baked-in default env variables
# so that you can just run Nsustain with "docker compose up -d"
# without any extra configuration.
# Docker Hub:
#   https://hub.docker.com/repository/docker/nsustain/mariadb
#
# We mostly build this image with:
# Example:
#   docker build -t nsustain/mariadb:1.0 -t nsustain/mariadb:latest -f mariadb.Dockerfile .
#   sudo docker push nsustain/mariadb --all-tags
# ----------------------------------------------------------------
FROM mariadb:latest

# Again, these are randomized secrets just for
# development environments. In your production environments,
# you should never use these env variables.
ENV MARIADB_ROOT_PASSWORD="TTBXkgeu25GVyge8FQrZBPj7HYiuG9qCawRcff5ukP"
ENV MARIADB_DATABASE="flarum"
ENV MARIADB_USER="flarum"
ENV MARIADB_PASSWORD="qdKiSiEPxVuFggmN3s5B9ubno4h3QUy5f3S6EAZ9o9"
