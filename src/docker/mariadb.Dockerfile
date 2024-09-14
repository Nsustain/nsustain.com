# ----------------------------------------------------------------
# We mostly build this image with:
# Example:
#   docker build --no-cache -t nsustain/mariadb:1.0 -t nsustain/mariadb:latest -f mariadb.Dockerfile .
# ----------------------------------------------------------------
FROM mariadb:latest

# Again, these are randomized secrets just for
# development environments. In your production environments,
# you should never use these passwords.
ENV MARIADB_ROOT_PASSWORD="TTBXkgeu25GVyge8FQrZBPj7HYiuG9qCawRcff5ukP"
ENV MARIADB_DATABASE="flarum"
ENV MARIADB_USER="flarum"
ENV MARIADB_PASSWORD="qdKiSiEPxVuFggmN3s5B9ubno4h3QUy5f3S6EAZ9o9"
