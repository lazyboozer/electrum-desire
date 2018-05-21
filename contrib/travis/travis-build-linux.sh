#!/bin/bash
BUILD_REPO_URL=https://github.com/akhavr/electrum-desire.git

cd build

if [[ -z $TRAVIS_TAG ]]; then
  exit 0
else
  git clone --branch $TRAVIS_TAG $BUILD_REPO_URL electrum-desire
fi

docker run --rm -v $(pwd):/opt -w /opt/electrum-desire -t akhavr/electrum-desire-release:Linux /opt/build_linux.sh
docker run --rm -v $(pwd):/opt -v $(pwd)/electrum-desire/:/root/.wine/drive_c/electrum -w /opt/electrum-desire -t akhavr/electrum-desire-release:Wine /opt/build_wine.sh
