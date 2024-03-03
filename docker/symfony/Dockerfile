# Symfony Dockerfile

# Utiliser Alpine Linux comme image de base
FROM alpine:latest

# Installer PHP et les extensions nécessaires pour Symfony
RUN apk add --no-cache \
    php \
    php-fpm \
    php-pdo \
    php-pdo_mysql \
    php-pdo_pgsql \
    php-json \
    php-openssl \
    php-curl \
    php-zlib \
    php-xml \
    php-phar \
    php-intl \
    php-dom \
    php-xmlreader \
    php-ctype \
    php-session \
    php-mbstring \
    php-gd \
    php-iconv \
    php-tokenizer

# Installer les dépendances pour wget et tar
RUN apk add --no-cache wget tar

# Télécharger et installer Symfony CLI
RUN wget https://github.com/symfony-cli/symfony-cli/releases/latest/download/symfony-cli_linux_amd64.tar.gz -O symfony-cli.tar.gz
RUN tar -zxvf symfony-cli.tar.gz -C /usr/local/bin/ symfony
RUN rm symfony-cli.tar.gz

# Configurer le répertoire de travail
WORKDIR /var/www/symfony

# Installer Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Copier les fichiers de l'application Symfony (décommentez si nécessaire)
COPY . /var/www/symfony

# Installer les dépendances avec Composer (décommentez si nécessaire)
RUN composer install --optimize-autoloader

# Exposer le port utilisé par le serveur web Symfony
EXPOSE 8000

# Démarrer le serveur Symfony
CMD ["symfony", "server:start", "--no-tls", "--port=8000"]