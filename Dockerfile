FROM nginx:1.27.0-alpine

COPY ./web /var/www/html
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf