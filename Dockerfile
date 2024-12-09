FROM alpine:3.21.0

LABEL maintainer="Oleg Kovalenko <monstrenyatko@gmail.com>"

ARG SU_EXEC_VERSION=4c3bb42b093f14da70d8ab924b487ccfbb1397af

RUN buildDeps='build-base'; \
    set -ex && \
    apk update && apk upgrade && \
    apk add $buildDeps bash shadow curl libcap && \
    # su-exec
    curl -o /usr/local/bin/su-exec.c https://raw.githubusercontent.com/ncopa/su-exec/${SU_EXEC_VERSION}/su-exec.c && \
    gcc -Wall /usr/local/bin/su-exec.c -o /usr/local/bin/su-exec && \
    chown root:root /usr/local/bin/su-exec && \
    chmod 0755 /usr/local/bin/su-exec && \
    rm /usr/local/bin/su-exec.c && \
    # clean-up
    apk del $buildDeps && \
    rm -rf /root/.cache && mkdir -p /root/.cache && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

COPY /scripts /scripts
RUN chown -R root:root /scripts
RUN find /scripts -type f -exec chmod 0755 {} \;
