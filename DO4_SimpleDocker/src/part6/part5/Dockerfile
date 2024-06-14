FROM nginx
WORKDIR /home
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./server.c .
COPY ./run.sh .
RUN useradd -m nomauser \
    && apt-get update && apt install -y gcc spawn-fcgi libfcgi-dev \
    && gcc server.c -o my_web -lfcgi \
    && rm -rf /var/lib/apt/lists
USER nomauser
ENTRYPOINT ["sh", "run.sh"]