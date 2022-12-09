#ARG RASA_SDK_VERSION
#FROM rasa/rasa-sdk:$RASA_SDK_VERSION

#copy in your source code
#COPY main.py .

#CMD ["run", "python", "/app/main.py"]
#ENTRYPOINT [ "rasa", "run", "-p", "8080"]
FROM rasa/rasa

ENV BOT_ENV=production

COPY . /var/www
WORKDIR /var/www

RUN pip install rasa==1.3.0a1
RUN rasa train

ENTRYPOINT [ "rasa", "run", "-p", "8080"]

