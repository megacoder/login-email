EXTRA_DIST =							\
	AUTHORS							\
	COPYING							\
	ChangeLog						\
	INSTALL							\
	LICENSE							\
	NEWS							\
	README.md						\
	TODO							\
	bootstrap.sh						\
	configure.ac						\
	login-email.conf					\
	login-email.sh						\
	login-email.spec.in

sysconf_DATA = login-email.conf

install:: ${sysconfdir}/profile.d/login-email.sh

${sysconfdir}/profile.d/login-email.sh:: login-email.sh
	install -D -m 0655 $< $@
