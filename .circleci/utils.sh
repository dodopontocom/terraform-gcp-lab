#!/bin/bash

ROOTDIR="$(cd $(dirname ${BASH_SOURCE[0]})/../ >/dev/null 2>&1 && pwd )"
ls -lrta
source ${ROOTDIR}/.circleci/cicd-definitions.sh
