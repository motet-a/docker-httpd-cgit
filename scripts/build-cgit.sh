#!/bin/sh -ex

version=1.1
cgit_url=https://git.zx2c4.com/cgit/snapshot/cgit-${version}.tar.xz
cpu_count=$(nproc)

rm -rf cgit/
curl -L $cgit_url > cgit.tar.xz
tar -xf cgit.tar.xz
rm -rf cgit.tar.xz
mv cgit-${version} cgit

cd cgit
make get-git
make -j $cpu_count

#make install
