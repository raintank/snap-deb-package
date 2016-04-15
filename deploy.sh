#!/bin/bash

# Find the directory we exist within
SCRIPTDIR=$(dirname $0)
BASE=$(readlink -e $SCRIPTDIR)

if [ -z ${PACKAGECLOUD_REPO} ] ; then
  echo "The environment variable PACKAGECLOUD_REPO must be set."
  exit 1
fi

package_cloud push ${PACKAGECLOUD_REPO}/ubuntu/trusty ${BASE}/deb/*.deb
