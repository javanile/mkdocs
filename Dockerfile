FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common curl tini python3-pip && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN pip3 install mkdocs>=1.1.2

COPY mkdocs-entrypoint.sh /usr/local/bin/mkdocs-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["mkdocs-entrypoint.sh"]

CMD ["mkdocs"]
