Ansible playbook по хостам (Ubuntu 20.04 Focal!) их файла inventory:
- установка _необходимого_ софта (curl, software-properties-common, ca-certificates, apt-transport-https) 
- добавление GPG-ключей от docker
- добавление репозитория docker
- установка docker
- включение daemon docker и перезапуск
- создание директории под проект
- копирование файлов из директории ../docker/
- установка и запуск postgresql
- разрешение на подключение через UNIX-сокет пользователя postgres ко всем базам (method trust)
- установка pip3
- установка через pip3 - psycopg2-binary, flask, configparser
- создание базы данных, пользователя
- даны права на новую базу новому пользователю
- разрешение на подключение через TCP/IP от 172.17.0.0/16 для нового пользователя к новой базе
- изменение метода аутентификации для пользователя postgres (method peer)
- перезапуск postgresql
