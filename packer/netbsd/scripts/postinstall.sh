export PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/pkg/sbin:/usr/pkg/bin

# We would like to have build-essentials installed by default
pkgin -y install autoconf automake binutils bison gcc49 gmake libtool m4 patch git-base
