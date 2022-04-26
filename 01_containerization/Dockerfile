FROM python:3.7

RUN echo "Welcome to your first container build!"

COPY app /app

RUN pip install -r /app/requirements.txt && \
    echo setup done!

CMD ["python", "/app/webserver.py", "8000"]
