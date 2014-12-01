#!/bin/zsh
RPMS=(
	automake
	lynx
	python-markdown2
	rpm-build
)
STOP=
for rpm in ${RPMS}; do
	rpm -q --quiet "${rpm}"
	if [[ ! $? ]]; then
		echo "-- Need ${rpm}" >&2
		STOP="yes"
	fi
done
if [[ ! -z "${STOP}" ]]; then
	echo "You need to get more RPM's." >&2
	exit 1
fi
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
