FROM ruby:latest

# install stuff
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

# create app folder
RUN mkdir -p /app
WORKDIR /app

# install ruby stuff
RUN gem update && gem install rails && gem install bundler
COPY . /app
RUN bundle install

# CMD ["rails","server"]
CMD [ "bundle","exec", "puma", "config.ru"]
