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
RUN apt -qq update
RUN apt -qq -y upgrade


###############################
# setup system prerequisites
#

# Install wget
RUN apt-get -qq -y install wget

# Install curl
RUN apt-get -qq -y install curl

# Install java
RUN apt-get install -qq -y openjdk-11-jdk-headless

# Install git
RUN apt-get install -qq -y git

# Install git
RUN apt-get install -qq -y g++

# Install mercurial
RUN apt-get -qq -y install mercurial

# Install make
RUN apt-get -qq -y install make

# Install maven
RUN apt-get -qq -y install maven

# Install make
RUN apt-get -qq -y install ant

# Need sudo for admin hacking as wala
RUN apt-get -qq -y install sudo

#  add WALA user
RUN useradd -ms /bin/bash wala

# wala user in sudo group
RUN echo "wala:wala" | chpasswd && adduser wala sudo

# make sudo group not need password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER wala
WORKDIR /home/wala

# install jython 2
RUN git clone https://github.com/jython/jython
WORKDIR jython
RUN chmod a+x gradlew 
RUN ./gradlew build publishToMavenLocal -x test -x javadoc
WORKDIR ..

# install jython 3
RUN git clone https://github.com/juliandolby/jython3
WORKDIR jython3
RUN ant
RUN mvn install:install-file -Dfile=dist/jython-dev.jar -DgroupId=org.python -DartifactId=jython3 -Dversion=0.0.1-SNAPSHOT -Dpackaging=jar
WORKDIR ..

# save
VOLUME /home/wala/.m2
