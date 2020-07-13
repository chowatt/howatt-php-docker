from php:apache
RUN apt-get update && apt-get install -y git libc-client-dev libkrb5-dev libxml2-dev libbz2-dev zlib1g-dev libpng-dev libicu-dev libldap2-dev && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-install pdo_mysql mysqli gd intl ldap xmlrpc

RUN apt-get update && apt-get install -y libzip* && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-install zip opcache exif
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && docker-php-ext-install imap

RUN curl https://getcomposer.org/installer | php && mv composer.phar /bin
