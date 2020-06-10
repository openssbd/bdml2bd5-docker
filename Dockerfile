# Dockerfile for bdml2bd5

FROM debian:latest
MAINTAINER Hiroya ITOGA <hiroya.itoga@riken.jp>

USER root
WORKDIR /root

# update debian
# ENV DEBIAN_FRONTEND noninteractive
# ENV DEBIAN_NOWARNINGS yes
RUN apt-get -y update && apt-get -y upgrade 

# install development tools
RUN apt-get -y install build-essential

# install XSD parser
RUN apt-get -y install xsdcxx libxerces-c-dev
RUN ln -s /usr/bin/xsdcxx /usr/bin/xsd
ENV XSD_ROOT /usr/share/doc/xsdcxx

# install HDF5 library
RUN apt-get -y install libhdf5-dev

# get bdml2bd5 source code, and patch it for compile on Debian
RUN apt-get -y install wget unzip
RUN wget http://ssbd.qbic.riken.jp/tools/bdml2bd5v018.zip
RUN unzip -x bdml2bd5v018.zip

WORKDIR /root/bdml2bd5v018
COPY makefile.patch .
RUN patch -o makefile.Debian < makefile.patch
RUN make -f makefile.Debian

WORKDIR /root
