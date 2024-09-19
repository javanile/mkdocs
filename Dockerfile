FROM python:3-alpine

RUN pip install mkdocs>=1.6.1

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mkdocs"]
