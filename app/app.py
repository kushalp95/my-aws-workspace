from flask import Flask
import os
import platform

app = Flask(__name__)

@app.route('/')
def hello_world():
   return f"Hello, World! <br/><b>ProcessId</b>: {os.getpid()}<br/><b>OS</b>: {os.name} {platform.system()} {platform.release()}"

# Default app port
app_port = 8000

if os.environ.get('APP_PORT') is not None:
   app_port = os.environ['APP_PORT']

if __name__ == "__main__":
   app.run(host='0.0.0.0', port=app_port)
