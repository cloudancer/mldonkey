FROM ubuntu:20.04

RUN \
    apt-get update && \
    apt-get install --no-install-recommends -y mldonkey-server && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/log/mldonkey && \
    rm /var/lib/mldonkey/*
ADD entrypoint.sh /
RUN \
    chown mldonkey:mldonkey /entrypoint.sh && \
    chmod +x /entrypoint.sh
USER mldonkey
ENV MLDONKEY_DIR=/var/lib/mldonkey LC_ALL=C.UTF-8 LANG=C.UTF-8 MLDONKEY_ADMIN_PASSWORD=Passw0rd
VOLUME /var/lib/mldonkey
EXPOSE 4000 4080 6881 6882
CMD /entrypoint.sh
