FROM python:3.7-alpine

WORKDIR /app
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache --virtual .build-deps gcc libc-dev libxml2-dev libxslt-dev
RUN pip install subfinder -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
RUN echo '*/10 * * * * subfinder ${SUBFIND_DIR}' > /etc/crontabs/root
CMD ["crond", "-f", "-d", "8"]
