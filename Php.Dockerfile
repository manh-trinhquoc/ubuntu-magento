FROM php:7.1-fpm
RUN apt-get update 
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo pdo_mysql 

RUN apt-get update -y
RUN docker-php-ext-install mbstring

RUN apt-get update -y && apt-get install -y zlib1g-dev libjpeg-dev libpng-dev  libfreetype6-dev  libwebp-dev \
    libjpeg62-turbo-dev \
     libgmp-dev \
    libldap2-dev 
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd