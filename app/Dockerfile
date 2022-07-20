FROM python:3.7-slim


WORKDIR /usr/myapp

COPY . .
RUN apt -y update
RUN apt install -y redis-server 
RUN pip install -r requirements.txt
CMD export $(cat .env | xargs) && service redis-server start && python3 hello.py
#/etc/init.d/redis-server start or service redis-server start
