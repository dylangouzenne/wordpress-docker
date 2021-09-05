#!/bin/bash

# Variables environnement de la base de données

MYSQL_HOST="db-groupe1.cycsrehdk0xg.eu-north-1.rds.amazonaws.com:3306"
MYSQL_USER="groupe1" # valeur a remplacer par des param aws ssm
MYSQL_PASSWORD=$(aws ssm get-parameter --region=eu-north-1 --name "db_password_groupe_1" --with-decryption --output json | jq -r '.Parameter.Value')
MYSQL_DATABASE="wordpress_prod"
MYSQL_TABLE_PREFIX="wp_"

# Variables environnement de wordpress

WORDPRESS_ADMIN_USER="admin" # valeur a remplacer par des param aws ssm
WORDPRESS_ADMIN_PASSWORD="admin123" # valeur a remplacer par des param aws ssm
WORDPRESS_ADMIN_EMAIL="my@email.com" # valeur a remplacer par des param aws ssm
WORDPRESS_TITLE="wp-groupe1"
WORDPRESS_URL="http://localhost" # a voir si fonctionne et si il ne fait pas remplacer par l'adresse de l'eip