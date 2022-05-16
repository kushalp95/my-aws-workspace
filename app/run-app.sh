#!/usr/bin/env sh

# Start virtualenv
if [ -d "appenv" ]; then
    rm -r appenv
fi

virtualenv appenv
. appenv/bin/activate

# Install any dependencies
pip install pip --upgrade
pip install -r requirements.txt

exec $@