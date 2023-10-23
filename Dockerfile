FROM ruby:3.1.2

RUN apt-get update && apt-get install -y build-essential libpq-dev

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

COPY . .

EXPOSE 3000

CMD bundle exec rails server -b 0.0.0.0 -p 3000
