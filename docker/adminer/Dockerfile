# Utiliser Alpine Linux comme image de base
FROM alpine:latest

# Installer PHP et les extensions nécessaires
RUN apk add --no-cache \
    php \
    php-fpm \
    php-pdo \
    php-pdo_mysql \
    php-json \
    php-session \
    php-simplexml \
    php-mbstring \
    php-pdo_pgsql

# Créer le répertoire pour les fichiers web
RUN mkdir -p /var/www/html

# Télécharger Adminer et le placer dans le répertoire approprié
RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/html/adminer.php

# Configurer le répertoire de travail pour les fichiers web
WORKDIR /var/www/html

# Exposer le port 8080 pour le serveur web
EXPOSE 8080

# Utiliser le serveur web intégré de PHP pour servir Adminer
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
