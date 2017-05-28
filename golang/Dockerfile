FROM golang:1.8

# Install gometalinter
RUN set -ex; \
    go get -u -v github.com/alecthomas/gometalinter; \
	gometalinter --install;

# Install Glide
ENV GLIDE_VERSION 0.12.3
ENV GLIDE_SHA1 4d13f6a61e7325c8166629f00a4cb560d8a317c7
RUN set -ex; \
    curl -o glide.tar.gz -fSL "https://github.com/Masterminds/glide/releases/download/v$GLIDE_VERSION/glide-v$GLIDE_VERSION-linux-amd64.tar.gz"; \
    echo "$GLIDE_SHA1 *glide.tar.gz" | sha1sum -c -; \
    mkdir -p /tmp/glide; \
    tar -xf glide.tar.gz -C /tmp/glide/; \
    cp /tmp/glide/linux-amd64/glide /usr/bin/; \
    rm -rf /tmp/glide glide.tar.gz

