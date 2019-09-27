FROM semaphoreci/ruby:2.5.1

RUN apt-get -y install -y libxmlsec1-dev libxmlsec1-openssl xmlsec1

RUN mkdir packages
RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb -O ./packages/wkhtmltox.deb
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./packages/cc-test-reporter
