#!/bin/sh

echo ${SECRET} > /etc/smokeping/slavesecrets.conf

chown smokeping:smokeping /etc/smokeping/slavesecrets.conf

chmod 400 /etc/smokeping/slavesecrets.conf

/usr/sbin/smokeping --master-url=${MASTER_URL} --shared-secret=/etc/smokeping/slavesecrets.conf --slave-name=${SLAVE_NAME} --nodaemon --cache-dir=/var/lib/smokeping

