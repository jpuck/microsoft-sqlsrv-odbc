#!/bin/bash

# run script as root or with sudo

# IF everything goes PERFECTLY, then you could just execute this script as is.
# however, that's ill-advised in case something goes wrong.
# I suggest executing each step line-by-line and observe what's happening.
# this is proprietary software afterall, polluting your open-source environment.

# move to working directory, only needed for script
# ignore these lines if manually executing
set -e
cd $( dirname "${BASH_SOURCE[0]}" )

# dependencies
apt install make libc6 libkrb5-3 libgss3 e2fsprogs openssl libstdc++6 apache2 php libapache2-mod-php php7.0-zip php7.0-mbstring php-xml php-curl php-gd php-ssh2 unixodbc php-odbc -y

# enable odbc
phpenmod odbc
service apache2 restart

# original download driver link page https://www.microsoft.com/en-us/download/details.aspx?id=50419
tar xvzf msodbcsql-13.0.0.0.tar.gz
cd msodbcsql-13.0.0.0
./build_dm.sh --accept-warning

# driver manager will have custom directory
cd /tmp/unixODBC.*/unixODBC-*; make install

# return to download dir
cd -

# backup odbcinst.ini
odbcinibak=$(odbc_config --odbcinstini) && cp $odbcinibak $odbcinibak.bak

# actually install driver
./install.sh verify
./install.sh install --accept-license

# restart apache
service apache2 restart
