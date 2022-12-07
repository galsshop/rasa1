FROM docker/whalesay:latest
LABEL Name=rasa Version=0.0.1
USER root
ENV BOT_ENV=production
COPY . /var/www
WORKDIR /var/www

RUN apt-get -y update && apt-get install -y fortunes
RUN pip install rasa==2.8.1
RUN pip install rasa-sdk==2.8.1

RUN pip install -r requirements.txt
RUN rasa train
CMD ["sh", "-c", "/usr/games/fortune -a | cowsay"]
ENTRYPOINT [ "rasa", "run", "-p", "8080"]
