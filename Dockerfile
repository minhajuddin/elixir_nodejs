FROM elixir:1.4.5
MAINTAINER Khaja Minhajuddin <minhajuddink@gmail.com>

ENV REFRESHED_AT=2017-07-12 \
    # Set this so that CTRL+G works properly
    TERM=xterm

RUN apt-get update \
  && (curl -sL https://deb.nodesource.com/setup_7.x | bash -) \
  && apt-get install -y nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && update-ca-certificates --fresh \
  && mix local.hex --force \
  && mix local.rebar --force
