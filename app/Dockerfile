FROM python:3.7-slim


WORKDIR /usr/myapp

COPY . .
RUN apt -y update
RUN pip install -r requirements.txt
CMD export $(cat .env | xargs) && python3 hello.py
