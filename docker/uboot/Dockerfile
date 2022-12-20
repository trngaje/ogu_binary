FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends apt-utils nano sudo ca-certificates git autoconf automake && \
    apt-get install -y --no-install-recommends lzop build-essential gcc bc libncurses5-dev libc6-i386 lib32stdc++6 lib32z1 && \ 
    apt-get install -y --no-install-recommends locales wget && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m trngaje
RUN usermod -s /bin/bash trngaje
ENV SHELL /bin/bash
ENV HOME /home/trngaje
RUN echo "trngaje ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER trngaje

WORKDIR /home/trngaje
RUN wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
RUN wget https://releases.linaro.org/archive/14.04/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2014.04_linux.tar.xz
RUN sudo mkdir -p /opt/toolchains
RUN sudo tar xvf gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz -C /opt/toolchains/
RUN sudo tar xvf gcc-linaro-arm-none-eabi-4.8-2014.04_linux.tar.xz -C /opt/toolchains/
RUN echo "export ARCH=arm64" >> ~/.bashrc
RUN echo "export CROSS_COMPILE=aarch64-none-elf-" >> ~/.bashrc
RUN echo "export PATH=/opt/toolchains/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:/opt/toolchains/gcc-linaro-arm-none-eabi-4.8-2014.04_linux/bin:$PATH" >> ~/.bashrc

#WORKDIR /home/odroid
#RUN git clone https://github.com/OtherCrashOverride/libgou.git
#WORKDIR /home/odroid/libgou
#RUN premake4 gmake
#RUN make -j4
#RUN sudo mkdir /usr/include/gou
#RUN sudo cp /home/odroid/libgou/src/*.h /usr/include/gou/
#RUN sudo cp /home/odroid/libgou/libgou.so /usr/lib/aarch64-linux-gnu/

RUN echo "imap jj <Esc>" >> ~/.vimrc
RUN echo "set number" >> ~/.vimrc
RUN echo "syntax on" >> ~/.vimrc
RUN echo "set tabstop=4 shiftwidth=4 expandtab" >> ~/.vimrc
RUN echo "LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS" >> ~/.bashrc

#Set default editor and startup command
WORKDIR /home/trngaje/
ENV EDITOR nano

