ARG PHP_USER_GROUP=33
ARG PHP_USER_ID=33
ARG DOCKER_HOST_OS
ARG XDEBUG_HOST

FROM wpengine/php:7.2
LABEL maintainer="chris.wiegman@wpengine.com"

# set the php user so the entrypoint script can get it.
ENV PHP_USER_GROUP ${PHP_USER_GROUP}
ENV PHP_USER_ID ${PHP_USER_ID}
ENV DOCKER_HOST_OS ${DOCKER_HOST_OS}
ENV XDEBUG_HOST ${XDEBUG_HOST}
ENV IS_WPE_LOCAL_DEV true
ENV WPE_API_KEY ${WPE_API_KEY}

# Install XDebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

ADD xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

ADD xdebug-listen-on.sh /usr/local/bin/xlon.sh
RUN chmod +x /usr/local/bin/xlon.sh

ADD xdebug-listen-off.sh /usr/local/bin/xloff.sh
RUN chmod +x /usr/local/bin/xloff.sh

# Install PHPUnit
RUN curl -L phpunit https://phar.phpunit.de/phpunit-7.phar > /tmp/phpunit.phar \
    && chmod +x /tmp/phpunit.phar \
    && mv /tmp/phpunit.phar /usr/local/bin/phpunit

# nvm environment variables
ENV NODE_VERSION 11.1.0
ENV NVM_VERSION 0.33.11
ENV NVM_DIR /usr/local/nvm

RUN apt-get update && apt-get install -y \
  apt-transport-https \
  git \
  gnupg \
  mysql-client \
  unzip \
  wget \
  subversion \
  vim \
  zip

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
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN rm composer-setup.php

# Install WP-CLI
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Let's do a little cleanup
RUN apt-get purge -y libz-dev libc6-dev build-essential
RUN apt-get autoremove --purge -y
RUN apt-get clean

COPY ./entrypoint.sh /