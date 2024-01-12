FROM php:apache-bullseye
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
WORKDIR /var/www/html
COPY website/. .
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80

