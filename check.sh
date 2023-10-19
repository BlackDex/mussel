#!/bin/sh -e

# Copyright (c) 2018-2023, Firas Khalil Khana
# Distributed under the terms of the ISC License

if command -v b3sum 2>&1 > /dev/null; then
printf 'b3sum      :: '
b3sum --version | cut -d' ' -f2
elif (command -v sha256sum || command -v openssl) 2>&1 > /dev/null; then
printf 'sha256sum  :: '
openssl version  || { sha256sum --version | sed 1q | cut -d' ' -f2- ; }
fi

printf 'bash       :: '
bash --version | sed 1q | cut -d' ' -f4

printf 'bc         :: '
( (bc --version \
	|| getconf HEIRLOOM_TOOLCHEST_VERSION \
	|| getconf _POSIX_VERSION) | sed 1q | cut -d' ' -f2) 2>/dev/null 

printf 'binutils   :: '
ld --version | sed 1q | cut -d' ' -f4

printf 'bison      :: '
bison --version | sed 1q | cut -d' ' -f4

printf 'bzip2      :: '
bzip2 --version 2>&1 < /dev/null | sed 1q | cut -d' ' -f8-

printf 'ccache     :: '
ccache --version | sed 1q | cut -d' ' -f3

printf 'coreutils  :: '
( (ls --version \
	|| getconf HEIRLOOM_TOOLCHEST_VERSION \
	|| getconf _POSIX_VERSION)  | sed 1q | cut -d' ' -f4) 2>/dev/null

printf 'diffutils  :: '
( (diff --version \
	|| getconf HEIRLOOM_TOOLCHEST_VERSION \
	|| getconf _POSIX_VERSION) | sed 1q | cut -d' ' -f4) 2>/dev/null

printf 'findutils  :: '
( (find --version \
	|| getconf HEIRLOOM_TOOLCHEST_VERSION \
	|| getconf _POSIX_VERSION) | sed 1q | cut -d' ' -f4) 2>/dev/null

printf 'g++        :: '
g++ --version | sed 1q | cut -d' ' -f3-

printf 'gawk       :: '
gawk --version | sed 1q | cut -d' ' -f3

printf 'gcc        :: '
gcc --version | sed 1q | cut -d' ' -f3-

printf 'git        :: '
git --version | cut -d' ' -f3

if $(ldd --version | grep 'musl' &>/dev/null); then
printf 'musl libc  :: '
ldd --version | sed -n 2p | cut -d' ' -f2
elif $(ldd --version | grep 'GNU' &>/dev/null); then
printf 'glibc      :: '
ldd --version | sed 1q | cut -d' ' -f4
fi

printf 'grep       :: '
( (grep --version \
	|| getconf HEIRLOOM_TOOLCHEST_VERSION \
	|| getconf _POSIX_VERSION) | sed 1q | cut -d' ' -f4) 2>/dev/null

printf 'gzip       :: '
gzip --version | sed 1q | cut -d' ' -f2

printf 'linux      :: '
uname -r

printf 'lzip       :: '
lzip --version | sed 1q | cut -d' ' -f2

printf 'm4         :: '
m4 --version | sed 1q | cut -d' ' -f4

printf 'make       :: '
make --version | sed 1q | cut -d' ' -f3

printf 'perl       :: '
perl -V:version | cut -d"'" -f2

printf 'rsync      :: '
rsync --version | sed 1q | cut -d' ' -f4

printf 'sed        :: '
( (sed --version \
	|| getconf HEIRLOOM_TOOLCHEST_VERSION \
	|| getconf _POSIX_VERSION) | sed 1q | cut -d' ' -f4 ) 2>/dev/null

printf 'tar        :: '
( (tar --version \
	|| getconf HEIRLOOM_TOOLCHEST_VERSION \
	|| getconf _POSIX_VERSION) | sed 1q | cut -d' ' -f4) 2>/dev/null

printf 'texinfo    :: '
makeinfo --version | sed 1q | cut -d' ' -f4

printf 'xz         :: '
xz --version | sed 1q | cut -d' ' -f4

printf 'zstd       :: '
zstd --version | cut -d' ' -f5
