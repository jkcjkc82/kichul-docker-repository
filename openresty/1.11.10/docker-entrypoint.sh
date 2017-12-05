#!/bin/bash
if [[ "$@" != "/bin/bash" ]]
    then
        /usr/local/nginx/sbin/nginx
        exit
fi

exec "$@"