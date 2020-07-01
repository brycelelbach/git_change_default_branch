A collection of scripts for migrating Git repositories with to a better default
  branch name.

## `git_init_change_default_branch.bash`

This script changes the default branch to `main` when you use `git init`
  to create a new repository.

GitHub will recognize the first branch you push to a newly initialized repository
  as the default branch.

You can download and run this script with this one-liner:

```sh
wget -O - https://raw.githubusercontent.com/brycelelbach/git_change_default_branch/main/git_init_change_default_branch.bash | bash
```

There's no option to directly change the default branch used by `git init`.
This script works by creating a new vanilla Git template directory in your home
  directory, modifying the default `HEAD` in that template to point to
  `refs/heads/main`, and then setting the `init.templateDir` Git config variable
  to point to ther new Git template directory.
If you've already set `init.templateDir`, the script will complain and do nothing.

## `git_rename_local_branch_renamed_upstream.bash`

This script updates a local branch after the branch has been updated upstream.
It fixes the upstream reference too.

It has three optional flags:

* `--upstream <upstream>`, the upstream remote.
    Defaults to `origin`.
* `--old-name <old-name>`, the name of the outdated local branch.
    Defaults to `master`.
* `--new-naxme <new-name>`, the name of the new upstream branch.
    Defaults to `main`.

