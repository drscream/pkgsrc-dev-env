# pkgsrc-dev-build

This repo should help you, as pkgsrc developer to test your software or package
on different operating systems. This is created for people who using MacOS as
there local operating system.

I use this on my local machine so maybe some scripts and environments will not
work for you. Feel free to modify it to be more generic and send a pull request.

## Requirements

- [packer](https://packer.io): to create the templates and images on which you will test your build
- [vagrant](https://www.vagrantup.com): to create the environment automatically for you
- [virtualbox](https://www.virtualbox.org): to run everything virtual on your local machine

## Preparation

## Structure

- `packer`: contains the code for packer to build the images which are used by
  vagrant later. At the moment we support netbsd version 6, 7 and smartos
  pkgbuild 17Q1.
- `vagrant`: contains the vagrant file to start and provision the machines by
  using `vagrant up`.
- `home`: contains some files which are used and copied to the virtual machine
  and the `.bashrc` file for the `switch.sh` script.
- `bin`: scripts which are used for the environment for example `switch.sh` to
  use some bash functions.

## Usage

Get the latest pkgsrc code which you like to use and bootstrap your environment
with it. It should be stored in the same folder as every other scripts here.

Be sure all requirements are installed! If so you could use the existing
published machines on the Vagrant Cloud. So switching to your environment:

	$ ./bin/switch.sh

Start the virtual machines with Vagrant:

	$ cd vagrant
	$ vagrant up

Really use it to build something on your virtual machines. As an example build
`stunnel` on the machines:

	$ cd pkgsrc/security/stunnel
	$ vmake
	$ vmake package


