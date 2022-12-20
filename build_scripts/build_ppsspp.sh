#!/usr/bin/bash

git clone https://github.com/hrydgard/ppsspp.git --recursive
cd ppsspp/ffmpeg
./linux_arm64.sh
cd ..
git revert 0f74a19 -m 1
git revert 857e0bb -m 1
mkdir build && cd build
cmake -DUSING_EGL=OFF -DUSING_GLES2=ON -DUSE_FFMPEG=YES -DUSE_SYSTEM_FFMPEG=NO ../.
make -j4
strip PPSSPPSDL


