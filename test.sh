#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 LOCALE" >&2
  exit 1
fi

echo docker build . -t "dotnet-test-locale-test:$1" --build-arg "LOCALE=$1"
docker build . -t "dotnet-test-locale-test:$1" --build-arg "LOCALE=$1"

echo

echo docker run --rm -it "dotnet-test-locale-test:$1"
docker run --rm -it "dotnet-test-locale-test:$1"
