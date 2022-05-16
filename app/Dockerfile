# Set base image (host OS)
FROM python:3.8-alpine

RUN pip install virtualenv

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY run-app.sh .
COPY requirements.txt .
RUN chmod +x /app/run-app.sh

# Copy the content of the local src directory to the working directory
COPY app.py .
COPY gunicorn_conf.py .

# Create logs folder
RUN mkdir /logs

ENTRYPOINT [ "/app/run-app.sh" ]

# Start app with gunicorn with reload for debug
CMD ["gunicorn", "--reload", "-c", "gunicorn_conf.py", "app:app"]
