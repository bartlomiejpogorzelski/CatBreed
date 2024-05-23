FROM ruby:3.2.2

# Instalacja niezbędnych narzędzi
RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

# Instalacja Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

WORKDIR /docker/app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

# Instalacja zależności Node.js
COPY package.json yarn.lock ./
RUN yarn install --check-files

# Kompilacja assetów (w tym Tailwind CSS)
RUN bundle exec rails assets:precompile

ADD . /docker/app

ARG DEFAULT_PORT 3000
EXPOSE ${DEFAULT_PORT}

# Uruchomienie serwera Puma
CMD [ "bundle", "exec", "puma", "config.ru"]
