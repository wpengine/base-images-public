FROM fluent/fluentd:v1.0.0-onbuild

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install \
        fluent-plugin-record-modifier \
        fluent-plugin-secure-forward \
        fluent-plugin-formatter_sprintf \
        fluent-plugin-bigquery:1.2.0 \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem
