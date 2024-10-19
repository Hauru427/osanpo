# ベースイメージ
FROM ruby:3.2.0

# 必要なライブラリをインストール
RUN apt-get update -qq && apt-get install -y postgresql-client yarn

# アプリケーションディレクトリを作成
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Gemのインストール
RUN bundle install

# アプリケーションソースをコピー
COPY . /app/

# ポート3000を解放
EXPOSE 3000

# サーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]