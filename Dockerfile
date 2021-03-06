ARG phpver
FROM php:${phpver}

RUN apt-get update \
    && apt-get install -y --yes libfann-dev \
    && yes '' | pecl install -f fann \
    && docker-php-ext-enable fann
