#!/bin/sh

aclocal		--force
autoconf	-f
# autoheader	-f
automake	--foreign --add-missing
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
