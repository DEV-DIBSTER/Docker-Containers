FROM debian:buster

LABEL maintainer="DIBSTER <contact@dibster.dev>"

RUN apt update \
    && apt upgrade -y \
    && apt -y install curl software-properties-common locales git \
    && apt-get -y install liblzma-dev \
    && apt-get -y install lzma \
    && adduser container \
    && apt-get update \ 
    && apt -y install cmake \
    && apt -y install wget \
    && apt -y install iputils-ping

# Grant sudo permissions to container user for commands
RUN apt-get update && \
    apt-get -y install sudo
    
# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt -y install nodejs \
    && apt -y install ffmpeg \
    && apt -y install make \
    && apt -y install build-essential 
    
# Installing NodeJS dependencies for AIO.
RUN npm i -g yarn pm2 

USER container
ENV  USER container
ENV  HOME /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
