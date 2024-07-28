FROM ruby:latest

# install stuff
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs postgresql-client postgresql

# setup Ruby
RUN gem update && gem install rails && gem install bundler

# create app folder
RUN mkdir -p /app
WORKDIR /app
#ENTRYPOINT ["bash", "-c"]
