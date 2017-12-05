FROM centos:7.2.1511

RUN yum install -y wget tar perl gcc pcre-devel openssl-devel curl make

RUN \
    wget http://luajit.org/download/LuaJIT-2.0.5.tar.gz ; \
    tar xvzf LuaJIT-2.0.5.tar.gz ; \
    cd LuaJIT-2.0.5 ; \
    make ; make install ; \
    cd .. ; rm -rf LuaJIT-2.0.5.tar.gz LuaJIT-2.0.5

ENV LUAJIT_LIB /usr/local/lib
ENV LUAJIT_INC /usr/local/include/luajit-2.0

RUN \
    wget https://github.com/simpl/ngx_devel_kit/archive/v0.3.0.tar.gz ; \
    tar xvzf v0.3.0.tar.gz ; \
    wget https://github.com/openresty/lua-nginx-module/archive/v0.10.11.tar.gz ; \
    tar xvzf v0.10.11.tar.gz ; \
    wget http://nginx.org/download/nginx-1.11.10.tar.gz ; \
    tar xvzf nginx-1.11.10.tar.gz ; \
    cd nginx-1.11.10 ; \
    ./configure --with-ld-opt="-Wl,-rpath,/usr/local/lib" \
        --add-module=/ngx_devel_kit-0.3.0 \
        --add-module=/lua-nginx-module-0.10.11 ; \
    make ; make install ; \
    cd .. ; \
    rm -rf nginx-1.11.10 nginx-1.11.10.tar.gz v0.3.0.tar.gz ngx_devel_kit-0.3.0 v0.10.11.tar.gz lua-nginx-module-0.10.11

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh

COPY nginx.conf /usr/local/openresty/nginx/conf

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
