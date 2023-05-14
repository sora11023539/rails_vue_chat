FROM ruby:2.7.1

ARG RUNTIME_PACKAGES="bash nodejs yarn postgresql-client"

RUN mkdir /app
WORKDIR /app

COPY Gemfile* ./

RUN apt-get update -qq
RUN apt-get install -y ${RUNTIME_PACKAGES}

COPY . /app

RUN bundle config set --global force_ruby_platform true
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
