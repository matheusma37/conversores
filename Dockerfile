FROM ruby:2.7.5-slim as Builder

RUN apt-get update \
  && apt-get install -y curl wget \
  make \
  gcc \
  g++ \
  git \
  ca-certificates \
  build-essential \
  shared-mime-info \
  tzdata \
  curl \
  locales

RUN update-ca-certificates \
  && wget --no-check-certificate -P /usr/local/share/ca-certificates/ https://dl.cacerts.digicert.com/RapidSSLTLSRSACAG1.crt \
  && update-ca-certificates

ARG APP_PATH=/opt/app/
WORKDIR $APP_PATH

# Add the app
COPY . $APP_PATH

# Install gems
RUN export BUNDLER_VERSION=$(awk '/BUNDLED WITH/ { getline ; print $1 }' Gemfile.lock) \
  && gem install bundler --version $BUNDLER_VERSION \
  && gem install json \
  && bundle config without development test \
  && bundle install -j4 --retry 3 \
  && rm -rf /usr/local/bundle/cache/*.gem \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete

RUN curl -sLo /bin/gosu https://github.com/tianon/gosu/releases/download/1.12/gosu-amd64 \
  && chmod +x /bin/gosu

################################
# Final image
FROM ruby:2.7.5-slim

# Add packages
RUN apt-get update \
  && apt-get install -y tzdata ca-certificates shared-mime-info bash curl locales

RUN update-ca-certificates

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
ARG LOCAL_TIME=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$LOCAL_TIME /etc/localtime

# App path
ARG APP_PATH=/opt/app/
WORKDIR $APP_PATH

# Creating user
ENV APP_USER main_user
RUN addgroup --gid 997 ${APP_USER} \
  && adduser --disabled-password --no-create-home --gecos "" --home ${APP_PATH} --uid 1001 --gid 997 ${APP_USER}

# Copy app with gems from former build stage
COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder --chown=1001:997 $APP_PATH $APP_PATH
COPY --from=Builder /bin/gosu /bin/gosu

RUN chown -Rf 1001:997 $APP_PATH

CMD ["bundle", "check"]
