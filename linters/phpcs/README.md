# phpcs

A minimal `phpcs` image useful for linting PHP files.

## configuration

This image supports linting for WordPress Core Standards, PHP Compatibility, and any library provided by [phpcs](https://github.com/squizlabs/PHP_CodeSniffer) including PSR-2.

### PHP Compatibility Example:

```
docker run --rm -v `pwd`:/workspace wpengine/phpcs /workspace --standard=PHPCompatibility --runtime-set testVersion 7.2-
```

### WordPress Core Standards Example:

```
docker run --rm -v `pwd`:/workspace wpengine/phpcs /workspace --standard=WordPress
```

### PSR-2 Example:

```
docker run --rm -v `pwd`:/workspace wpengine/phpcs /workspace --standard=PSR2
```

### Using your own phpcs.xml

```
docker run --rm -v `pwd`:/workspace wpengine/phpcs /workspace --standard=./phpcs.xml
```
