#!/bin/bash
MAILTO=root

CONFIG=/etc/login-email.conf

declare -A watchfor

watchfor['root']=yes

if [ -f "${CONFIG}" ]; then
	/bin/sed -r -e 's/[#].*$//' -e '/^[[:space:]]*$/d' "${CONFIG}" |
	while read name; do
		watchfor["${name}"]=yes
	done
fi

if [ "${watchfor[${USER}]}" ]; then
	(
		FMT='%7s:  %s\n'
		/bin/printf "${FMT}" 'Date' "$(/bin/date)"
		/bin/printf "${FMT}" 'User' "${USER}"
		/bin/printf "${FMT}" 'Host' "${HOSTNAME}"
		/bin/printf "${FMT}" 'Shell' "${SHELL}"
		/bin/printf "${FMT}" 'TTY' "$(/bin/tty)"

		cat <<-EOF

		Last few logins:
		-------------------------------------------------------
		$(
			/bin/last ${USER} | /bin/head -n5
		)
		-------------------------------------------------------
		EOF
	) | /bin/mailx -s "Login watch for ${HOSTNAME}" "${MAILTO}"
fi
