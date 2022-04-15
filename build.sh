#!/bin/bash

set -ex

# Based on https://github.com/ChromeDevTools/devtools-frontend/blob/HEAD/docs/workflows.md

BUILD_DIR=public
DOWNLOAD_DIR=$(mktemp -d)

pushd $DOWNLOAD_DIR
fetch devtools-frontend
pushd devtools-frontend
gn gen out/Default
autoninja -C out/Default
popd
popd
rm -rf $BUILD_DIR
mkdir $BUILD_DIR
cp -R $DOWNLOAD_DIR/devtools-frontend/out/Default/gen/front_end/* $BUILD_DIR
