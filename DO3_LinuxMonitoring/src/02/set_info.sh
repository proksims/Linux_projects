#! /bin/bash

# awk: https://habr.com/ru/companies/ruvds/articles/665084/

f_set_info() {
    
  # HOSTNAME = сетевое имя
  HOSTNAME="$HOSTNAME"

  # TIMEZONE = временная зона в виде: America/New_York UTC -5 
  TIMEZONE="$(cat /etc/timezone) $(date +"UTC %-:::z")"

  # USER = текущий пользователь который запустил скрипт
  USER="$(whoami)"

  # OS = тип и версия операционной системы
  OS="$(hostnamectl | grep "System:" | awk '{print $3,$4,$5}')"

  # DATE = текущее время в виде: 12 May 2020 12:24:36
  DATE="$(date '+%d %B %Y %H:%M:%S')"

  # UPTIME = время работы системы
  UPTIME="$(uptime -p)"

  # UPTIME_SEC = время работы системы в секундах
  UPTIME_SEC="$(cat /proc/uptime | awk '{print $1}')"

  # IP = ip-адрес машины в любом из сетевых интерфейсов
  IP="$(hostname -I)"

  # MASK = сетевая маска любого из сетевых интерфейсов в виде: xxx.xxx.xxx.xxx
  MASK="$(ifconfig | grep "netmask" | awk '{print $4}' | head -1)"

  # GATEWAY = ip шлюза по умолчанию
  GATEWAY="$(ip r | grep "via" | awk '{print $3}')"

  # RAM_TOTAL = размер оперативной памяти в Гб c точностью три знака после запятой в виде: 3.125 GB
  RAM_TOTAL="$(free | grep "Mem" | awk '{printf("%.3f\n",$2 / 1024 / 1024)}')"

  # RAM_USED = размер используемой памяти в Гб c точностью три знака после запятой
  RAM_USED="$(free | grep "Mem" | awk '{printf("%.3f\n",$3 / 1024 / 1024)}')"

  # RAM_FREE = размер свободной памяти в Гб c точностью три знака после запятой
  RAM_FREE="$(free | grep "Mem" | awk '{printf("%.3f\n",$4 / 1024 / 1024)}')"

  # SPACE_ROOT = размер рутового раздела в Mб с точностью два знака после запятой в виде: 254.25 MB
  SPACE_ROOT="$(free -t| grep "Total" | awk '{printf("%.3f\n",$2 / 1024)}')"

  # SPACE_ROOT_USED = размер занятого пространства рутового раздела в Mб с точностью два знака после запятой
  SPACE_ROOT_USED="$(free -t| grep "Total" | awk '{printf("%.3f\n",$3 / 1024)}')"

  # SPACE_ROOT_FREE = размер свободного пространства рутового раздела в Mб с точностью два знака после запятой
  SPACE_ROOT_FREE="$(free -t | grep "Total" | awk '{printf("%.3f\n",$4 / 1024)}')"
  
}
