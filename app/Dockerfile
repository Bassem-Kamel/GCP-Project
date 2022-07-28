FROM python:3.7-slim


WORKDIR /usr/myapp

COPY . .
RUN apt update -y
RUN pip install -r requirements.txt
CMD python3 hello.py