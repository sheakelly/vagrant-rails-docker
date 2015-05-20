FROM ruby:2.2.0

LABEL Description="This image created to test docker and rails inside a vagrant box" Version="1.0"

ENV http_proxy=http://10.0.2.2:3128/
ENV https_proxy=http://10.0.2.2:3128/
ENV HTTP_PROXY=http://10.0.2.2:3128/
ENV HTTPS_PROXY=http://10.0.2.2:3128/

RUN apt-get update -qq && apt-get install -y build-essential nodejs

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

ENV APP_HOME /myapp
RUN mkdir $APP_HOME

WORKDIR /tmp

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . $APP_HOME
WORKDIR $APP_HOME
RUN RAILS_ENV=production bundle exec rake assets:precompile --trace
CMD ["rails","server","-b","0.0.0.0"]
