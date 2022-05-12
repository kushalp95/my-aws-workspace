# Performance optimization article: https://medium.com/building-the-system/gunicorn-3-means-of-concurrency-efbb547674b7

from multiprocessing import cpu_count
import os

# Default app port
app_port = 8000

if os.environ.get('APP_PORT') is not None:
    app_port = os.environ['APP_PORT']

# Socket Path
bind = '0.0.0.0:' + str(app_port)

# Worker Options
workers = (2* cpu_count()) + 1

# Reload
reload_engine = 'inotify'

# Logging
accesslog = '../logs/app_access.log'
errorlog = '../logs/app_error.log'
loglevel = 'debug'