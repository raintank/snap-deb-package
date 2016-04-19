#!/bin/bash
set -x

SCRIPTDIR=$(dirname $0)
BASE=$(readlink -e $SCRIPTDIR)

mkdir -p ./deb

BUILD=$BASE/build

cd $GOPATH/src/github.com/intelsdi-x/snap/
VERSION=$(git describe --always|sed 's/^v//')
cd $BASE

ARCH="$(uname -m)"


PACKAGE_NAME="${BASE}/deb/snap-${VERSION}_${ARCH}.deb"
mkdir -p ${BUILD}/etc/init
mkdir -p ${BUILD}/etc/snap
mkdir -p ${BUILD}/var/lib/snap/plugins

cp ${BASE}/etc/snap.yaml ${BUILD}/etc/snap/
fpm -s dir -t deb \
  -v ${VERSION} -n snap -a ${ARCH} --description "Snap Telemetry Framework" \
  --deb-upstart ${BASE}/etc/init/snap \
  -C ${BUILD} -p ${PACKAGE_NAME} .
