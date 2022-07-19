FROM python:3.7


WORKDIR /usr/myapp

COPY . .
RUN apt update -y
RUN apt install -y redis-server
RUN pip install -r requirements.txt
CMD export $(cat .env | xargs) && service redis-server start  && python3 hello.py
#/etc/init.d/redis-server start
