#!/bin/bash
if [[ "${#}" -ne 1 ]]; then
	echo "Create a simple web directory for <username> along with a generic index.html"
	echo "Usage: ${0} <username>"
	exit 2
fi

USER="${1}"
HOMEDIR="$(getent passwd "${USER}" | cut -d: -f6)"

if [[ -z "${HOMEDIR}" ]]; then
	useradd -m $USER
fi

HOMEDIR="$(getent passwd "${USER}" | cut -d: -f6)"
PUBDIR="${HOMEDIR}/public_html"

if [[ ! -d "${HOMEDIR}" ]]; then
	echo "Error: The directory ${HOMEDIR} doesn't exist."
	exit 1
fi

mkdir "${PUBDIR}"
if [[ -d "${PUBDIR}" ]]; then
	cat << 'EOF' > "${PUBDIR}/index.html"
<!DOCTYPE html>
<html>
<head>
	<title>World! Hello?</title>
</head>
	<body>
		<h1>Hello World</h1>
	</body>
</html>
EOF
	chown -R "${USER}:" "${PUBDIR}"
	chmod 755 "${HOMEDIR}"
else
	echo "Error: failed to create directory ${PUBDIR}."
	exit 1
fi
