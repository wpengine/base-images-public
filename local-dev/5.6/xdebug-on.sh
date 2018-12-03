#!/bin/bash

sed -i '1s/^/zend_extension=\/usr\/local\/lib\/php\/extensions\/no-debug-non-zts-20131226\/xdebug.so\n/' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
ldconfig