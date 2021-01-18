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
       && cp /usr/lib/libpcre.so.1 /src/nginx/libpcre.so.1 \
       && apk del .build-deps \
       && cp /src/nginx/libpcre.so.1 /usr/lib/libpcre.so.1 \
       && rm -rf /src \
       && apk add bash \
       && echo build is over!
RUN mkdir /etc/nginx/ssl
RUN mkdir /etc/nginx/stream.d
RUN echo "stream {" >> /etc/nginx/nginx.conf
RUN echo "    include /etc/nginx/stream.d/*.conf;" >> /etc/nginx/nginx.conf
RUN echo "}" >> /etc/nginx/nginx.conf
RUN \cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
EXPOSE 80
STOPSIGNAL SIGQUIT
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
