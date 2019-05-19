#!/bin/bash

###############################
# setup

export LANG=C.UTF-8
export LC_ALL=C.UTF-8


###############################
# build WALA 

cd /home/wala/git

# use java 7 for jython
echo 1 | sudo update-alternatives --config java

# install jython
hg clone https://bitbucket.org/juliandolby/jython
cd jython
./gradlew build publishToMavenLocal

# use java 8 again
echo 0 | sudo update-alternatives --config java

# install lsp4j with websockets
cd /home/wala/git
git clone https://github.com/juliandolby/lsp4j
cd lsp4j
git checkout websockets
./gradlew build install

# get WALA IDE
cd /home/wala/git
git clone https://github.com/wala/IDE

# build LSP support
cd IDE
../WALA/gradlew build publishToMavenLocal

# clone WALA ML
cd /home/wala/git
git clone https://github.com/wala/ML

# build WALA
cd ML
../WALA/gradlew build publishToMavenLocal

