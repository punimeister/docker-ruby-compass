FROM ruby:2.5-alpine

RUN apk add --no-cache \
    build-base \
    nodejs \
 && gem update \
 && gem install \
    compass \
    autoprefixer-rails \
 && apk del --purge build-base

COPY config.rb /app/

WORKDIR /app

CMD compass w
