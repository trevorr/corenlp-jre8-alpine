FROM openjdk:8-jre-alpine

ARG CORENLP_VERSION=4.2.0

RUN apk add --no-cache unzip wget
RUN wget -O corenlp.zip http://nlp.stanford.edu/software/stanford-corenlp-${CORENLP_VERSION}.zip \
    && unzip corenlp.zip \
    && mv stanford-corenlp-${CORENLP_VERSION} corenlp \
    && rm corenlp.zip

WORKDIR /corenlp

ENV PORT 9000
EXPOSE $PORT

ARG JAVA_OPTIONS="-XX:MaxRAMPercentage=90.0"

CMD java $JAVA_OPTIONS -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer
