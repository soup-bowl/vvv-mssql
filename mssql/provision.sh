#!/usr/bin/env bash

echo "Installing MSSQL Connector for PHP."

sudo su 
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
sudo ACCEPT_EULA=Y apt install msodbcsql17 -y

# Instructions from https://bit.ly/2w1fkCo
# check (TODO):  php -m | grep -w 'pdo_sqlsrv' <OR> 'pdo_sqlsrsv'

sudo apt install unixodbc-dev -y
sudo pecl install sqlsrv
sudo pecl install pdo_sqlsrv

echo "Finished. Please add the following to your php.ini file:"
echo "extension=sqlsrv.so"
echo "extension=pdo_sqlsrv.so"