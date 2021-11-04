FROM ruby:2.7.4

RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /patient-care/tmp/pids
RUN mkdir -p /patient-care/db
WORKDIR /patient-care

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler
RUN bundle config set without 'development test'
RUN bundle install

COPY . /patient-care

CMD bundle exec puma -C config/puma.rb
