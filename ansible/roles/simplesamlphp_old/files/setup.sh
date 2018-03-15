# Create an Apahce VirtualHost configuration for SimpleSAMLPHP
echo "
<VirtualHost *:8081>
    
    # DocumentRoot /usr/share/simplesamlphp/www

    SetEnv SIMPLESAMLPHP_CONFIG_DIR /usr/share/simplesamlphp/config

    Alias "/simplesamlphp" "/usr/share/simplesamlphp/www"

    <Directory /usr/share/simplesamlphp/www>
        <IfModule mod_authz_core.c>
            # For Apache 2.4:
            Require all granted
        </IfModule>
    </Directory>
</VirtualHost>
" > /etc/apache2/sites-available/simplesaml.conf 

# Enable new VirtualHost configurations
cd /etc/apache2/sites-available
a2ensite simplesaml.conf

# Reload Apache
systemctl reload apache2

# Configure SimpleSamlPHP
## Set admin password
echo "
******************************
**** !UNSECURE PASSWORD! *****
******************************
To install automatically, we added a non-random password to the simplesamlphp config. This is BAD BAD BAD!
Please do it manually as instructed in https://simplesamlphp.org/docs/stable/simplesamlphp-install

"
sed -i "s/\/\/'auth.adminpassword' => '123',/'auth.adminpassword' => 'hesthesthest',/" /usr/share/simplesamlphp/config/config.php

## Generate and set secret salt
echo "
**************************
**** !UNSECURE SALT! *****
**************************
To install automatically, we added a non-random secret salt to the simplesamlphp config. This is BAD BAD BAD!
Please do it manually as instructed in https://simplesamlphp.org/docs/stable/simplesamlphp-install

"
sed -i "s/\/\/'secretsalt' => 'defaultsecretsalt',/'secretsalt' => 'qgzsu2f5a2sjrijik4tl2emsu0f4wfnl',/" /usr/share/simplesamlphp/config/config.php

## Set technical support contact info
sed -i "s/'technicalcontact_name' => 'Administrator',/'technicalcontact_name' => 'Administrator',/" /usr/share/simplesamlphp/config/config.php
sed -i "s/'technicalcontact_email' => 'na@example.org',/'technicalcontact_email' => 'admin@admin.test',/" /usr/share/simplesamlphp/config/config.php

## Set language
sed -i "s/'language.default' => 'en',/'language.default' => 'da',/" /usr/share/simplesamlphp/config/config.php
