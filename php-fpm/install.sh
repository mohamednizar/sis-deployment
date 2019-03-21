echo 'install php dependencies'

apt-get update && \
apt-get install php-fpm  php7.2-gd  php7.2-mysql php7.2-intl php7.2-mbstring php7.2-sqlite3;

mkdir /etc/php/7.2/fpm/conf.d


git clone https://github.com/moe-lk/sis.git

mkdir /src
mkdir /var/www/html 
mkdir /etc/php/7.2/conf.d

cat ./php-ini-overrides.ini >> /etc/php/7.2/fpm/conf.d/99-overrides.ini
cat ./overrides.conf >> /etc/php/7.2/fpm/pool.d/z-overrides.conf

cp sis/php-fpm/app/* /var/www/html

find /var/www/html/ -type d -exec chmod 777 {} \; &&\
find /var/www/html/ -type f -exec chmod 644 {} \; &&\
find /var/www/html/tmp -type d -exec chmod 777 {} \; &&\
find /var/www/html/logs -type d -exec chmod 777 {} \; 


chown -R www-data:www-data /var/www

sed -ri 's/^www-data:x:82:82:/www-data:x:1000:50:/' /etc/passwd


service start php-fpm7.2