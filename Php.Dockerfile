FROM php:8.1-fpm
RUN apt-get update 
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo pdo_mysql 

RUN apt-get update -y && apt-get install -y zlib1g-dev libjpeg-dev libpng-dev  libfreetype6-dev  libwebp-dev \
    libjpeg62-turbo-dev \
     libgmp-dev \
    libldap2-dev 
RUN docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
   && php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
   && php composer-setup.php \
   && php -r "unlink('composer-setup.php');" \
  &&  mv composer.phar /usr/local/bin/composer