# microsoft-sqlsrv-odbc

Install the Microsoft SQL Server ODBC drivers for Ubuntu 16.04 with PHP7 and Apache 2.4

## Install

Run [the installer script][1] as `root` or with `sudo`

    sudo ./install-ubuntu16.04-apache2-php7-msodbc.bash

## Connect

Set the credentials in [the PDO script][2].

```php
$hostname = 'mssql.example.com';
$database = 'mydb';
$username = 'user';
$password = 'P@55w0rd';
```

Test the connection from the PHP command line interface:

    php ./php-odbc-test/pdo.php

If all is good, then nothing should happen, otherwise errors will be thrown.

## Query

Create a table, insert some data, then set the SQL in [the output script][3].

```php
$sql = 'SELECT * FROM [mytable]';
```

Again you can test using the PHP command line interface:

    php ./php-odbc-test/index.php

Or copy it to a web directory location:

    sudo cp -r ./php-odbc-test/ /var/www/html/

Then view it in the browser [http://localhost/php-odbc-test/][4]

[1]:./install-ubuntu16.04-apache2-php7-msodbc.bash
[2]:./php-odbc-test/pdo.php
[3]:./php-odbc-test/index.php
[4]:http://localhost/php-odbc-test/
