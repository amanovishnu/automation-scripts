echo '-------------------------------------- UPDATING SYSTEM RESOURCES ----------------------------------'
sudo apt update;
sudo apt full-upgrade -y;
sudo apt autoremove -y;
sudo apt clean;


echo '-------------------------------------- INSTALLING TASKEL AND LAMP SERVER ----------------------------------'
sudo apt install tasksel -y;
sudo taskel;
# SELECT LAMP SERVER USING TAB


echo '-------------------------------------- INSTALLING AND CONFIGURING PHPMYADMIN ----------------------------------'
sudo apt update
sudo apt install phpmyadmin php-mbstring php-gettext
sudo phpenmod mbstring
sudo systemctl restart apache2
sudo mysql

SELECT user,authentication_string,plugin,host FROM mysql.user;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;
SELECT user,authentication_string,plugin,host FROM mysql.user;


# Ref : https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-18-04
