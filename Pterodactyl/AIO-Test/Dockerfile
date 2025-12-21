FROM debian

LABEL maintainer="DIBSTER <contact@dibster.dev>"

# Install Dependencies:
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get -y install curl locales git \
    && apt-get -y install liblzma-dev \
    && apt-get -y install lzma \
    && adduser container \
    && apt-get update \ 
    && apt-get -y install cmake \
    && apt-get -y install wget \
    && apt-get -y install unzip 

# Grant Sudo Permissions:
RUN apt-get update && \
    apt-get -y install sudo
    
# Ensure UTF-8
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8

# Add Ping Utility 
RUN apt-get update && apt-get install -y iputils-ping

# OpenJDK 21 LTS
RUN apt update \
   && apt install -y libc6-i386 libc6-x32 \
   && wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb -O jdk-21_linux-x64_bin.deb \
   && apt install -y ./jdk-21_linux-x64_bin.deb \
   && rm jdk-21_linux-x64_bin.deb
   
ENV JAVA_HOME=/usr/lib/jvm/jdk-21/
ENV PATH=$PATH:$JAVA_HOME/bin

# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get -y install nodejs imagemagick ffmpeg make build-essential 
    
# Python 2 & 3
RUN apt update \
   && apt -y install zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev \
   && wget https://www.python.org/ftp/python/3.12.1/Python-3.12.1.tgz \
   && tar -xf Python-3.12.*.tgz \
   && cd Python-3.12.1 \
   && ./configure --enable-optimizations \
   && make -j $(nproc) \
   && make altinstall \
   && cd .. \
   && rm -rf Python-3.12.1 \
   && rm Python-3.12.*.tgz 
   
# Upgrade Pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Golang
RUN curl -OL https://golang.org/dl/go1.21.5.linux-amd64.tar.gz \
   && tar -C /usr/local -xvf go1.21.5.linux-amd64.tar.gz   
ENV PATH=$PATH:/usr/local/go/bin
ENV GOROOT=/usr/local/go

# Install the speedtest by Ookla
RUN curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash \
    && apt-get install speedtest -y
# For calling speedtest, enter command "speedtest --accept-license YES"

# Installing NodeJS dependencies for AIO.
RUN npm i -g yarn pm2 pnpm

# Switching to container user:
USER container
ENV NVM_DIR=/home/container/.nvm

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && echo 'export NVM_DIR="$HOME/.nvm"' >> $HOME/.bashrc \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $HOME/.bashrc \
    && echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> $HOME/.bashrc

USER container
ENV USER=container
ENV HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
