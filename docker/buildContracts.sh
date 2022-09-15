#!/bin/bash
set -e # exit on failure of any "simple" command (excludes &&, ||, or | chains)
cd /inery.contracts
./build.sh -c /usr/opt/inery.cdt -e /opt/inery -t -y
cd build
tar -pczf /artifacts/contracts.tar.gz *
