# Adjust Apache ports.conf to listen on port 8000
echo "
# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80
Listen 8000

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
" > /etc/apache2/ports.conf

# Create an Apache VirtualHost configuration for the DH GUI
echo "
<VirtualHost *:8000>
    
    ServerAdmin webmaster@localhost
    DocumentRoot /vagrant/www/dist

    <Directory "/vagrant/www/dist">
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
" > /etc/apache2/sites-available/dh-gui.conf

# Create an Apahce VirtualHost configuration for SimpleSAMLPhp
echo "
<VirtualHost *:8081>
    ServerName service.example.com
    DocumentRoot /var/www/service.example.com

    SetEnv SIMPLESAMLPHP_CONFIG_DIR /usr/share/simplesamlphp/config

    Alias /simplesaml /usr/share/simplesamlphp/www

    <Directory /usr/share/simplesamlphp/www>
        <IfModule mod_authz_core.c>
            # For Apache 2.4:
            Require all granted
        </IfModule>
    </Directory>
</VirtualHost>
" > /etc/apache2/sites-available/simplesaml.conf 

# Enable new VirtualHost configurations
a2ensite /etc/apache2/sites-available/dh-gui.conf
a2ensite /etc/apache2/sites-available/simplesaml.conf

# Reload Apache
systemctl reload apache2