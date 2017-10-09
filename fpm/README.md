# fpm

A minimal [fpm](https://github.com/jordansissel/fpm) image useful for packaging debs.

## usage

// Build a deb

```
docker run --rm -v `pwd`:/workspace wpengine/fpm \
    -s dir -t deb -p "artifacts" \
    --name "wpengine-package" \
    --description "WP Engine package" \
    --more options
    .
```
