ansible-common-server-configuration
===================================

A simple role to setup the initial common server configuration, 
i.e. things like locale, timezone, installation of common handy 
packages like vim, less, curl etc. 

Usage
-----
To utilize this role, add it to the `requirements.yml` file inside the 
ansible folder:

```
- src: git+https://github.com/magenta-aps/ansible-role-common-server-configuration.git
  version: master
  name: common-server-configuration
```

Requirements
------------

Currently only support for Debian- and RedHat-based systems.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - common-server-configuration

License
-------

MPLv2

Author Information
------------------

https://github.com/andreaskring
