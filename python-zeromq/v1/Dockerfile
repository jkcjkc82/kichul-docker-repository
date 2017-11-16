FROM    zeromq:v1

RUN touch /var/lib/rpm/* ; \
    rpm --rebuilddb ; \
    yum clean all ; \
    yum install -y python-devel
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install pyzmq>=14.3.1