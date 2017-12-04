FROM centos:6.7

RUN yum install -y wget tar perl gcc pcre-devel openssl-devel curl
RUN \
    wget https://openresty.org/download/ngx_openresty-1.7.10.1.tar.gz ; \
     tar xvzf ngx_openresty-1.7.10.1.tar.gz ; \
    cd ngx_openresty-1.7.10.1 ; \
    ./configure ; make ; make install ; \
    cd .. ; rm -rf ngx_openresty-1.7.10.1 ; rm -f ngx_openresty-1.7.10.1.tar.gz

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh

COPY nginx.conf /usr/local/openresty/nginx/conf

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
