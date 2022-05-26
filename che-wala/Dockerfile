FROM quay.io/eclipse/che-java8-maven:nightly
MAINTAINER Julian Dolby

###############################
# utf 8
#
ENV LC_ALL C.UTF-8


###############################
# admin as root
#
USER root


###############################
# update system
#

# update
RUN apt update
RUN yes | apt upgrade


###############################
# setup system prerequisites
#

# Install git
RUN yes | apt-get install git

# Install mercurial
RUN yes | apt-get install mercurial

# Install make
RUN yes | apt-get install make

# Install ant
RUN yes | apt-get install ant

# Install g++
RUN yes | apt-get install g++

# Need sudo for admin hacking as wala user
RUN apt-get -y install sudo

#  add user for WALA
RUN useradd -ms /bin/bash user -u 10001 -g 0

# wala user in sudo group
RUN echo "user:root" | chpasswd && adduser user sudo

# make sudo group not need password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# open /projects
RUN chmod 777 /projects
RUN chown user /projects


###############################
# build WALA prerequisites

# build as wala
USER user
WORKDIR /tmp

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


###############################
# open .m2
RUN chmod -R 777 ~/.m2


###############################
# che gets its own .gradle
RUN rm -rf ~/.gradle


###############################
# /projects

WORKDIR /projects
