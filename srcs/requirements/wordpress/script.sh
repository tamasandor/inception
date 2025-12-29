#!/bin/sh

# cp wordpress/wp-config-sample.php wordpress/wp-config.php

# echo wordpress/wp-config.php

# echo infuse db name
# sed -i "s/database_name_here/$MYSQL_NAME/g" wordpress/wp-config.php
# echo infuse db user
# sed -i "s/username_here/$MYSQL_USER/g" wordpress/wp-config.php
# echo infuse db password
# sed -i "s/password_here/$MYSQL_PASSWORD/g" wordpress/wp-config.php
# echo infuse db host
# sed -i "s/localhost/$DB_NAME/g" wordpress/wp-config.php

cp -r wordpress/* /var/www/html

ls /usr/sbin/php-fpm*

ls -la /usr/share/webapps
cd /var/www/html

# until mariadb -h "$DB_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SELECT 1;" &> /dev/null; do
#   echo "Waiting for DB..."
#   sleep 2
# done
echo Wait 4 second for DB
sleep 4
echo Change listen to 0.0.0.0:9000
sed -i "s/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g" /etc/php83/php-fpm.d/www.conf
if ! wp core is-installed 2>/dev/null; then
    echo -e "\033[38;5;9mWordpress is not configured...\033[0m"
    echo -e "\033[38;5;10mConfiguring Wordpress...\033[0m"
    wp config create --dbname="$MYSQL_NAME" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost=$DB_NAME --allow-root
    wp core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_EMAIL --skip-email --allow-root
    wp user create $WP_USER  $WP_EMAIL --user_pass=$WP_USER_PASS --role=author
else
    echo Wordpress is already configured
    echo -e "\033[38;5;10m Continue\033[0m"
fi
# rm wp-config.php

# chmod -R 777 /var/www/html
# cat /etc/php83/php-fpm.d/www.conf

exec php-fpm83 -F
