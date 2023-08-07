FROM ubuntu:18.04 as base

 

RUN  apt-get update -y && apt-get install -y && apt-get upgrade -y

 

RUN apt-get install -y software-properties-common

 

RUN apt-get install -y vim

 

RUN dpkg --add-architecture i386

 

ENV DEBIAN_FRONTEND noninteractive

 

ENV TZ=Asia/Kolkata \
    DEBIAN_FRONTEND=noninteractive

 

RUN apt-get install repo git-core gitk git-gui gcc-arm-linux-gnueabihf u-boot-tools device-tree-compiler mtools parted libudev-dev libusb-1.0-0-dev python-linaro-image-tools linaro-image-tools autoconf autotools-dev libsigsegv2 m4 intltool libdrm-dev curl sed make binutils build-essential gcc g++ bash patch gzip bzip2 perl tar cpio python unzip rsync file bc wget libncurses5 libqt4-dev libglib2.0-dev libgtk2.0-dev libglade2-dev cvs git mercurial rsync openssh-client subversion asciidoc w3m dblatex graphviz python-matplotlib libssl-dev texinfo genext2fs coreutils -y

 

RUN apt-get install liblz4-tool g++-7 libstdc++-7-dev coreutils -y

 

#RUN apt-get update -y && apt-get -f install -y && dpkg --configure -a && apt-get -f install -y && apt-get install libc6:i386 -y

 

RUN apt-get install patchelf time expect-dev -y

 

WORKDIR /root/

 

RUN mkdir -p /root/

 

 

COPY startup.sh /root/

 

RUN chmod +x /root/startup.sh

 

ENTRYPOINT ["/bin/bash", "/root/startup.sh"]
