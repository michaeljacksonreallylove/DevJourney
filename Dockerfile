FROM ruby:3.4.7

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get update -qq \
    && apt-get install -y nodejs \
    && npm install -g yarn

RUN apt-get install -y build-essential libpq-dev imagemagick

WORKDIR /devjourney

COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install \
    && yarn install

RUN mkdir -p tmp/sockets
