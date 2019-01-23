# todolist_app

Install apache, mysql, and php

    sudo apt-get install apache2 mysql-server php \
    p-{bcmath,bz2,intl,gd,mbstring,mcrypt,mysql,zip} \
    libapache2-mod-php phpmyadmin php-mbstring php-gettext

Starting Apache and MySQL on boot

    sudo systemctl enable apache2.service
    sudo systemctl enable mysql.service

Restart apache service:

    systemctl restart apache2.service

The installation process add a phpMyAdmin configuration file called phpmyadmin.config to /etc/apache2/conf-enabled/. If the file do not exists, edit the file /etc/apache2/apache2.conf, and add the following line to the end:

    Include /etc/phpmyadmin/apache.conf

Enable some php extensions: 

    sudo phpenmod mcrypt
    sudo phpenmod mbstring
  
Restart apache:

    sudo systemctl restart apache2

Clone the repository to the directory /var/www/html. 

Import the database sql/todolist_db.sql using phpMyAdmin.

Access the site http://localhost/todolist_app .
