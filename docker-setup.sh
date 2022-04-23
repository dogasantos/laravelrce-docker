#!/bin/bash
# credits: https://hackmag.com/coding/laravel-ignition-rce/

apt update
apt install -y vim curl unzip nginx php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-mysql php-cli php-zip php-curl php-pear php-dev python xxd libfcgi 
# fix for: "ext-dom * -> it is missing":
apt install -y php-xml php-mbstring

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

sed -i -E 's|index index|index index.php index|g' /etc/nginx/sites-enabled/default
sed -i -E 's|try_files \$uri.*|try_files \$uri \$uri/ /index.php?\$query_string;|g' /etc/nginx/sites-enabled/default
sed -i -E 's|#location ~ \\\.php\$ \{|location ~ \\.php\$ {\n\t\tinclude snippets/fastcgi-php.conf;\n\t\tfastcgi_pass 127.0.0.1:9000;\n\t}|g' /etc/nginx/sites-enabled/default

sed -i -E 's|listen = .*|listen = 127.0.0.1:9000|g' /etc/php/7.*/fpm/pool.d/www.conf


