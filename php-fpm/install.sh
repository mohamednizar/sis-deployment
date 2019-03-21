echo 'install php dependencies'

apt-get update && \
apt-get install  php7.2-gd  php7.2-mysql php7.2-intl php7.2-mbstring php7.2-sqlite3;

mkdir /etc/php/7.2/fpm/conf.d
cp ./php-ini-overrides.ini /etc/php/7.2/fpm/conf.d/99-overrides.ini
cp ./overrides.conf /etc/php/7.1/fpm/pool.d/z-overrides.conf

git clone https://github.com/moe-lk/sis.git

cp sis/php-fpm/app /src

 rm -rf /var/www/html && mv /src /var/www/html &&\
    find /var/www/html/ -type d -exec chmod 777 {} \; &&\
    find /var/www/html/ -type f -exec chmod 644 {} \; &&\
    find /var/www/html/tmp -type d -exec chmod 777 {} \; &&\
    find /var/www/html/logs -type d -exec chmod 777 {} \; 



