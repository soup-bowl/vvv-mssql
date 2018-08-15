#!/usr/bin/env bash

# Instructions from https://bit.ly/2HlHjRW and https://bit.ly/2w1fkCo

echo "Installing UNIX ODBC and MSODBC."

if [ -e /etc/php/7.2/fpm/conf.d/sqlsrv.ini ]
then
    echo "sqlsrv.ini detected in fpm, assuming already installed. Skipping."
else
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | sudo tee --append /etc/apt/sources.list.d/mssql-release.list
    sudo apt-get update > /dev/null
    sudo apt-get install unixodbc -y > /dev/null
    # unixodbc-dev for 14.04 needs to be manually installed.
    curl http://launchpadlibrarian.net/174316120/unixodbc-dev_2.3.1-3_amd64.deb > ~/unixodbc-dev_2.3.1-3_amd64.deb
    sudo dpkg -i ~/unixodbc-dev_2.3.1-3_amd64.deb > /dev/null
    rm ~/unixodbc-dev_2.3.1-3_amd64.deb
    sudo ACCEPT_EULA=Y apt-get install msodbcsql17 -y > /dev/null
    
    echo "Installing PHP Microsoft SQL extensions."
    sudo pecl channel-update pecl.php.net > /dev/null
    sudo pecl install sqlsrv pdo_sqlsrv > /dev/null
    
    sudo bash -c "echo extension=sqlsrv.so > /etc/php/7.2/fpm/conf.d/sqlsrv.ini"
    sudo bash -c "echo extension=pdo_sqlsrv.so > /etc/php/7.2/fpm/conf.d/pdo_sqlsrv.ini"
    
    sudo service php7.2-fpm restart > /dev/null
fi

#echo "-----"
#echo "Finished. Please add the following to your php.ini file:"
#echo "extension=sqlsrv.so"
#echo "extension=pdo_sqlsrv.so"
#echo "-----"