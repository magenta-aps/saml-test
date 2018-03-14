cd /etc/apache2

# Adjust Apache ports.conf to listen on port 8000
echo "
# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80
Listen 8080
Listen 8081
Listen 8082

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
" > ports.conf

# Create an Apache VirtualHost configuration for the DH GUI
cd /etc/apache2/sites-available
echo "
<VirtualHost *:8080>
    
    DocumentRoot /vagrant/www/dist

    <Directory "/vagrant/www/dist">
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
" > dh-gui.conf

# Enable new VirtualHost configurations
a2ensite dh-gui.conf

# Reload Apache
systemctl reload apache2
