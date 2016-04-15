#!/bin/bash
set -x

SCRIPTDIR=$(dirname $0)
BASE=$(readlink -e $SCRIPTDIR)

mkdir -p ${BASE}/build/usr/bin
cd $GOPATH/src/github.com/intelsdi-x/snap
./scripts/build.sh $(pwd)
cp ./build/bin/* ${BASE}/build/usr/bin/

