#!/bin/bash

export USER=wala

rm -rf /tmp/.X*

vncserver

export DISPLAY=:1

startlxde
