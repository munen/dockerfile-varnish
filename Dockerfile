FROM alpine:3.6

ARG VERSION
RUN apk add --no-cache varnish=$VERSION && rm -rf /var/cache/apk/*

ENV VARNISH_CONFIG '/etc/varnish/default.vcl'
ENV VARNISH_CACHE_SIZE 512m
ENV VARNISH_PORT 80

EXPOSE $VARNISH_PORT

COPY entrypoint.sh /entrypoint.sh
COPY bluewin.vcl $VARNISH_CONFIG

ENTRYPOINT ["/entrypoint.sh"]