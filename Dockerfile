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

# get bdml2bd5 from GitHub, and patch it for compile on Debian
RUN apt-get -y install git
RUN git clone https://github.com/openssbd/BDML2BD5.git

WORKDIR /root/BDML2BD5
COPY makefile.patch .
RUN patch -o makefile.Debian < makefile.patch
RUN make -f makefile.Debian

WORKDIR /root
