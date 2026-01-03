#!/bin/sh
set -e

# 1. Check if the database is already initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing database..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
    
    # Start a temporary server to set up the root password
    mariadbd --user=mysql --datadir=/var/lib/mysql --skip-networking &
    pid="$!"

    # Wait for it to start
    for i in {30..0}; do
        if mariadb-admin ping >/dev/null 2>&1; then
            break
        fi
        sleep 1
    done

    # Set the root password and create the WordPress database
    mariadb -u root <<EOSQL
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '${MYSQL_USER}'@'%';

FLUSH PRIVILEGES;
EOSQL

    # Shut down the temporary server
    mariadb-admin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

fi

# 2. Start the actual server in the foreground
echo "Starting MariaDB..."
exec mariadbd --user=mysql --datadir=/var/lib/mysql --skip_networking=0