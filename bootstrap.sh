#!/bin/sh
autoreconf -fvim
./configure
make -j20 dist
