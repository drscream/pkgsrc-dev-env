#!/usr/bin/env bash

set -ex

function import_latest() {
    imgadm avail | grep ${1} | tail -n1 | awk '{ system("imgadm import "$1) }'
}

#import_latest base64
#import_latest pkgbuild
