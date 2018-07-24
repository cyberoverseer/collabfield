FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV APP /usr/src/app
RUN mkdir $APP
WORKDIR $APP

COPY Gemfile* $APP/
#RUN bundle install -j3 --path vendor/bundle
RUN bundle install

COPY . $APP/

#CMD ruby bin/rails server -p 8080 -b 0.0.0.0

#Uncomment this and comment out the above CMD if the backend container fails to up
CMD ["bundle", "exec", "rails", "server", "-p", "8080", "-b", "0.0.0.0"]