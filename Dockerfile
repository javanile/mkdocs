FROM python:3-alpine

RUN pip install mkdocs>=1.1.2

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /docs

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mkdocs"]
