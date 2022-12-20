FROM ubuntu:20.04

MAINTAINER trngaje <bilbobaggins@naver.com>

ARG DEBIAN_FRONTEND="noninteractive"
ENV TZ=Asia/Seoul
#RUN sed -i 's@archive.ubuntu.com@kr.archive.ubuntu.com@g' /etc/apt/sources.list
RUN dpkg --add-architecture armhf
RUN apt-get update && apt-get upgrade -y apt-utils tzdata && \
    apt-get install -y --no-install-recommends nano sudo ca-certificates git autoconf automake && \
    apt-get install -y --no-install-recommends build-essential && \  
	apt-get install -y --no-install-recommends libc6:armhf && \
	apt-get install -y --no-install-recommends crossbuild-essential-armhf && \
	apt-get install -y --no-install-recommends premake4 libopenal-dev:armhf libevdev-dev:armhf libasound2-dev:armhf libpng-dev:armhf && \
	apt-get install -y --no-install-recommends mesa-common-dev:armhf libegl1-mesa-dev:armhf libgles2-mesa-dev:armhf mesa-utils:armhf && \
    apt-get install -y --no-install-recommends locales dialog && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/ko_KR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=ko_KR.UTF-8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN locale-gen ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8
#RUN apt -o Acquire::Check-Valid-Until=false update
#RUN apt upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --force-yes
RUN useradd -m odroid
RUN usermod -s /bin/bash odroid
ENV SHELL /bin/bash
ENV HOME /home/odroid
RUN echo "odroid ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER odroid

WORKDIR /home/odroid
RUN git clone https://github.com/OtherCrashOverride/libgou.git
WORKDIR /home/odroid/libgou
ENV AR=arm-linux-gnueabihf-ar	
ENV CC=arm-linux-gnueabihf-gcc
ENV CXX=arm-linux-gnueabihf-g++
ENV LINK=arm-linux-gnueabihf-g++
RUN premake4 gmake
RUN make -j4
RUN sudo mkdir /usr/include/gou
RUN sudo cp /home/odroid/libgou/src/*.h /usr/include/gou/
RUN sudo cp /home/odroid/libgou/libgou.so /usr/lib/arm-linux-gnueabihf/

RUN echo "export AR=arm-linux-gnueabihf-ar" >> ~/.bashrc
RUN echo "export CC=arm-linux-gnueabihf-gcc" >> ~/.bashrc
RUN echo "export CXX=arm-linux-gnueabihf-g++" >> ~/.bashrc
RUN echo "export LINK=arm-linux-gnueabihf-g++" >> ~/.bashrc

RUN echo "imap jj <Esc>" >> ~/.vimrc
RUN echo "set number" >> ~/.vimrc
RUN echo "syntax on" >> ~/.vimrc
RUN echo "set tabstop=4 shiftwidth=4 expandtab" >> ~/.vimrc
RUN echo "LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS" >> ~/.bashrc


#Set default editor and startup command
WORKDIR /home/odroid/
ENV EDITOR nano

