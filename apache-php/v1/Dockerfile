FROM centos:6.7

RUN yum install -y httpd2 php

COPY httpd.conf /etc/httpd/conf
COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
