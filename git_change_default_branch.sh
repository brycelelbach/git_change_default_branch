#! /bin/sh
git config --global init.templateDir '~/.gittemplates/git.git'
mkdir -p ~/.gittemplates
cp -r /usr/share/git-core/templates ~/.gittemplates/git.git
echo 'ref: refs/heads/main' > ~/.gittemplates/git.git/HEAD
