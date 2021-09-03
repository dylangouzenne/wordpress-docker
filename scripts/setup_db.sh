#!/bin/bash

cd /var/www/html

db_password=$(aws ssm get-parameter --region=eu-north-1 --name "db_password_groupe_1" --with-decryption --output json | jq -r '.Parameter.Value
')

sed -i -e "s/database_name_here/wordpress_prod/" wp-config-sample.php
sed -i -e "s/username_here/groupe1/" wp-config-sample.php
sed -i -e "s/localhost/db-groupe1.cycsrehdk0xg.eu-north-1.rds.amazonaws.com:3306/" wp-config-sample.php
sed -i -e 's/password_here/'"$db_password"'/' wp-config-sample.php

rm wp-config.php
mv wp-config-sample.php wp-config.php