# saml-test
Vagrant based test/development server that runs a SAML setup for backend authentication.

## Quick start

1. Clone this project `git clone --recurse-submodules https://github.com/magenta-aps/saml-test.git`

2. Navigate to the vagrant directory and start up your vagrant box
```
cd saml-test/vagrant
vagrant up
```

Now you should be able fire up a browser and access
* The public webapp (Digital Høringsportal prototype) on localhost:8080
* SimpleSAMLphp webgui on localhost:8081

If you wanna poke around inside the vagrant box, go to saml-test/vagrant and run
```
vagrant ssh
```
This will take you inside the vagrant box. 
You should take a moment to enter your own admin password and salt for SimpleSAMLphp in `/usr/share/simplesamlphp/config/config.php`

Happy hacking