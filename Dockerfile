FROM docker/whalesay:latest
LABEL Name=rasa Version=0.0.1
USER root
ENV BOT_ENV=production
COPY . /var/www
WORKDIR /var/www

# alternatively, use a specific version: 
# FROM python:2.7 
FROM python:3.7 
 
RUN pip install
RUN pip install -r requirements.txt
RUN rasa train
CMD ["sh", "-c", "/usr/games/fortune -a | cowsay"]
ENTRYPOINT [ "rasa", "run", "-p", "8080"]
