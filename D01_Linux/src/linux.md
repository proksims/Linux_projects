# Операционные системы UNIX/Linux (Базовый).

## Part 1. Установка ОС
1.	Установим Ubuntu 20.04 Server LTS без графического интерфейса. Используем программу для виртуализации - VirtualBox. Узнаем версию Ubuntu (cat /etc/issue).\
![linux](images/1.1.png)


## Part 2. Создание пользователя
1.	Создадим нового пользователя (sudo adduser user2) и проверим (cat /etc/passwd).
![linux](images/2.1.png)

2.	Добавим пользователя в группу adm (sudo usermod -aG adm user2). Переходим на созданного пользователя (su user2), проверяем группу (groups). Вернемся к системному пользователю (control+D).
![linux](images/2.2.png)

## Part 3. Настройка сети ОС
1.	Зададим название машины user-1 (sudo nano /etc/hostname) и проверим (cat /etc/hostname). Перезагружаемся (sudo reboot).
![linux](images/3.1.png)

2.	Установим временную зону (sudo timedatectl set-timezone Europe/Moscow) и проверяем (cat /etc/timezone)
![linux](images/3.2.png)

3.	Выведем названия сетевых интерфейсов (ifconfig). Перед этим установим утилиту net-tools (sudo apt install net-tools).
>lo (loopback device) – виртуальный интерфейс, присутствующий по умолчанию в любом Linux. Он используется для отладки сетевых программ и запуска серверных приложений на локальной машине. С этим интерфейсом всегда связан адрес 127.0.0.1. У него есть dns-имя – localhost. Посмотреть привязку можно в файле /etc/hosts.

![linux](images/3.3.png)

4.	Используя консольную команду, получим ip адрес устройства от DHCP сервера. Сбросим старый ip (sudo dhclient -r enp0s3), получим новый ip (sudo dhclient -v enp0s3), выводим (ifconfig).
>DHCP — протокол прикладного уровня модели TCP/IP, служит для назначения IP-адреса клиенту. Это следует из его названия — Dynamic Host Configuration Protocol. IP-адрес можно назначать вручную каждому клиенту, то есть компьютеру в локальной сети. Но в больших сетях это очень трудозатратно, к тому же, чем больше локальная сеть, тем выше возрастает вероятность ошибки при настройке. Поэтому для автоматизации назначения IP был создан протокол DHCP.

![linux](images/3.4.png)

5.	Определим внешний ip-адрес шлюза (ip) и внутренний IP-адрес шлюза, он же ip-адрес по умолчанию (gw). Узнаем внешний IP, обратившись к внешнему сайту, который вернёт нам наш адрес (wget -O - -q icanhazip.com). Узнаем внутренний IP (hostname -I).
![linux](images/3.5.png)

6.	Зададим статичные, заданные вручную, а не полученные от DHCP сервера, настройки ip, gw, dns.
Зайдем в директорию /etc/netplan и изменим файл (sudo nano /etc/netplan/00-installer-config.yaml). Отключим получение адреса от DHCP(dhcp4: false) и присвоим статический адрес (IP и публичный DNS серверы 1.1.1.1 или 8.8.8.8). Применим конфигурацию (sudo netplan apply), применим изменения (sudo netplan try).
![linux](images/3.6.png)

7.	Перезагрузим виртуальную машину. Cтатичные сетевые настройки (ip, gw, dns) соответствуют заданным в предыдущем пункте. Пропингуем удаленные хосты 1.1.1.1(ping 1.1.1.1) и ya.ru (ping ya.ru).
![linux](images/3.7.png)

## Part 4. Обновление ОС
1.	Обновляем системные пакеты до последней на момент выполнения задания версии(sudo apt update + sudo apt dist-upgrade).
![linux](images/4.1.png)

