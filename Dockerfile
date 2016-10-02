FROM ruby:2.3.1

RUN mkdir -p /tod
WORKDIR /tod

COPY . /tod

RUN bundle install

CMD irb
