mkdir -p /var/www/unocorporativo.hexome.cloud/html/ /var/www/unocorporativo.hexome.cloud/log/ && echo > /var/www/unocorporativo.hexome.cloud/log/request.log /var/www/unocorporativo.hexome.cloud/log/error.log /var/www/unocorporativo.hexome.cloud/html/index.html
chown -R www-data:www-data /var/www/unocorporativo.hexome.cloud/
cp /etc/apache2/sites-available/000-keka.hexome.cloud.conf /etc/apache2/sites-available/000-unocorporativo.hexome.cloud.conf
sed -i 's/keka/unocorporativo/g' /etc/apache2/sites-available/000-unocorporativo.hexome.cloud.conf
a2ensite 000-unocorporativo.hexome.cloud
systemctl reload apache2
echo '

[unocorporativo]
        writeable = yes
        force user = www-data
        public = yes
        path = /var/www/unocorporativo.hexome.cloud/html/
        guest account = www-data
        create mode = 644
        force group = www-data' >> /etc/samba/smb.conf.shares
systemctl restart smbd

date 