## Part 5. Использование команды sudo
>Команда sudo ( substitute user and do, подменить пользователя и выполнить ) позволяет строго определенным пользователям выполнять указанные программы с административными привилегиями без ввода пароля суперпользователя root. Если быть точнее, то команда sudo позволяет выполнять программы от имени любого пользователя, но, если идентификатор или имя этого пользователя не указаны, то предполагается выполнение от имени суперпользователя root. Таким образом, использование sudo позволяет выполнять привилегированные команды обычным пользователям без необходимости ввода пароля суперпользователя root. 
1.	Разрешаем пользователю, созданному в Part 2, выполнять команду sudo. Добавим пользователя в группу sudo (sudo usermod -aG sudo user2) и проверим (sudo whoami).
![linux](images/5.1.png)

2.  Поменяем hostname ОС от имени пользователя, созданного в пункте Part 2. Зададим название машины user-2 (sudo nano /etc/hostname) и проверим (cat /etc/hostname).
![linux](images/5.2.png)

## Part 6. Установка и настройка службы времени
1.	Настроим службу автоматической синхронизации времени (timedatectl show).
![linux](images/6.1.png)

## Part 7. Установка и использование текстовых редакторов
1.  Установим текстовый редактор VIM. Создаем файл test_VIM.txt.\
Пишем никнейм, сохраняем (:wq).
Открываем файл, редактируем никнейм на строку "21 School 21", не сохраняем (:!q).
Открываем файл, ищем слово (/nomacold) и заменяем на "21"(:s/nomacold/21).
![linux](images/7.1.png)

2.  Установим текстовый редактор NANO. Создаем файл test_NANO.txt.\
Пишем никнейм, сохраняем (Ctrl + X -> y).
Открываем файл, редактируем никнейм на строку "21 School 21", не сохраняем (Ctrl + X -> n).
Открываем файл, ищем слово (Ctrl + W + nomacold) и заменяем на "21"(Ctrl + \ + nomacold -> 21 -> y).
![linux](images/7.2.png)

3.  Установим текстовый редактор JOE(sudo apt install joe). Создаем файл test_JOE.txt.\
Пишем никнейм, сохраняем (Ctrl + K -> Q -> y).
Открываем файл, редактируем никнейм на строку "21 School 21", не сохраняем (Ctrl + K -> Q -> n).
Открываем файл, ищем слово (Ctrl + K + F -> nomacold) и заменяем на "21"(Ctrl + K + F + r -> nomacold -> 21 -> y).
![linux](images/7.3.png)

## Part 8. Установка и базовая настройка сервиса SSHD
>SSH (Secure Shell) — сетевой протокол прикладного уровня, который позволяет управлять операционной системой и выполнять функцию туннелирования TCP-соединения. Работа SSH построена на взаимодействии 2-х компонентов: SSH-сервера и SSH-клиента.\
OpenSSH — это бесплатный SSH-сервер, дающий возможность интерактивного управления сервером.

1.  Установим службу SSHd (sudo apt-get install ssh). По завершению установки, автоматически будет запущен SSH-сервер в режиме демона, можно проверить командой (systemctl status sshd).
![linux](images/8.1.png)

2.  Добавим автостарт службы при загрузке системы (sudo systemctl enable sshd).
![linux](images/8.2.png)

3.  Перенастроим службу SSHd на порт 2022. Изменяем настройки демона (vim /etc/ssh/sshd_config). 
![linux](images/8.3.png)

4.  Используя команду ps, показываем наличие процесса sshd (ps -C sshd).
![linux](images/8.4.png)

5.  Перезагрузим систему (sudo reboot, ssh noma@localhost -p 2022).
![linux](images/8.5.png)

