git4office
==========

Anyone who have tried to source control MS Office files with git knows what this project is about.

Maybe less well known, all modern MS Office files are actually just compressed folders with data that can be source controlled. This can be easily checked, just rename your favorite `*.xlsx`-file to `*.zip`, unzip the file and check the contents.

# Files Supported

Currently .xlsx, .docx and .pptx files are supported. It is trivial to add new MS Office file types (as long as they follow the XML standard), I just don't need it at the moment. Feel free to open a MR if you want to add more.

# Goals

To as simply as possible make it possible to include MS Office files in a git repository and be able to see the diff across versions.

To only include readable files in the repository, i.e. not the binary MS Office files.

To be able to work 100% inside MS Office and regenerate the source code when done editing.

# How?

This is an example how to set up your git repository to work with MS Office files.

1. Clone or download this git repo.
2. If you don't already have it, [add `zip` to your git environment](https://ranxing.wordpress.com/2016/12/13/add-zip-into-git-bash-on-windows/).
3. Copy `build-office-files.sh` and `generate-office-source.sh` to the root of your repository where you want to source control MS Office files.
4. If you already have binary MS Office files checked in: run `generate-office-source.sh` now (in Windows you need to run this from Git Bash, not CMD or PowerShell) and watch the new changes by using `git status`. Every MS Office file should have been extracted to a folder representing the source code of that MS Office file. You can now delete the binary ones from your repository and check in this source code instead.
5. Add binary MS Office files extensions (*.xlsx, *.docx, *.pptx) to .gitignore, to exclude them from being checked in in the future. The MS Office files should be viewed as "build results" and thus should not be checked in.
6. From now on, every time before you start working in the MS Office file you should run `build-office-files.sh` which will build the files from the current source in the repository. When you're done editing, you should always run `generate-office-source.sh` before commiting your changes.
