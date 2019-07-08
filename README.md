# nginx
docker run --name nginx -p 80
    -v /Users/fe/docker/volume/nginx/logs:/var/log/nginx \
    -v /Users/fe/docker/volume/nginx/html:/usr/share/nginx/html \
    -v /Users/fe/docker/volume/nginx/conf.d:/etc/nginx/conf.d \
    -v /Users/fe/docker/volume/nginx/stream.d:/etc/nginx/stream.d \
    -v /Users/fe/docker/volume/nginx/ssl:/etc/nginx/ssl \
    -d fine/nginx
