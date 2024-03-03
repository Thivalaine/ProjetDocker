# Symfony Dockerfile

# Utiliser Alpine Linux comme image de base
FROM alpine:latest

# Installer PHP et les extensions nécessaires pour Symfony
RUN apk add --no-cache \
    php \
    php-fpm \
    php-pdo \
    php-pdo_mysql \
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

# Configurer le répertoire de travail
WORKDIR /var/www/symfony

# Installer Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Copier les fichiers de l'application Symfony (décommentez si nécessaire)
COPY . /var/www/symfony

# Installer les dépendances avec Composer (décommentez si nécessaire)
RUN composer install --no-dev --optimize-autoloader

# Exposer le port (définissez le port selon votre configuration)
EXPOSE 80

# Commande pour démarrer le serveur PHP (ajustez selon vos besoins)
CMD php -S 0.0.0.0:80 -t public
