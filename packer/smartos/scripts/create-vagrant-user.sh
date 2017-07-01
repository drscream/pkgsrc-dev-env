#!/usr/bin/env bash

set -ex

function setup_vagrant_user() {
	groupadd vagrant
	useradd -d /opt/vagrant -m -s /bin/bash -G vagrant vagrant
	usermod -P'Primary Administrator' vagrant

	echo 'if [ -e $HOME/.bashrc ]; then' > /opt/vagrant/.bash_profile
	echo '  . $HOME/.bashrc' >> /opt/vagrant/.bash_profile
	echo 'fi' >> /opt/vagrant/.bash_profile
	echo 'export PATH=/usr/bin:/usr/sbin/:/opt/local/bin:/opt/local/sbin:/opt/vagrant/bin' >> /opt/vagrant/.bash_profile

	mkdir -p /opt/vagrant/.ssh/
	cat /usbkey/config.inc/authorized_keys > /opt/vagrant/.ssh/authorized_keys
	echo 'PATH=/usr/bin:/usr/sbin/:smartdc/bin:/opt/local/bin:/opt/local/sbin:/opt/vagrant/bin' > /opt/vagrant/.ssh/environment

	chown -R vagrant:other /opt/vagrant/
}

function fake_sudo() {
	mkdir -p /opt/vagrant/bin
	echo '#!/usr/bin/env bash' > /opt/vagrant/bin/sudo
	echo 'pfexec $@' >> /opt/vagrant/bin/sudo
	chmod -R 0777 /opt/vagrant/bin
}

function fix_password() {
	grep root: /usbkey/shadow | sed 's/^root:/vagrant:/g' >> /usbkey/shadow
}

mkdir /usbkey/vagrant

#setup_vagrant_user
#fake_sudo
#fix_password
