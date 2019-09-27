FROM semaphoreci/ubuntu:18.04

## source for libssl and libpng12-0 package
RUN  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 437D05B5 \
 && echo "deb http://mirrors.kernel.org/ubuntu/ xenial main" | tee /etc/apt/sources.list.d/ubuntu_xenial.list

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    libxmlsec1-dev \
    fontconfig \
    libxrender1 \
    libjpeg-turbo8 \
    xfonts-75dpi \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir packages

RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb -O ./packages/wkhtmltox.deb
RUN dpkg -i ./packages/wkhtmltox.deb

RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./packages/cc-test-reporter
RUN chmod +x ./packages/cc-test-reporter
