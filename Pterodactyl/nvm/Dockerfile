FROM debian:buster

LABEL maintainer="DIBSTER <dibster@danbot.host>"

RUN apt-get update && apt-get install -y curl locales && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash \
    && . ~/.nvm/nvm.sh \
    && nvm install --lts \
    && nvm use --lts

# Grant sudo permissions to container user for commands.
RUN apt-get -y install sudo


# Ensure UTF-8
RUN sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && \
    locale-gen

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Installing Latest NodeJS.
# RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
#    && apt -y install nodejs \
#    && apt -y install ffmpeg \
#    && apt -y install make \
#    && apt -y install build-essential 

# Install the system dependencies required for puppeteer support.
RUN apt-get install -y \
    fonts-liberation \
    gconf-service \
    libappindicator1 \
    libasound2 \
    libatk1.0-0 \
    libcairo2 \
    libcups2 \
    libfontconfig1 \
    libgbm-dev \
    libgdk-pixbuf2.0-0 \
    libgtk-3-0 \
    libicu-dev \
    libjpeg-dev \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libpng-dev \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    xdg-utils

# Installing NodeJS dependencies for AIO.
# RUN npm i -g yarn pm2 

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]