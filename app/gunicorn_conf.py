from multiprocessing import cpu_count

# Socket Path
bind = '0.0.0.0:5000'

# Worker Options
workers = cpu_count() + 1
