FROM alpine:latest

RUN mkdir -p /backups \
 && apk add --no-cache tzdata

ENV TZ=Etc/UTC

COPY ./copied-inside-container/backupEntryPoint /backupEntryPoint

WORKDIR /backups

ENTRYPOINT ["/backupEntryPoint"]