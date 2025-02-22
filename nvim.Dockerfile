FROM ubuntu:focal

ARG TAGS

WORKDIR /usr/local/bin

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y apt-transport-https software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt update && apt install -y curl git ansible build-essential neovim

COPY . .

ENV USER=root

CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
