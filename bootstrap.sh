#!/bin/sh
markdown2 README.md | tee README.html | lynx -dump -stdin >README
autoreconf -fvim
./configure
make -j20 dist
