#!/bin/bash
#

set -e

target="$1"

curdir="$( cd "$( dirname "$0" )" && pwd )"

[[ -z $target ]] && echo "usage: create-debian-source.sh <target directory>" && exit 1

mkdir -p "$target/sandboxer-fakeroot"

git archive --format tar HEAD | (cd "$target/sandboxer-fakeroot" && tar xf -)

cd "$target/sandboxer-fakeroot"

dpkg-buildpackage -d -S -us -uc

cd "$target"

rm -rf "$target/sandboxer-fakeroot"
