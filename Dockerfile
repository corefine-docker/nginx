FROM alpine:3.11
LABEL maintainer="DYNAMIC NGINX Docker Maintainers <fe@corefine.org>"
RUN echo "https://mirrors.aliyun.com/alpine/v3.11/main/" > /etc/apk/repositories
ADD nginx /src/nginx
RUN set -x \
        && apk upgrade \
        && apk add --no-cache --virtual .build-deps \
                gcc \
                libc-dev \
                make \
                openssl-dev \
                pcre-dev \
                zlib-dev \
                linux-headers \
                libxslt-dev \
                gd-dev \
                geoip-dev \
                perl-dev \
                libedit-dev \
                mercurial \
                bash \
                alpine-sdk \
                findutils \
       && chown -R nobody:nobody /src \
       && /src/nginx/make.sh \
       && apk del .build-deps \
       && rm -rf /src \
EXPOSE 80
STOPSIGNAL SIGQUIT
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
