#!/bin/bash

ROOTDIR="$(cd $(dirname ${BASH_SOURCE[0]})/../ >/dev/null 2>&1 && pwd )"

surce $ROOTDIR/.circleci/cicd-definitions.sh
