# Inherit from miniconda base image
FROM continuumio/miniconda3:latest

# RUN runs a command during your build process
RUN echo "Welcome to your first container build!"

# COPY copies a file in the local build context to the container image
COPY app /app

# Installing some dependencies..
RUN pip install -r /app/requirements.txt && \
    apt-get update && apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/* && \
    echo "Setup done!"

# CMD specifies the default command to run when the container is launched. \
# This can be overridden by the docker run command
CMD ["python", "/app/webserver.py", "8000"]
