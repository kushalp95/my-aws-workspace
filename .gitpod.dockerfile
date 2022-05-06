FROM gitpod/workspace-full

RUN sudo apt-get update \
 && sudo apt-get install -y \
 && wget "https://awscli.amazonaws.com/awscli-exe-linux-"$(uname -m)".zip" -O "awscliv2.zip" \
 && unzip awscliv2.zip \
 && sudo ./aws/install \
 && rm awscliv2.zip \
 && rm -r ./aws \
 && sudo rm -rf /var/lib/apt/lists/*