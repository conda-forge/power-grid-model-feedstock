#!/usr/bin/env bash

# Get c++20 to work:
# https://conda-forge.org/docs/maintainer/knowledge_base/#newer-c-features-with-old-sdk
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

${PYTHON} conda_build_preparation.py

${PYTHON} -m pip install . -vv --no-build-isolation --no-deps -C wheel.cmake=false
