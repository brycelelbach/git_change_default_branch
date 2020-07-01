# Copyright (C) 2020 Bryce Adelstein Lelbach aka wash <brycelelbach@gmail.com>
# Released under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#! /bin/sh
if [ ! -z `git config --get init.templateDir` ]; then
  echo "The Git init.templateDir option is already set; I'm not going to "
  echo "override it. You can manually change the default branch by modifying "
  echo "HEAD in your Git template directory to 'ref: refs/heads/main'."
  exit 1
fi
git config --global init.templateDir '~/.gittemplates/git.git'
mkdir -p ~/.gittemplates
cp -r /usr/share/git-core/templates ~/.gittemplates/git.git
echo 'ref: refs/heads/main' > ~/.gittemplates/git.git/HEAD
