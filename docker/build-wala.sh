#!/bin/bash

###############################
# setup

mkdir /home/wala/git/m2
ln -s /hone/wala/git/m2 /home/wala/.m2

export LANG=C.UTF-8
export LC_ALL=C.UTF-8


###############################
# build WALA 

# clone WALA 
cd /home/wala/git
git clone https://github.com/wala/WALA

# build WALA
cd WALA
./gradlew build install

