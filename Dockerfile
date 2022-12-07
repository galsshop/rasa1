FROM docker/whalesay:latest
LABEL Name=rasa Version=0.0.1
USER root
RUN apt-get -y update && apt-get install -y fortunes
RUN pip install --no-cache-dir --upgrade pip
RUN pip install rasa==2.8.1
RUN pip install rasa-sdk==2.8.1
RUN pip install rasa-x==0.39.3 --extra-index-url https://pypi.rasa.com/simple
RUN pip install -r requirements.txt
RUN rasa train
CMD ["sh", "-c", "/usr/games/fortune -a | cowsay"]
ENTRYPOINT [ "rasa", "run", "-p", "8080"]
