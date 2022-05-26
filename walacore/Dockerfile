FROM julianwindows/wala:walabase
MAINTAINER Julian Dolby

###############################
# utf 8
#
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

###############################
# WALA
#
COPY --chown=wala:wala WALA WALA/
WORKDIR WALA
RUN ./gradlew clean build publishToMavenLocal -x test
WORKDIR ..

COPY --chown=wala:wala IDE IDE/
WORKDIR IDE/com.ibm.wala.cast.lsp
RUN mvn clean install
WORKDIR ../..

COPY --chown=wala:wala ML ML/
WORKDIR ML
RUN mvn clean install
WORKDIR ..
