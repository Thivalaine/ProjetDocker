# Postgres Dockerfile

# Utiliser l'image Alpine de base pour PostgreSQL
FROM alpine:latest

# Installation de PostgreSQL
RUN apk --no-cache add postgresql postgresql-client

# Cration d'un répertoire pour stocker les données PostgreSQL
RUN mkdir -p /var/lib/postgresql/data

# utilisateur postgres comme propriétaire du répertoire de données
RUN chown -R postgres:postgres /var/lib/postgresql/data

RUN mkdir -p /run/postgresql && chown -R postgres:postgres /run/postgresql


# Configuration de l'environnement pour PostgreSQL
ENV PGDATA=/var/lib/postgresql/data

# Exposition sur le port
EXPOSE 5432

# initialisation de la base de données
USER postgres
RUN initdb -D $PGDATA

# Ajout du fichier de configuration  dans le bon répertoire
COPY postgresql.conf /etc/postgresql/postgresql.conf
# COPY pg_hba.conf /var/lib/postgresql/data
COPY pg_hba.conf /etc/postgresql/pg_hba.conf

# Commande de démarrage de PostgreSQL
CMD ["postgres", "-D", "/var/lib/postgresql/data", "-c", "config_file=/etc/postgresql/postgresql.conf"]
