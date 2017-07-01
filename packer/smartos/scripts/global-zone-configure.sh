#!/usr/bin/env bash

set -ex

function global_zone_cleanup() {
    rm -f /var/ssh/ssh_host*
    rm -f /var/adm/messages.*
    rm -f /var/log/syslog.*
    cp /dev/null /var/adm/messages
    cp /dev/null /var/log/syslog
    cp /dev/null /var/adm/wtmpx
    cp /dev/null /var/adm/utmpx
}

global_zone_cleanup
