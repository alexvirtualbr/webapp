FROM ruby:2.6.5
LABEL author="Alexandre Ferreira"
ENV DEBIAN_FRONTEND noninteractive
ENV NODESJS_VERSION setup_10.x

# Install nodejs and yarn
RUN curl -sL https://deb.nodesource.com/${NODESJS_VERSION} | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
tee /etc/apt/sources.list.d/yarn.list

RUN echo "deb http://ftp.de.debian.org/debian jessie main"  > sources.list

# Install all project dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
ca-certificates \
build-essential \
nodejs \
yarn \
unzip \
imagemagick \
software-properties-common \
git \
libpq-dev \
openssl \
# Cypress depencies start
openjdk-11-jre \
libgtk2.0-0 \
libnotify-dev \
libgconf-2-4 \
libnss3 \
libxss1 \
libasound2 \
xvfb \
# Cypress depencies finish
--fix-missing \
&& rm -rf /var/lib/apt/lists/*
 
RUN mkdir /app
 
WORKDIR /app

ADD Gemfile /app/Gemfile

ADD Gemfile.lock /app/Gemfile.lock
 
RUN bundle install

