#!/usr/bin/env bash

# Get c++20 to work
if [[ $(uname) == "Darwin" ]]; then
  export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

echo ${PKG_VERSION} > VERSION

cmake ${CMAKE_ARGS} \
      -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -B build/ \
      -S . \
      -DCMAKE_INSTALL_PREFIX=${PREFIX}

cmake --build build/ --verbose -j1

cmake --install build/

POWER_GRID_MODEL_NO_BINARY_BUILD=1 ${PYTHON} -m pip install . -vv --no-build-isolation --no-deps   
