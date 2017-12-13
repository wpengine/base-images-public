# fluentd

A fluentd image based on fluent's official onbuild images. Includes additional fluentd plugins. In particular:

* [fluent-plugin-record-modifier](https://github.com/repeatedly/fluent-plugin-record-modifier)
* [fluent-plugin-secure-forward](https://github.com/tagomoris/fluent-plugin-secure-forward)
* [fluent-plugin-formatter_sprintf](https://github.com/toyama0919/fluent-plugin-formatter_sprintf)
* [fluent-plugin-bigquery](https://github.com/kaizenplatform/fluent-plugin-bigquery)

## How to use this image

Example run command:

```
docker run -d -p 24224:24224 -p 24224:24224/udp -v /data:/fluentd/log wpengine/fluentd
```

For additional documentation, refer to the base image readme at: https://github.com/fluent/fluentd-docker-image/blob/master/README.md#how-to-use-this-image
