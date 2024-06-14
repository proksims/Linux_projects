#!/bin/bash

gcc -o my_web server.c -lfcgi
spawn-fcgi -p 8080 ./my_web
service nginx start
/bin/bash