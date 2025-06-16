#!/usr/bin/env bash

echo ${PKG_VERSION} > VERSION

cmake ${CMAKE_ARGS} \
      -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -B build/ \
      -S . \
      -DCMAKE_INSTALL_PREFIX=${PREFIX}

cmake --build build/ --verbose -j1

cmake --install build/

${PYTHON} -m pip install . -vv --no-build-isolation --no-deps -C wheel.cmake=false
