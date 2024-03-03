# Composer Dockerfile

# Utiliser Alpine comme image de base
FROM alpine:latest

# Mettre à jour les paquets et installer PHP, les extensions nécessaires, et Composer
RUN apk update && \
    apk add --no-cache php php-cli php-json php-phar php-mbstring php-openssl \
    php-ctype php-iconv php-xml php-session php-dom && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Définir le répertoire de travail
WORKDIR /app

# Définir l'entrée par défaut pour Composer
ENTRYPOINT ["composer"]
