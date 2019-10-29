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

# Need sudo for admin hacking as wala
RUN apt-get -y install sudo

#  add WALA user
RUN useradd -ms /bin/bash wala

# wala user in sudo group
RUN echo "wala:wala" | chpasswd && adduser wala sudo

# make sudo group not need password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

###############################
# build WALA

# build as wala
USER wala
WORKDIR /home/wala

# clone WALA
RUN mkdir git
WORKDIR git
RUN git clone https://github.com/wala/WALA

# build WALA
WORKDIR WALA
RUN ./gradlew build install
WORKDIR ..

# install jython 2
RUN hg clone https://bitbucket.org/juliandolby/jython
WORKDIR jython
RUN ./gradlew build publishToMavenLocal
WORKDIR ..

# install jython 3
RUN git clone https://github.com/juliandolby/jython3
WORKDIR jython3
RUN ant
RUN mvn install:install-file -Dfile=dist/jython-dev.jar -DgroupId=org.python -DartifactId=jython3 -Dversion=0.0.1-SNAPSHOT -Dpackaging=jar
WORKDIR ..

# install lsp4j with websockets
RUN git clone https://github.com/juliandolby/lsp4j
WORKDIR lsp4j
RUN git checkout websockets
RUN ./gradlew build install
WORKDIR ..

# get WALA IDE
RUN git clone https://github.com/wala/IDE
WORKDIR IDE/com.ibm.wala.cast.lsp
RUN mvn clean install
WORKDIR ../..

# clone WALA ML
RUN git clone https://github.com/wala/ML
WORKDIR ML
RUN mvn clean install -DskipTests
WORKDIR ..

# save
VOLUME /home/wala/git
VOLUME /home/wala/.m2
