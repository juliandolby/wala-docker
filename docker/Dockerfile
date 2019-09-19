FROM ubuntu:latest
MAINTAINER Julian Dolby

###############################
# utf 8
#
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8


###############################
# update system
#

# update
RUN apt update
RUN yes | apt upgrade


###############################
# setup system prerequisites
#

# Install wget
RUN yes | apt-get install wget

# Install curl
RUN yes | apt-get install curl

# Install java
RUN yes | apt-get install openjdk-8-jdk

# Install git
RUN yes | apt-get install git

# Install git
RUN yes | apt-get install g++

# Install mercurial
RUN yes | apt-get install mercurial

# Install make
RUN yes | apt-get install make

# Install maven
RUN yes | apt-get install maven

# Install make
RUN yes | apt-get install ant

# Install java 7
#RUN yes | apt-get install libsctp1
#RUN yes | apt-get install libgtk2.0-0

#RUN wget http://ftp.debian.org/debian/pool/main/t/tzdata/tzdata_2018e-0+deb8u1_all.deb
#RUN yes | dpkg -i tzdata_2018e-0+deb8u1_all.deb

#RUN wget http://ftp.debian.org/debian/pool/main/t/tzdata/tzdata-java_2018e-0+deb8u1_all.deb
#RUN yes | dpkg -i tzdata-java_2018e-0+deb8u1_all.deb

#RUN wget http://ftp.us.debian.org/debian/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.2-2+b1_amd64.deb
#RUN yes | dpkg -i libjpeg62-turbo_1.5.2-2+b1_amd64.deb

#RUN wget http://ftp.debian.org/debian/pool/main/o/openjdk-7/openjdk-7-jre-headless_7u181-2.6.14-1~deb8u1_amd64.deb
#RUN yes | dpkg -i openjdk-7-jre-headless_7u181-2.6.14-1~deb8u1_amd64.deb

#RUN wget http://ftp.debian.org/debian/pool/main/o/openjdk-7/openjdk-7-jre_7u181-2.6.14-1~deb8u1_amd64.deb 
#RUN yes | dpkg -i openjdk-7-jre_7u181-2.6.14-1~deb8u1_amd64.deb

#RUN wget http://ftp.debian.org/debian/pool/main/o/openjdk-7/openjdk-7-jdk_7u181-2.6.14-1~deb8u1_amd64.deb
#RUN yes | dpkg -i openjdk-7-jdk_7u181-2.6.14-1~deb8u1_amd64.deb

# Need sudo for admin hacking as wala
RUN apt-get -y install sudo

#  add WALA user
RUN useradd -ms /bin/bash wala

# wala user in sudo group
RUN echo "wala:wala" | chpasswd && adduser wala sudo

# make sudo group not need password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# copy scripts
ADD build-wala.sh /home/wala/build-wala.sh
RUN chown wala /home/wala/build-wala.sh
ADD build-wala-python.sh /home/wala/build-wala-python.sh
RUN chown wala /home/wala/build-wala-python.sh

