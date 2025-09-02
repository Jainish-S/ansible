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

ARG UNAME=jainish
ARG UID=1000
ARG GID=1000

RUN (addgroup --gid $GID $UNAME || true) && \
    adduser --uid $UID --gid $GID --gecos $UNAME --disabled-password $UNAME && \
    echo "$UNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$UNAME && \
    chmod 0440 /etc/sudoers.d/$UNAME

USER $UNAME
ENV USER=$UNAME
WORKDIR /home/$UNAME

FROM j

COPY --chown=$UNAME:$UNAME . .
ENTRYPOINT ["sh", "-c", "ansible-playbook $TAGS local.yml"]

