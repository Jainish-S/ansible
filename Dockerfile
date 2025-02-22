FROM ubuntu:focal AS base

WORKDIR /usr/local/bin

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS j

ARG TAGS

RUN addgroup --gid 1000 jainish && \
    adduser --uid 1000 --gid 1000 --gecos jainish --disabled-password jainish && \
    echo "jainish ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/jainish && \
    chmod 0440 /etc/sudoers.d/jainish

USER jainish

ENV USER=jainish

WORKDIR /home/jainish

FROM j

COPY . .

ENTRYPOINT ["sh", "-c", "ansible-playbook $TAGS local.yml"]
