FROM gitpod/workspace-full

# Install aws-cli

RUN sudo apt-get update \
    && sudo apt-get install -y \
    && wget "https://awscli.amazonaws.com/awscli-exe-linux-"$(uname -m)".zip" -O "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm awscliv2.zip \
    && pip install shyaml gunicorn \
    && rm -r ./aws \
    && sudo rm -rf /var/lib/apt/lists/*

# Install sam

RUN pip3 install aws-sam-cli
