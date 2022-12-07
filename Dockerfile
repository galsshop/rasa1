FROM docker/whalesay:latest
LABEL Name=rasa Version=0.0.1
USER root
ENV BOT_ENV=production
#COPY requirements.txt requirements.txt
COPY . /var/www
WORKDIR /var/www

FROM ubuntu:14.04

RUN apt-get -yqq update

RUN apt-get install -yqq python

RUN apt-get -yqq install python-pip

#RUN pip install -r requirements.txt
RUN rasa train
#CMD ["sh", "-c", "/usr/games/fortune -a | cowsay"]
ENTRYPOINT [ "rasa", "run", "-p", "8080"]
