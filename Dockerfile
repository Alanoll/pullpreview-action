FROM ruby:3.3.12-slim

RUN apt-get -qq update && apt-get -qq -y install openssh-client git >/dev/null
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install -j 4 --quiet
ADD . .

ENTRYPOINT ["/app/bin/pullpreview"]
