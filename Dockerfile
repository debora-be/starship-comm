FROM ruby:3

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY app.rb .
COPY public ./public
COPY app/views ./app/views
COPY inventory.csv .

EXPOSE 4567

ENV WEB_CONCURRENCY=10

CMD ["ruby", "app.rb"]
