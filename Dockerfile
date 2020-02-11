FROM ruby:2.7.0

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install

COPY . /app

EXPOSE 8080

CMD ["puma","-C","./etc/puma.rb"]
