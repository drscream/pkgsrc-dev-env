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

## Usage
