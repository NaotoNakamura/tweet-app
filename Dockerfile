FROM ruby:3.3.0-alpine3.19

RUN apk update && apk add --no-cache \
  build-base \
  postgresql-dev \
  tzdata \
  git \
  yarn \
  shared-mime-info \
  gcompat \
  chromium \
  chromium-chromedriver \
  font-ipa \
  bash

WORKDIR /tweet-app
