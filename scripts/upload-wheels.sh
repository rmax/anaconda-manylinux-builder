#!/bin/bash
#
# This script uploads wheels to anaconda.
#
# Environment variables
# - ANACONDA_TOKEN : authenatication token.
# - ANACONDA_USER : User account where to upload wheels to.
# - ANACONDA_LABEL : Label for wheels.
# - WHEELHOUSE : Path to wheels.
#
set -eu

conda install anaconda-client

anaconda -t $ANACONDA_TOKEN \
  upload --force \
  -u $ANACONDA_USER \
  -l $ANACONDA_LABEL \
  $WHEELHOUSE/*.whl
