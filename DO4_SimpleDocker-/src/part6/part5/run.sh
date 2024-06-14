#!/bin/bash

spawn-fcgi -p 8080 ./my_web
service nginx start

# предотвращает завершение работы контейнера
tail -f /dev/null 