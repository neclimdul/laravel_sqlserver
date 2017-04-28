FROM php:7.1-fpm-alpine
MAINTAINER James Gilliland <jgilliland@apqc.org>

# COPY php.ini /usr/local/etc/php/
COPY . /var/www/html

ENV buildDeps="autoconf file g++ gcc binutils isl libatomic libc-dev musl-dev make re2c libstdc++ libgcc binutils-libs mpc1 mpfr3 gmp-dev coreutils wget git openssh-client freetds-dev"

RUN apk -U upgrade && apk add $buildDeps \
          libltdl \
          gmp \
          freetds \
  && docker-php-ext-install iconv mbstring pdo pdo_dblib gmp \
  && apk del $buildDeps \
  && rm -rf /tmp/* \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /root/.ssh \
  && sed -i "3 a chown -R www-data:www-data /var/www/html/storage/" /usr/local/bin/docker-php-entrypoint
