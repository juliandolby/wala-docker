FROM julianwindows/wala:walacore
MAINTAINER Julian Dolby

###############################
# utf 8
#
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

###############################
# update
#
USER 0
RUN apt update

###############################
# vnc
#
RUN apt-get install -y -qq tightvncserver
EXPOSE 22 5901

###############################
# env
#
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y -qq lxde

###############################
# switch back to wala
#
USER wala

###############################
# config
#
COPY --chown=wala:wala start.sh start.sh
RUN chmod a+x start.sh
COPY --chown=wala:wala vnc.txt vnc.txt
RUN mkdir .vnc
RUN echo walawala | vncpasswd -f > .vnc/passwd
RUN chown -R wala.wala .vnc
RUN chmod 0600 .vnc/passwd

###############################
# start up
#
CMD ./start.sh
