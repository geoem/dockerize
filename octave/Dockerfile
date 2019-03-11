# Lightweight octave development environment
# Mount your local source folder to the container and run it inside the container.

# docker run --rm -it -v %cd%/src:/src octave:latest bash -c "octave /src/example.m"

FROM ubuntu:18.10
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y octave

RUN mkdir /src
VOLUME ["/src"]
WORKDIR /src