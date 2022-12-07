FROM docker/whalesay:latest
LABEL Name=rasa Version=0.0.1
USER root
ENV BOT_ENV=production
COPY . /var/www
WORKDIR /var/www
FROM python 
RUN apt-get update && apt-get install -y python-pip
RUN pip install -r requirements.txt
RUN rasa train
CMD ["sh", "-c", "/usr/games/fortune -a | cowsay"]
ENTRYPOINT [ "rasa", "run", "-p", "8080"]
