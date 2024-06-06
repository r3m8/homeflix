FROM nginx:1.27.0-alpine

# Copy the local web directory to /var/www/html
COPY ./web /var/www/html
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf