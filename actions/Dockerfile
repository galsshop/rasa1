FROM rasa/rasa-sdk

COPY actions.py /app/actions.py
COPY requirements.txt /app

USER root

RUN pip install --no-cache-dir -r requirements.txt

USER 1001
CMD ["start", "--actions", "actions", "-p", "8080"]
