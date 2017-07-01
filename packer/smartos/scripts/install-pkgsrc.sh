#!/usr/bin/env bash

set -xe

function install_pkgsrc() {
	cd /
	wget -q -O- http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2017Q1-x86_64.tar.gz | gzcat | tar -xf -
}

function rebuild_pkgsrc() {
	/opt/local/sbin/pkg_admin rebuild
	/opt/local/bin/pkgin -y up
}

function install_sudo() {
	echo 'PKGINSTALL_IGNORE_UIDGID=yes' >> /opt/local/etc/mk.conf
	export PKGINSTALL_IGNORE_UIDGID=yes
	/opt/local/bin/pkgin -y install sudo || true
	mkdir -p /opt/local/etc/sudoers.d
	echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /opt/local/etc/sudoers.d/vagrant
	chmod 0440 /opt/local/etc/sudoers.d/vagrant
}

#install_pkgsrc
#rebuild_pkgsrc
