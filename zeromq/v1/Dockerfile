FROM    centos:6.6

RUN yum install tar wget gcc gcc-c++ -y

WORKDIR /usr/local/src
RUN wget https://download.libsodium.org/libsodium/releases/old/unsupported/libsodium-1.0.3.tar.gz
RUN wget https://archive.org/download/zeromq_4.1.2/zeromq-4.1.2.tar.gz

RUN tar xvzf libsodium-1.0.3.tar.gz
RUN tar xvzf zeromq-4.1.2.tar.gz

WORKDIR /usr/local/src/libsodium-1.0.3
RUN ./configure && make && make install

WORKDIR /usr/local/src/zeromq-4.1.2
RUN ./configure PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/ && make && make install

RUN rm -rf /usr/local/src