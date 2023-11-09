mysql --user="root" --password="qwerty" --execute="CREATE DATABASE wpdatabase;
CREATE USER wpuser@localhost IDENTIFIED BY 'qwerty';
GRANT ALL PRIVILEGES ON wpdatabase.* TO wpuser@localhost;
FLUSH PRIVILEGES;
EXIT"

echo "Installerin Wordpressi"
wget -P /var/www/html https://wordpress.org/latest.tar.gz
tar xvzf /var/www/html/latest.tar.gz -C /var/www/html

chown -R www-data:www-data /var/www/html/wordpress

cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i "s/wordpress/wpdatabase/g" /var/www/html/wordpress/wp-config.php
echo "Valiti andmebaasiks wordpress"
sed -i "s/root/wpuser/g" /var/www/html/wordpress/wp-config.php
echo "Valiti kasutaja nimeks root"
sed -i "s/qwerty/qwerty/g" /var/www/html/wordpress/wp-config.php
echo "Valiti kasutaja parooliks seda, mida ennem valiti"

sed -i 's/\/var\/www\/html/\/var\/www\/html\/wordpress/g' /etc/apache2/sites-available/000-default.conf

systemctl restart apache2
