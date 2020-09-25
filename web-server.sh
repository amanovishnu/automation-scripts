#!/bin/bash

GIT_BRANCH=$1

sudo apt update

echo "-----------------INSTALLING GIT--------------------------------"
sudo apt -y install git
echo "-------------------------------------------------------------------------"


echo "-----------------INSTALLING APACHE SERVER--------------------------------"
sudo apt -y install apache2
echo "-------------------------------------------------------------------------"


echo "-----------------INSTALLING PHP--------------------------------"
sudo apt -y install php libapache2-mod-php php-mysql
echo "-------------------------------------------------------------------------"


echo "-----------------RESTARTING APACHE SERVER--------------------------------"
sudo service apache2 restart
echo "-------------------------------------------------------------------------"


echo "-----------------INSTALLING PHPMYADMIN--------------------------------"
sudo apt-get install -y phpmyadmin
echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf
echo "-------------------------------------------------------------------------"


echo "-----------------RESTARTING APACHE SERVER--------------------------------"
sudo service apache2 restart
echo "-------------------------------------------------------------------------"


echo "-----------------DOWNLOADING AND UNZIPPING EMQTT v3.1.2--------------------------------"
#emqtt download and install
wget https://www.emqx.io/downloads/broker/v3.1.2/emqx-ubuntu18.04-v3.1.2.zip
unzip emqx-ubuntu18.04-v3.1.2.zip
echo "-------------------------------------------------------------------------"


 echo "-----------------INSTALLING SSH--------------------------------"
 sudo apt-get -y install openssh-server
 echo "-------------------------------------------------------------------------"

echo "-----------------INSTALLING PYTHON-PIP--------------------------------"
sudo apt-get -y install python-pip
echo "-------------------------------------------------------------------------"


echo "-----------------INSTALLING PYTHON-MYSQL--------------------------------"
sudo apt-get -y install python-mysqldb
echo "-------------------------------------------------------------------------"


echo "-----------------INSTALLING PAHO MQTT CLIENT--------------------------------"
sudo pip install paho-mqtt
echo "-------------------------------------------------------------------------"


echo "-----------------INSTALLING PHP-MYSQL CONNECTORS--------------------------------"
sudo apt-get -y  install php-mysql php-common php-cli
echo "-------------------------------------------------------------------------"


echo "-----------------INSTALLING PANDAS LIBRARY--------------------------------"
sudo pip install pandas==0.19.2
echo "-------------------------------------------------------------------------"


echo "-----------------SETTING UP SOFTWARE--------------------------------"
cd /var/www/html/
sudo git clone -b $GIT_BRANCH --single-branch https://parag_2306@bitbucket.org/itspe-software/tis.git
echo "-------------------------------------------------------------------------"


echo "-----------------INSTALLING LATEX--------------------------------"
sudo apt-get -y install texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra
echo "-------------------------------------------------------------------------"


echo "-----------------SETTING UP CRONJOBS AND LOG FILES--------------------------------"
mkdir /var/log/tisLog
touch /var/log/tisLog/TIMInstructionsLog
chmod 777 /var/log/tisLog/TIMInstructionsLog
touch /var/log/tisLog/OutputLog
chmod 777 /var/log/tisLog/OutputLog

(crontab -l ; echo '#*/1 * * * * python /var/www/html/tis/background/instationProcessChecker.py' ) | crontab -
(crontab -l ; echo '#*/1 * * * * php /var/www/html/tis/gui/utils/signal_crondata.php >> /var/log/tisLog/TIMInstructionsLog 2>&1' ) | crontab -
(crontab -l ; echo '#*/1 * * * * python /var/www/html/tis/background/signal/trapHandlerReplyTable.py >> /var/log/tisLog/TIMInstructionsLog 2>&1' ) | crontab -
echo "-------------------------------------------------------------------------"


echo "-------------------------------------------------------------------------"
echo "-------------				YOU ARE ALL SET NOW !!		-------------------"
echo "-------------------------------------------------------------------------"
