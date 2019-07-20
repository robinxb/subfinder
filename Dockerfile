FROM python:3.7-alpine

WORKDIR /app

RUN apk add --no-cache --virtual .build-deps gcc libc-dev libxml2-dev libxslt-dev
RUN pip install subfinder
RUN echo '*/10 * * * * subfinder ${SUBFIND_DIR}' > /etc/crontabs/root
CMD ["crond", "-f", "-d", "8"]
