# Set base image (host OS)
FROM python:3.8-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip install -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY app.py .
COPY gunicorn_conf.py .

# Create logs folder
RUN mkdir /logs

# Start app with gunicorn with reload for debug
CMD [ "gunicorn", "--reload", "-c", "gunicorn_conf.py", "app:app" ]
