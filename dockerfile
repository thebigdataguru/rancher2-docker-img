FROM ubuntu:18.10 

# Update package list
RUN apt update -y && \
# Install docker client 
    apt install -y docker.io \
# Install AWS CLI dependencies 
    python curl openssh-server \
# Install Kubectl dependencies
    apt-transport-https gnupg && \
# Install AWS CLI
    curl -sO https://bootstrap.pypa.io/get-pip.py && python get-pip.py && \
    pip install awscli && \
# Setup AWS CLI Command Completion
    echo complete -C '/usr/local/bin/aws_completer' aws >> ~/.bashrc && \
# Install Rancher
    wget https://github.com/rancher/cli/releases/download/v2.2.0/rancher-linux-amd64-v2.2.0.tar.gz && \
    tar xvfz rancher-linux-amd64-v2.2.0.tar.gz -C ./ && \
    mv rancher-v2.2.0/rancher / && \
    chmod +x /rancher && \
    rm -fr rancher-linux-amd64-v2.2.0.tar.gz rancher-v2.2.0 && \
# Install Kubectl
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt update && \
    apt install -y kubectl



