FROM ubuntu:20.04
WORKDIR /srv/app/
RUN apt update && \
    apt install --no-install-recommends python3 python3-pip -y && \
    apt clean && rm -rf /var/lib/apt/lists/*
RUN pip3 install --no-cache-dir psycopg2-binary configparser flask
COPY ./web.conf /srv/app/conf/web.conf
COPY ./web.py /srv/app/web.py
CMD ["/usr/bin/python3", "/srv/app/web.py"]

