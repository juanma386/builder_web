curl -O https://raw.githubusercontent.com/juanma386/builder_web/main/website.conf
sed -i 's/example.com/example.com/' website.conf
cp website.conf /etc/apache2/sites-available/000-example.com.conf

/var/www/example.com/log/error.log
/var/www/example.com/log/requests.log
mkdir -p /var/www/example.com/html /var/www/example.com/log/
echo '' > /var/www/example.com/log/error.log /var/www/example.com/log/requests.log
a2ensite 000-example.com.conf
systemctl reload apache2
certbot certonly --cert-name example.com -d example.com,www.example.com 
