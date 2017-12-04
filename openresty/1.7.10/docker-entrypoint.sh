#!/bin/bash
if [[ "$@" != "/bin/bash" ]]
    then
        /usr/local/openresty/nginx/sbin/nginx
        exit
fi

exec "$@"