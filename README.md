# corenlp-jre8-alpine

Minimalist Docker image for running [CoreNLP](https://stanfordnlp.github.io/CoreNLP) with OpenJDK 8 on Alpine Linux.

Relies on the [UseContainerSupport](https://merikan.com/2019/04/jvm-in-a-container/) JVM option (added in Java 8u191) for automatic heap sizing. **Setting `-Xmx` or `-Xms` will disable this behavior.**

Tested with CoreNLP 4.2.0.

## Building

```sh
docker build --tag corenlp-jre8-alpine .
```

## Running

```sh
docker run -m 4g --publish 9000:9000 --detach --name corenlp corenlp-jre8-alpine
```

## Build/push for multiple architectures

The following is just an example. You'll need to use your own Docker Hub username.

```sh
CORENLP_VERSION=4.2.0
docker buildx build --push --platform linux/amd64,linux/arm64 --build-arg CORENLP_VERSION=$CORENLP_VERSION --tag scurrilous/corenlp-jre8-alpine:$CORENLP_VERSION --tag scurrilous/corenlp-jre8-alpine:latest .
```
