FROM ubuntu:12.04

RUN apt-get update
RUN apt-get install -y nfs-common nfs-kernel-server portmap
RUN mkdir /nfs
RUN chmod 777 /nfs
RUN echo "/nfs 127.0.0.1(rw,sync,insecure,no_subtree_check)" >> /etc/exports
RUN echo "nfs 2049/tcp" >> /etc/services
