#!/bin/bash
docker run -ti --name samba-server --rm \
	--network=host \
	-v $PWD/smb.conf:/etc/samba/smb.conf \
	-v /srv/samba/:/srv/samba \
	alpine/samba-server /bin/ash
