This shell script changes the default branch to `main` when you use `git init`
  to create a new repository.

GitHub will recognize the first branch you push to a newly initialized repository
  as the default branch.

You can download and run this script with this one-liner:

```sh
wget -O - https://raw.githubusercontent.com/brycelelbach/git_change_default_branch/main/git_change_default_branch.sh | bash
```

There's no option to directly change the default branch used by `git init`.
This script works by creating a new vanilla Git template directory in your home
  directory, modifying the default `HEAD` in that template to point to
  `refs/heads/main`, and then setting the `init.templateDir` Git config variable
  to point to ther new Git template directory.
If you've already set `init.templateDir`, the script will complain and do nothing.
