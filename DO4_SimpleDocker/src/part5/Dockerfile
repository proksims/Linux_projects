FROM nginx
WORKDIR /home/
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./server.c .
COPY ./run.sh .
RUN useradd -m nomauser \
    && apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev \
    && rm -rf /var/lib/apt/lists/*
USER nomauser
HEALTHCHECK CMD curl -f http://127.0.0.1:81/ || exit 1
ENTRYPOINT ["sh", "./run.sh"]