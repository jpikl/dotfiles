# Dotfiles

My personal dotfiles and Bash scripts.

- [:pushpin: Prerequisites](#pushpin-prerequisites)
- [:package: Installation](#package-installation)
- [:wrench: Configuration](#wrench-configuration)
- [:construction: Changes](#construction-changes)
- [:white_check_mark: Validation](#whitecheckmark-validation)
- [:desktop_computer: Terminal](#desktopcomputer-terminal)
- [:ambulance: Troubleshooting](#ambulance-troubleshooting)
- [:page_facing_up: License](#pagefacingup-license)

## :pushpin: Prerequisites

Linux distro, [WSL](https://github.com/Microsoft/WSL) or [Git for Windows](https://gitforwindows.org/) with:

- [Bash](https://www.gnu.org/software/bash) >= 4.4.0
- [Git](https://git-scm.com) >= 2.17.0

Compatibility with BSD, OS X or others is not guaranteed.

## :package: Installation

Clone bare repository to `~/.dotfiles.git` directory.

```bash
git clone --bare git@github.com:jpikl/dotfiles.git     ~/.dotfiles.git # SSH
git clone --bare https://github.com/jpikl/dotfiles.git ~/.dotfiles.git # HTTPS
```

Create an alias for git to operate under the cloned repository.

```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
```

Checkout `master` branch to initialize dotfiles in home directory.

```bash
dotfiles checkout
dotfiles checkout -f # To overwrite possible conflicts.
```

Initialize git submodules.

```bash
cd # In case $HOME is not your current working directory.
dotfiles submodule update --init
```

Customize your personal [configuration](#configuration).

Logout and login to reload Bash environment.

Use `homefiles` command to initialize home directory structure.
Try `-h` option for usage.

```bash
homefiles -h
```

## :wrench: Configuration

The following files are not part of the `~/.dotfiles.git` repository and
can be used for machine-specific or user-specific configuration.

`~/.profile.local`

- Sourced at the start of `~/.profile`.
- Can be used to define environment variables.

`~/.bashrc.local`

- Sourced at the end of `~/.bashrc`.
- Can be used to define custom aliases and functions.

## :construction: Changes

Git commands for the `~/.dotfiles.git` repository have to be executed
using `dotfiles` command.

```bash
dotfiles status # Instead of 'git status'
```

Everything in the home directory is ignored by default and
needs to be  forcibly added using `-f, --force` option.

```bash
dotfiles add -f ~/.xyz
dotfiles commit -m "Add xyz dotfile"
dotfiles push
```

## :white_check_mark: Validation

Use `bashfiles` command to validate Bash scripts with [shellcheck](https://shellcheck.net).

```bash
bashfiles check
```

## :desktop_computer: Terminal

### Font

Use [LiterationMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/LiberationMono)
or any other [Nerd Font](https://www.nerdfonts.com).

- They provide icons which are used by prompt and commands like `git-super-status`.
- Run `homefiles -f` to download latest version to `~/.local/share/fonts`.

### Colors

Use [Tilix Material theme](https://github.com/gnunn1/tilix/blob/master/data/schemes/material.json)
which itself is a hybrid of Dark and Oceanic [materiallshell themes](https://materialshell.carloscuesta.me).

| Color       |                                                          | Value     |
| ----------- | -------------------------------------------------------- | --------- |
| Foreground  | ![#A1B0B8](https://placehold.it/16/A1B0B8/000000?text=+) | `#A1B0B8` |
| Background  | ![#263238](https://placehold.it/16/263238/000000?text=+) | `#263238` |
| (0) Black   | ![#252525](https://placehold.it/16/252525/000000?text=+) | `#252525` |
| (1) Red     | ![#FF5252](https://placehold.it/16/FF5252/000000?text=+) | `#FF5252` |
| (2) Green   | ![#C3D82C](https://placehold.it/16/C3D82C/000000?text=+) | `#C3D82C` |
| (3) Yellow  | ![#FFC135](https://placehold.it/16/FFC135/000000?text=+) | `#FFC135` |
| (4) Blue    | ![#42A5F5](https://placehold.it/16/42A5F5/000000?text=+) | `#42A5F5` |
| (5) Magenta | ![#D81B60](https://placehold.it/16/D81B60/000000?text=+) | `#D81B60` |
| (6) Cyan    | ![#00ACC1](https://placehold.it/16/00ACC1/000000?text=+) | `#00ACC1` |
| (7) White   | ![#F5F5F5](https://placehold.it/16/F5F5F5/000000?text=+) | `#F5F5F5` |

Bold colors #8-15 are the same as regular colors #0-7.

### Configuration

- **Windows Terminal** - Copy [profiles.json](../.config/templates/WindowsTerminal/profiles.json) to `C:\Users\<user>\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json`

## :ambulance: Troubleshooting

### Poor Git performance on Windows

1. Assuming `C:\Program Files\Git` is your Git installation directory,
   add these paths **at the beginning** of `Path` environment variable:

   ```text
   C:\Program Files\Git\bin
   C:\Program Files\Git\usr\bin
   C:\Program Files\Git\mingw64\bin
   ```

2. Add `HOME` environment variable with value `%USERPROFILE%`.
3. See also [Diagnosing performance issues](https://github.com/git-for-windows/git/wiki/Diagnosing-performance-issues) on Git for Windows Wiki.

### Commands not working in ConEmu

Some commands does not work well with ConEmu/Bash on Windows.

- [fzf](https://github.com/junegunn/fzf) - Fails with [character set not supported](https://github.com/junegunn/fzf/issues/963).
- [mvn](https://maven.apache.org) - Does not output colors.

There are two workarounds using [winpty](https://github.com/rprichard/winpty):

1. Wrap command execution using `winpty`.

   ```bash
   winpty fzf
   winpty any-other-command
   ```

   This unfortunately does not work for `mvn`, executed as `winpty mvn.cmd`.
   Also any alias or command that internally uses `fzf` won't work.

2. Wrap `bash` execution using `winpty`.

    ```bash
   winpty bash -li
   ```

   This unfortunately breaks some other commands like `bat` which
   stops printing colors.

## :page_facing_up: License

Everything in this repository is licensed under the [MIT license](LICENSE.md).
