FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /docker/app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

ADD . /docker/app

ARG DEFAULT_PORT=3000
ARG RAILS_ENV

ENV RAILS_ENV=${RAILS_ENV}

EXPOSE ${DEFAULT_PORT}

RUN bundle exec rake assets:precompile

CMD [ "bundle","exec", "puma", "config.ru"]
