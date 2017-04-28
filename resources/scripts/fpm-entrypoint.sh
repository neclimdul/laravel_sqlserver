#!/bin/sh

if grep -q 'SQLDB' /etc/freetds.conf; then
	echo "Skipping freetds config."
else
	cat <<EOF | tee -a /etc/freetds.conf
[SQLDB]
  host = db
  port = 1433
  tds version = 8.0
  client charset = UTF-8
EOF
fi

chown -R www-data:www-data /var/www/html/storage/

MigrateAndSeed()
{
	sleep 5
	php artisan migrate --seed
}
MigrateAndSeed &

#/usr/local/bin/docker-php-entrypoint $@
php-fpm "$@"

