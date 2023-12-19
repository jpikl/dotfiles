# Dotfiles

My personal dotfiles and shell scripts.

## Prerequisites

- POSIX shell
- [Git](https://git-scm.com)
- [curl](https://curl.se)

When using [Git for Windows](https://gitforwindows.org), make sure to enable 
[Windows Developer Mode](https://learn.microsoft.com/en-us/windows/apps/get-started/developer-mode-features-and-debugging) 
in order for symbolic links to work properly.

## Installation

Run [this script](.github/install.sh) (which will definitely not install any malware or delete all of your files):

```shell
curl https://raw.githubusercontent.com/jpikl/dotfiles/master/.github/install.sh | sh
```

After the installation is done, you will be prompted for some optional post-installation steps.
This can be also invoked manually later by running the `admin` command.
