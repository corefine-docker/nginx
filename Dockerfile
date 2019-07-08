FROM nginx
RUN mkdir /etc/nginx/ssl
RUN mkdir /etc/nginx/stream.d
RUN echo "stream {" >> /etc/nginx/nginx.conf
RUN echo "    include /etc/nginx/stream.d/*.conf;" >> /etc/nginx/nginx.conf
RUN echo "}" >> /etc/nginx/nginx.conf
