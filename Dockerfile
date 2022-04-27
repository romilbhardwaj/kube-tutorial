FROM continuumio/anaconda3:5.3.0
MAINTAINER romil.bhardwaj@berkeley.edu

COPY motd /etc/motd
RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/issue && cat /etc/motd' >> /etc/bash.bashrc

# Install DIND
COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/

# Install kind and kubectl
RUN wget --no-check-certificate https://kind.sigs.k8s.io/dl/v0.12.0/kind-linux-amd64 &&  \
    chmod +x ./kind-linux-amd64 && \
    mv ./kind-linux-amd64 /usr/local/bin/kind

RUN wget https://dl.k8s.io/release/v1.23.0/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

# Clone repo
RUN git clone https://github.com/romilbhardwaj/kube-tutorial && cd kube-tutorial

WORKDIR /kube-tutorial/

# To keep the container running in background
CMD tail -f /dev/null
