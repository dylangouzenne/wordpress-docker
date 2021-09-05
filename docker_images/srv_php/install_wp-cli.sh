#!/bin/bash

set -u

# Vérifier que le serveur MySQL et pret a réponde au requette avant de lancer l'install de wordpress
cmpt=1
until timeout 2 bash -c "echo 2> /dev/null >/dev/tcp/${MYSQL_HOST}/3306" 
do
    echo -n "\rTest n°$cmpt ExitCode = $? Attente de réponse du serveur MySQL..."
    cmpt=$(($cmpt+1))
    sleep 1
done
    echo "\nTest n°$cmpt ExitCode = $? Le serveur MySQL est prêt!"

# Téléchargement des sources de la dernière version de wordpress
wp core download 

# Création et configuration du fichier wp-config.php
wp core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --dbprefix=${MYSQL_TABLE_PREFIX} --extra-php <<- EOF
    define( 'WP_DEBUG', true ); 
    define( 'WP_DEBUG_LOG', true ); 
EOF

# Création de la base de donnée avec les paramètre du fichier wp-config.php
wp db create

# Réalisation de l'instalation du site : définition de l'url d'accès, du titre du site et pour finir création du compte admin
wp core install --url=${WORDPRESS_URL} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL}

# Téléchargement et activation du thème a utiliser
wp theme install twentytwenty --activate

exec "$@"