# packer-netbsd

These packer files are based on [d-adler](https://github.com/d-adler/packer-nbsd-boxes). I've only adapt the files to work for our build setup and I've removed other provisioner like chef, ansible and puppet. To build everthing use the following commands:

	$ packer build netbsd-6-amd64.json
	$ packer build netbsd-7-amd64.json
