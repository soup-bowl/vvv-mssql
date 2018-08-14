#!/usr/bin/env bash

echo "Installing MSSQL Connector for PHP."

# Instructions from https://bit.ly/2w1fkCo
sudo apt install unixodbc-dev -y
sudo pecl install sqlsrv
sudo pecl install pdo_sqlsrv

echo "Finished. Please add the following to your php.ini file:"
echo "extension=sqlsrv.so"
echo "extension=pdo_sqlsrv.so"