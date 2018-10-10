ARG PHP_USER_GROUP=33
ARG PHP_USER_ID=33

FROM wordpress:cli-php7.0 as wpcli
FROM wpengine/php:7.0

RUN apt-get update && apt-get install -y \
  apt-transport-https \
  git \
  gnupg \
  mysql-client \
  subversion \
  unzip \
  vim \
  wget \
  zip

# set the php user so the entrypoint script can get it.
ENV PHP_USER_GROUP ${PHP_USER_GROUP}
ENV PHP_USER_ID ${PHP_USER_ID}

# nvm environment variables
ENV NODE_VERSION 10.11.0
ENV NVM_VERSION 0.33.11
ENV NVM_DIR /usr/local/nvm

# Install nvm
# https://github.com/creationix/nvm#install-script
RUN mkdir $NVM_DIR
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash

# Install Node and npm
RUN . $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm alias default $NODE_VERSION \
  && nvm use default

# Add Node and npm to path so the commands are available.
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Add Yarn package repository.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Remove cmdtest which conflicts with Yarn.
RUN apt-get remove cmdtest
# Now install Yarn!
RUN apt-get update && apt-get install -y yarn

# Install common Node tools.
RUN yarn global add \
  grunt-cli \
  gulp-cli

# Log PHP errors to stderr.
RUN echo "log_errors = On\nerror_log = /dev/stderr" > /usr/local/etc/php/php.ini

# Install composer.
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install WP-CLI
COPY --from=wpcli /usr/local/bin/wp /usr/local/bin/wp

COPY ./entrypoint.sh /