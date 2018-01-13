git4office
==========

Anyone who have tried to get MS Office files work well with git knows what this project is about.

Maybe less well known, all modern Office files are actually just compressed folders with data that can be source controlled. This can be easily checked, just rename your favorite `*.xlsx`-file to `*.zip`, unzip the file and check the contents.

# Goals

To as simply as possible make it possible to include MS Office files in a git repository and be able to see the diff across versions.