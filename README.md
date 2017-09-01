Dotfiles for Linux and macOS, organized for simple setup and portability. Don't want to have to manually update .zshrc on other machines, and don't want to have to track the entire home directory in git.

Running `bootstrap.sh` will copy necessary files from `home_files` directory into `~`, including platform-specific files depending on current uname (eg. `.macos` file is copied on a macOS machine)

The `.zshrc` that is copied into `~` will simply load the `./mainrc` file, where general configuration is kept (and tracked between machines using git)

`desktoprc, mbprc, toshibarc` are for options that shouldn't be shared across machines, but should still be tracked in git for portability.
