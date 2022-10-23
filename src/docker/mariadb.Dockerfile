# ----------------------------------------------------------------
# WHAT IS THIS FILE FOR?
# A mariadb image with baked-in default env variables
# so that you can just run Nsustain with "docker compose up -d"
# without any extra configuration.
#
# For how to run Nsustain, open "compose.yaml"
# ----------------------------------------------------------------
FROM mariadb:latest

# Again, these are randomized secrets just for
# development environments. In your production environments,
# you should never use these env variables.
ENV MARIADB_ROOT_PASSWORD="TTBXkgeu25GVyge8FQrZBPj7HYiuG9qCawRcff5ukP"
ENV MARIADB_DATABASE="flarum"
ENV MARIADB_USER="flarum"
ENV MARIADB_PASSWORD="qdKiSiEPxVuFggmN3s5B9ubno4h3QUy5f3S6EAZ9o9"

# There's no ENTRYPOINT defined here, so that we can use
# the default ENTRYPOINT defined in mariadb:latest.
