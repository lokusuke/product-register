FROM ruby:2.5
RUN apt-get update
RUN apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn

WORKDIR /product-register
COPY Gemfile Gemfile.lock /product-register/
RUN bundle install

# docker-compose up -d でwebコンテナのイメージ作成と起動
# docker-compose exec web bash でコンテナに入る
# その後、rails newでrailsに必要なファイル群が生成、Gemfileも書き換えられる
# bundle installを再度実行するためにexitしてdocker-compose downでコンテナ削除
# 再度docker-compose up --build -d を実行（--buildがないと既存のイメージを利用してしまうため）

