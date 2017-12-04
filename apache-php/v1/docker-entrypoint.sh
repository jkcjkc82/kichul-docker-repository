#!/bin/bash
if [[ "$@" != "/bin/bash" ]]
    then
        apachectl -d . -f /etc/httpd/conf/httpd.conf -e info -DFOREGROUND
        exit
fi

exec "$@"