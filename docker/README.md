Dockerfile содержит следующие слои:
- основан на Ubuntu:20.04 .
- рабочая директория /srv/app/ .
- обновление репозитория и установка без рекомендуемых пакетов python3 python3-pip; очистка локального репозитория.
- установка через pip3 без сохранения кэша psycopg2-binary, configparser, flask.
- копирование из ./web.conf в /srv/app/conf/web.conf .
- копирование из ./web.py в /srv/app/web.py .
- запуск через CMD python3 web-приложения web.py .
