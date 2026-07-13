FROM ruby:3.3.0-slim

ENV BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    RAILS_LOG_TO_STDOUT=1

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential curl libpq-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /rails

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 8001

CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "8001"]
