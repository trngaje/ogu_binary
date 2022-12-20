#!/bin/bash

#mkdir -p ~/develop
#cd ~/develop

# build liblcf
#sudo apt-get -y install --no-install-recommends git make automake pkg-config libtool g++ libexpat1-dev libicu-dev
#git clone https://github.com/EasyRPG/liblcf.git
#cd liblcf
#autoreconf -i
#./configure --prefix=/usr
#make -j4
#sudo make install
#cd ..

# build player
sudo apt-get -y install --no-install-recommends libsdl2-mixer-dev libpixman-1-dev libfreetype6-dev libspeexdsp-dev libxmp-dev libwildmidi-dev libopusfile-dev libvorbis-dev libharfbuzz-dev libmpg123-dev libsndfile-dev
sudo apt install -y libfmt-dev
git clone https://github.com/EasyRPG/Player.git
cd Player
autoreconf -i
./configure
make -j8

# build libretro core
#mkdir -p ~/libretro
#cd ~/libretro
#git clone https://github.com/EasyRPG/Player.git
#cd Player

#git submodule init   # Init submodules
#git submodule update # Clone libretro-common submodule

#cmake . -DPLAYER_TARGET_PLATFORM=libretro -DBUILD_SHARED_LIBS=ON
#make -j4