6.  Вывод команды netstat -tan. Установим netstat (sudo apt install net-tools).
>netstat (network statistics) — утилита командной строки выводящая на дисплей состояние TCP-соединений (как входящих, так и исходящих), таблицы маршрутизации, число сетевых интерфейсов и сетевую статистику по протоколам.\
-t - Отображает текущее подключение.\
-a - Показывает состояние всех сокетов(программный интерфейс для обеспечения информационного обмена между процессами).\
-n - Показывает сетевые адреса как числа.\
Proto - название протокола.\
Recv-Q - очередь получения сети.\
Send-Q - счётчик байт, не подтверждённых удалённым узлом.\
Local Address - локальный IP-адрес участвующий в соединении или связанный со службой, ожидающей входящие соединения (слушающей порт).\
Foreign Address - внешний IP-адрес, участвующий в создании соединения.\
State - состояние соединения (Состояние Listening говорит о том, что строка состояния отображает информацию о сетевой службе, ожидающей входящие соединения по соответствующему протоколу на адрес и порт, отображаемые в колонке "Локальный адрес ". Состояние ESTABLISHED указывает на активное соединение).\
Если в качестве адреса отображается 0.0.0.0 , то это означает - "любой адрес", т.е в соединении могут использоваться все IP-адреса существующие на данном компьютере.\
Адрес 127.0.0.1 - это петлевой интерфейс, используемый в качестве средства IP протокола для взаимодействия между процессами без реальной передачи данных
![linux](images/8.6.png)


## Part 9. Установка и использование утилит top, htop
1. Запустим команду top:\
-uptime: 2 min\
-количество авторизованных пользователей: 2\
-общую загрузку системы: 0.14, 0.19, 0.08\
-общее количество процессов: 115\
-загрузку cpu: 0\
-загрузку памяти: 165\
-pid процесса занимающего больше всего памяти: 735\
-pid процесса, занимающего больше всего процессорного времени: 1147\
![linux](images/9.1.png)

2. Запустим команду htop:\
-отсортированному по PID
![linux](images/9.2.png)
-отсортированному по PERCENT_CPU
![linux](images/9.3.png)
-отсортированному по PERCENT_MEM
![linux](images/9.4.png)
-отсортированному по TIME
![linux](images/9.5.png)
-отфильтрованному для процесса sshd
![linux](images/9.6.png)
-с процессом syslog, найденным, используя поиск
![linux](images/9.7.png)
-с добавленным выводом hostname, clock и uptime
![linux](images/9.8.png)


## Part 10. Использование утилиты fdisk
1. Запустим команду: sudo fdisk -l.\
-название жесткого диска: /dev/sda\
-размер и количество секторов: 25 GiB и 52428800 sectors.\
-размер swap (sudo swapon --show): 2Гб.\
![linux](images/10.1.png)


## Part 11. Использование утилиты df
1. Запустим команду df.\
-размер раздела: 11758760\
-размер занятого пространства: 4792100\
-размер свободного пространства: 6347552\
-процент использования: 44\
-Единица измерения: Кб\
![linux](images/11.1.png)

2. Запустим команду df -Th.\
-размер раздела: 12 Гб\
-размер занятого пространства: 4.6 Гб\
-размер свободного пространства: 6.1 Гб\
-процент использовани: 44%\
-тип файловой системы: ext4\
![linux](images/11.2.png)


## Part 12. Использование утилиты du
1. Запустим команду du.\
![linux](images/12.1.png)

2. Выведем размер папок /home, /var, /var/log.\
![linux](images/12.2.png)

3. Выведем размер всего содержимого в /var/log (не общее, а каждого вложенного элемента, используя *).\
![linux](images/12.3.png)

## Part 13. Установка и использование утилиты ncdu
1. Установим утилиту ncdu (sudo apt install ncdu) и выведем размер папок /home, /var, /var/log.
![linux](images/13.1.png)

## Part 14. Работа с системными журналами
1. Открываем для просмотра: /var/log/dmesg (tail /var/log/dmesg), /var/log/syslog, /var/log/auth.log.
Последняя авторизация: Feb 10 02:35:26 user-2 sudo: pam_unix(sudo:session): session opened for user root by noma(uid=0).
![linux](images/14.1.png)

2. Перезапустим службу SSHd (sudo service sshd restart).
![linux](images/14.2.png)


## Part 15. Использование планировщика заданий CRON
1. Используя планировщик заданий (crontab -e), запускаем команду uptime через каждые 2 минуты, находим в системных журналах строчки (минимум две в заданном временном диапазоне) о выполнении.
![linux](images/15.1.png)

2. Удаляем все задания из планировщика заданий.
![linux](images/15.2.png)

