#!/bin/bash

sed -i '/xdebug.remote_autostart = 1/d' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
ldconfig