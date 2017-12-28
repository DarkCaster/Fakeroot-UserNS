#!/bin/bash
#

set -e

target="$1"
curdir="$( cd "$( dirname "$0" )" && pwd )"
[[ -z $target ]] && echo "usage: create-debian-source.sh <target directory>" && exit 1

mkdir -p "$target/sandboxer-fakeroot"
git archive --format tar HEAD | (cd "$target/sandboxer-fakeroot" && tar xf -)

cd "$target/sandboxer-fakeroot"
version=`dpkg-parsechangelog --show-field Version | cut -f1 -d"-"`
cd "$target"
mv "sandboxer-fakeroot" "sandboxer-fakeroot_$version.orig"
tar cf "sandboxer-fakeroot_$version.orig.tar" "sandboxer-fakeroot_$version.orig"
xz -9e "sandboxer-fakeroot_$version.orig.tar"

cd "sandboxer-fakeroot_$version.orig"
dpkg-buildpackage -d -S -us -uc

cd "$target"
rm -rf "sandboxer-fakeroot_$version.orig"
