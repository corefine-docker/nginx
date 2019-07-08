FROM nginx
RUN mdkir /etc/nginx/ssl
RUN echo "stream {" >> /etc/nginx/nginx.conf
RUN echo "    include /etc/nginx/conf.d/*.conf;" >> /etc/nginx/nginx.conf
RUN echo "}" >> /etc/nginx/nginx.conf
