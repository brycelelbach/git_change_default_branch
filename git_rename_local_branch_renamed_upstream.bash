# Copyright (C) 2020 Bryce Adelstein Lelbach aka wash <brycelelbach@gmail.com>
# Released under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#! /usr/bin/env bash
function usage {
  echo "Usage: ${0} [flags...]"
  echo
  echo "Rename a local branch \${OLD_NAME} that is downstream from remote "
  echo "\${UPSTREAM} to the new upstream name \${NEW_NAME}."
  echo
  echo "--upstream <upstream>            : Name of the upstream remote. "
  echo "                                 : Defaults to 'origin'."
  echo "--old-name <old-name>            : Name of the local branch. "
  echo "                                 : Defaults to 'master'."
  echo "--new-name <new-name>            : Name of the upstream remote. "
  echo "                                 : Defaults to 'main'."
  echo "-h, -help, --help                : Print this message."
  exit 1
}
UPSTREAM=origin
OLD_NAME=master
NEW_NAME=main
while test ${#} != 0; do
  case "${1}" in
  -h) usage ;;
  -help) usage ;;
  --help) usage ;;
  --upstream) shift; UPSTREAM=${1} ;;
  --old-name) shift; OLD_NAME=${1} ;;
  --new-name) shift; NEW_NAME=${1} ;;
  esac
  shift
done
git fetch ${UPSTREAM}
git checkout ${OLD_NAME}
git branch -m ${OLD_NAME} ${NEW_NAME}
git fetch
git branch --unset-upstream
git branch -u ${UPSTREAM}/${NEW_NAME}
git symbolic-ref refs/remotes/origin/HEAD refs/remotes/${UPSTREAM}/${NEW_NAME}
