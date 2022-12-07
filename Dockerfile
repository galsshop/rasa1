FROM rasa/rasa
USER root
ENV BOT_ENV=production
COPY . /var/www
WORKDIR /var/www
RUN python3 -m venv env
RUN source ./env/bin/activate 
#RUN python -m pip install pip==3.7.15
RUN apt-get -y update && apt-get install -y fortunes
RUN pip install rasa==2.8.1
RUN pip install rasa-sdk==2.8.1
RUN pip install --user rasa-x==0.39.3 --extra-index-url https://pypi.rasa.com/simple
RUN pip install -r requirements.txt
RUN rasa train
#CMD ["sh", "-c", "/usr/games/fortune -a | cowsay"]
ENTRYPOINT [ "rasa", "run", "-p", "8080"]
