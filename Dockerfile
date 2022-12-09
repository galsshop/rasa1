#ARG RASA_SDK_VERSION
#FROM rasa/rasa-sdk:$RASA_SDK_VERSION

# copy in your source code
#COPY main.py .

#CMD ["run", "python", "/app/main.py"]
#ENTRYPOINT [ "rasa", "run", "-p", "8080"]
FROM rasa/rasa
USER root
ENV BOT_ENV=development
COPY . /var/www
WORKDIR /var/www
RUN pip install --no-cache-dir phonenumbers pgeocode
RUN rasa train nlu
RUN rasa train
# Use this for action_server.yaml deploy
ENTRYPOINT ["rasa", "run", "-vv", "--enable-api", "--debug", "-p", "8088", "actions"]

# Use this for bot deployment using app.yaml
#ENTRYPOINT ["rasa", "run", "-p", "8080", "--debug", "-vv", "--enable-api", "-m", "models", "--cors", "*", "actions"]
