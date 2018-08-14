#!/usr/bin/env bash

echo "Installing UNIX ODBC and MSODBC."
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | sudo tee --append /etc/apt/sources.list.d/mssql-release.list
sudo ACCEPT_EULA=Y apt install unixodbc-dev msodbcsql17 -y

# Instructions from https://bit.ly/2w1fkCo
# check (TODO):  php -m | grep -w 'pdo_sqlsrv' <OR> 'pdo_sqlsrsv'

echo "Installing PHP Microsoft SQL extensions."
sudo pecl install sqlsrv
sudo pecl install pdo_sqlsrv

sudo bash -c "echo extension=sqlsrv.so > /etc/php/7.2/fpm/conf.d/sqlsrv.ini"
sudo bash -c "echo extension=pdo_sqlsrv.so > /etc/php/7.2/fpm/conf.d/pdo_sqlsrv.ini"

echo "Finished. Please add the following to your php.ini file:"
echo "extension=sqlsrv.so"
echo "extension=pdo_sqlsrv.so"