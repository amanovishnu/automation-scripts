echo "------------------------ IMPORTING GPG KEYS FOR POSTGRES PACKAGES---------------------------------"
sudo apt-get install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -


echo "------------------------ ADDING REPOSITORY TO SYSTEM -----------------------------------------------"
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'


echo "------------------------- INSTALLING POSTGRESSQL ON UBUNTU ---------------------------------------"
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib -y


echo "------------------------- CREATING USER FOR POSTGRESQL ------------------------------------------"
sudo su - postgres
psql


# Reference : https://tecadmin.net/install-postgresql-server-on-ubuntu/
# Reference : https://tecadmin.net/install-pgadmin4-on-ubuntu/