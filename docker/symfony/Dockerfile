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

# Copier les fichiers de l'application Symfony
COPY . /var/www/symfony

# Créer le répertoire var/cache s'il n'existe pas
RUN mkdir -p /var/www/symfony/var/cache

# Créer les répertoires var/cache et var/log s'ils n'existent pas et définir les permissions adéquates
RUN mkdir -p /var/www/symfony/var/cache /var/www/symfony/var/log \
    && chmod -R 777 /var/www/symfony/var/cache /var/www/symfony/var/log

# Exposer le port utilisé par le serveur web Symfony
EXPOSE 8000

# Démarrer le serveur Symfony
CMD ["symfony", "server:start", "--no-tls", "--port=8000"]
