#!/bin/bash

sh -c  "grep -q -F 'xdebug.remote_autostart = 1' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini || echo 'xdebug.remote_autostart = 1' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"
ldconfig