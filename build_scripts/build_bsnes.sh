#!/usr/bin/bash

git clone https://github.com/libretro/bsnes.git
cd bsnes
make -C bsnes -f GNUmakefile target="libretro" -j4
mv ./bsnes/out/bsnes_libretro.so ../



