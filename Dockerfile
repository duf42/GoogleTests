#
# Reuse image from https://github.com/coenvl/googletest-docker/blob/master/Dockerfile
#

FROM alpine:latest

RUN apk add --no-cache -q -f git cmake make g++

RUN git clone -q https://github.com/google/googletest.git /googletest \
  && mkdir -p /googletest/build \
  && cd /googletest/build \
  && cmake .. && make && make install \
  && cd / && rm -rf /googletest

RUN mkdir /tests
RUN mkdir /tests/bin
RUN mkdir /tests/src

ADD .docker/main.cpp /tests/main.cpp
ADD .docker/Makefile /tests/Makefile
ADD .docker/runtests.sh /tests/runtests.sh
RUN chmod +x /tests/runtests.sh

ENTRYPOINT [ "/tests/runtests.sh" ]
