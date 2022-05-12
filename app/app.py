from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
   return "Hello, World!"

# Default app port
app_port = 8000

if os.environ.get('APP_PORT') is not None:
   app_port = os.environ['APP_PORT']

if __name__ == "__main__":
   app.run(host='0.0.0.0', port=app_port)
