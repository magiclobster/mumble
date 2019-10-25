FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive
ARG APT_FLAGS_COMMON="-qq -y --no-install-recommends"

RUN apt-get update && apt-get install ${APT_FLAGS_COMMON} \
  mumble-server \
  procps \

RUN useradd -u 1000 mumble

COPY docker-assets/ /

RUN chown -R mumble:mumble /mumble

EXPOSE 64738 64738/udp

USER mumble
ENTRYPOINT ["/usr/sbin/murmurd", "-fg", "-ini", "/mumble/murmur.ini"]
