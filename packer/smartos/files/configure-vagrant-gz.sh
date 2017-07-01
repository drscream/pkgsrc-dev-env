#!/bin/bash

ADMIN_MAC=$(dladm show-phys -m -p -o address | head -n 1)
sed -i '' "s/admin_nic=.*/admin_nic=$ADMIN_MAC/" /usbkey/config
sysinfo -u

svcadm disable -s svc:/network/physical:default
svcadm enable -s svc:/network/physical:default
