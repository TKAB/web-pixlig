FROM ruby:2.6.3-alpine3.10

ARG MIDDLEMAN_VERSION=4.3.11

RUN apk --no-cache add \
  nodejs=10.24.1-r0 \
  ruby-dev=2.5.9-r0 \
  build-base=0.5-r1 \
  git=2.22.5-r0

RUN gem install --no-document \
    middleman --version $MIDDLEMAN_VERSION

WORKDIR /app

ADD Gemfile ./Gemfile
ADD Gemfile.lock ./Gemfile.lock
RUN bundle install
