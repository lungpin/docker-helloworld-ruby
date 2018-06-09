FROM alpine

RUN apk update && \
  apk upgrade && \
  apk add ruby ruby-io-console ruby-bundler && \
  rm -rf /var/cache/apk/*

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

ENV APP_PATH /app/
RUN mkdir $APP_PATH
WORKDIR $APP_PATH

COPY . $APP_PATH


ENV PORT 8080
EXPOSE $PORT

CMD ["ruby", "/app/main.rb"]
