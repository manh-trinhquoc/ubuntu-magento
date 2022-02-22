FROM php:7.4-fpm
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

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN apt-get -y update \
  && apt-get install -y libicu-dev \ 
  && docker-php-ext-configure intl \
  && docker-php-ext-install intl

WORKDIR /var/www/  

RUN mkdir /tmp/magento

RUN apt-get update -y \ 
  && apt-get install -y  libxml2-dev   \ 
  && apt-get clean -y \ 
  && docker-php-ext-install soap

RUN apt-get update && \
    apt-get install -y libxslt1-dev && \
    docker-php-ext-install xsl && \
    apt-get remove -y libxslt1-dev icu-devtools libicu-dev libxml2-dev && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update; \
    # Imagick extension
    apt-get install -y libmagickwand-dev; \
    pecl install imagick; \
    docker-php-ext-enable imagick;

RUN docker-php-ext-install sockets