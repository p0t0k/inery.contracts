#!/bin/bash
set -e # exit on failure of any "simple" command (excludes &&, ||, or | chains)
# expected places to find INERY CMAKE in the docker container, in ascending order of preference
[[ -e /usr/lib/inery/lib/cmake/inery/inery-config.cmake ]] && export CMAKE_FRAMEWORK_PATH="/usr/lib/inery"
[[ -e /opt/inery/lib/cmake/inery/inery-config.cmake ]] && export CMAKE_FRAMEWORK_PATH="/opt/inery"
[[ ! -z "$INERY_ROOT" && -e $INERY_ROOT/lib/cmake/inery/inery-config.cmake ]] && export CMAKE_FRAMEWORK_PATH="$INERY_ROOT"
# fail if we didn't find it
[[ -z "$CMAKE_FRAMEWORK_PATH" ]] && exit 1
# export variables
echo "" >> /inery.contracts/docker/environment.Dockerfile # necessary if there is no '\n' at end of file
echo "ENV CMAKE_FRAMEWORK_PATH=$CMAKE_FRAMEWORK_PATH" >> /inery.contracts/docker/environment.Dockerfile
echo "ENV INERY_ROOT=$CMAKE_FRAMEWORK_PATH" >> /inery.contracts/docker/environment.Dockerfile