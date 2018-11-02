FROM alpine
MAINTAINER Artem Udovichenko <APTEM-1986@yandex.ru>

# Upgrade currently installed packages to match repositories
RUN apk --no-cache --no-progress upgrade && \
	# install: A tiny but valid init for containers
	apk --no-cache add tini && \
	# install: PAM-using login and passwd utilities (usermod, useradd, ...)
	apk --no-cache --no-progress add shadow && \
	# install: Tools to access a server's filespace and printers via SMB
	apk --no-cache --no-progress add samba && \
	#
	apk --no-cache --no-progress add nano
	#
	#

EXPOSE 137/udp 138/udp 139 445

ENTRYPOINT ["/sbin/tini", "--"]
