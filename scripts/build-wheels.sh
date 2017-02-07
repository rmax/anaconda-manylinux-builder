#!/bin/sh
#
# This script build wheels from predefined requirements file.
#
# Environment variables:
# - WORKDIR : where are located requirements file.
# - WHEELHOUSE : where to store wheels.
# - UPDATE_PIP (optional) : whether to update pip, setuptools and wheel package.
#
# The expected requirements files are:
# - requirements-build.txt : packages required for building the requirements (i.e.: numpy, cython, etc).
# - requirements.txt : packages to build wheels for.
#
set -eux

mkdir -p $WHEELHOUSE
echo "Saving wheels to $WHEELHOUSE"
export PIP_FIND_LINKS=$WHEELHOUSE

if [ ! -z "${UPDATE_PIP:-""}" ]; then
  pip install -U setuptools
  pip install -U pip wheel
fi

# Install first setup requirements (i.e. numpy, cython, etc).
if [ -f $WORKDIR/requirements-build.txt ]; then
  pip install -r $WORKDIR/requirements-build.txt
fi

pip wheel -r $WORKDIR/requirements.txt --wheel-dir $WHEELHOUSE
