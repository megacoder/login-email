#!/bin/sh
markdown2 README.md | tee README.html | lynx -dump -stdin >README
autoreconf -fvim
./configure
make dist
if [ -d ${HOME}/rpm ]; then
	mv *.gz ${HOME}/rpm/SOURCES/
	rpmbuild -ba login-email.spec
fi
