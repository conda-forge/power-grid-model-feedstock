#!/usr/bin/env bash

echo ${PKG_VERSION} > ${SRC_DIR}/VERSION

# this patch is needed to remove python shim in build, which is not needed for conda
${PYTHON} conda_build_preparation.py

${PYTHON} -m pip install ${SRC_DIR} -vv --no-build-isolation --no-deps -C wheel.cmake=false
