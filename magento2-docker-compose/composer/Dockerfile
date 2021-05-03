FROM magento_php

MAINTAINER David Belicza "87.bdavid@gmail.com"

RUN apt-get install -y \
    curl \
    unzip

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php

RUN php composer-setup.php \
    --install-dir=/usr/local/bin \
    --filename=composer

RUN rm composer-setup.php

WORKDIR /var/www/html
