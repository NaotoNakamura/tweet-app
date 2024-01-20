FROM ruby:3.3.0

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

RUN apt-get update && apt-get install -y \
      nodejs postgresql-client chromium chromium-driver

RUN npm install -g yarn

# ディレクトリ・ファイルの作成
RUN mkdir /tweet-app
WORKDIR /tweet-app
COPY Gemfile /tweet-app/Gemfile
COPY Gemfile.lock /tweet-app/Gemfile.lock

# gem(Rails7)のインストール
RUN bundle install
COPY . /tweet-app
