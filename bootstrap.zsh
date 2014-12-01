#!/bin/zsh
markdown2 README.md | tee README.html | lynx -dump -stdin >README
autoreconf -fvim
./configure
make dist
rm -rf RPM
mkdir -p RPM/{SOURCES,RPMS,SRPMS,BUILD,SPECS}
rpmbuild							\
	-D"_topdir ${PWD}/RPM"					\
	-D"_sourcedir ${PWD}"					\
	-D"_specdir ${PWD}"					\
	-ba							\
	login-email.spec
