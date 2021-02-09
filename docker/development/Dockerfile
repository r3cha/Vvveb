FROM node:14.15.4-buster-slim as node
FROM ruby:3.0.0-slim-buster as build-base

COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /opt/yarn-v1.22.5 /opt/yarn-v1.22.5

RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs
RUN ln -s /opt/yarn-v1.22.5/bin/yarn /usr/local/bin/yarn
RUN ln -s /opt/yarn-v1.22.5/bin/yarnpkg /usr/local/bin/yarnpkg

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y g++ make curl git make libsqlite3-dev python3

WORKDIR /app

RUN echo "install: --no-rdoc --no-ri" >> ~/.gemrc
RUN echo "update:  --no-rdoc --no-ri" >> ~/.gemrc 

RUN gem install bundler

RUN bundle config --global jobs $(nproc --all)

COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install
RUN yarn install