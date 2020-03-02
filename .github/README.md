# Dotfiles

My personal dotfiles and Bash scripts.

The following instructions ate intended for:

1. Me, so I can easily install everything on a new machine.
2. People who want to use this repository as a template for their own dotfiles.

## Contents

- [:pushpin: Prerequisites](#pushpin-prerequisites)
- [:package: Installation](#package-installation)
- [:wrench: Configuration](#wrench-configuration)
- [:construction: Changes](#construction-changes)
- [:white_check_mark: Validation](#whitecheckmark-validation)
- [:desktop_computer: Terminal](#desktopcomputer-terminal)
- [:ambulance: Troubleshooting](#ambulance-troubleshooting)
- [:page_facing_up: License](#pagefacingup-license)

## :pushpin: Prerequisites

Linux distro, [WSL][wsl] or [Git for Windows][git-win] with:

- [Bash][bash] >= 4.4.0
- [Git][git] >= 2.17.0

Compatibility with BSD, OS X or others is not guaranteed.

## :package: Installation

> :rotating_light: Be careful when running any of the commands mentioned
> bellow. You can easily lose your own configuration or data if you don't
> know what you are doing.

Clone bare repository to `~/.dotfiles.git` directory.

```bash
git clone --bare git@github.com:jpikl/dotfiles.git     ~/.dotfiles.git # SSH
git clone --bare https://github.com/jpikl/dotfiles.git ~/.dotfiles.git # HTTPS
```

Create an alias for Git to operate under the cloned repository.

```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
```

Checkout `master` branch to initialize dotfiles in home directory.

```bash
dotfiles checkout
dotfiles checkout -f # To overwrite possible conflicts.
```

Initialize Git submodules.

```bash
cd # In case $HOME is not your current working directory.
dotfiles submodule update --init
```

Customize your personal [configuration](#wrench-configuration).

Logout and login to reload Bash environment.

Use `homefiles` command to initialize home directory structure.
Try `-h` option for usage.

```bash
homefiles -h
```

## :wrench: Configuration

The following files are not part of the `~/.dotfiles.git` repository and
are intended for machine or user specific configuration.  By convention,
a configuration file named `.xyz.local` overwrites values in `.xyz`.

- `~/.profile.local` - Environment variables.
- `~/.bashrc.local`  - Bash aliases and functions.
- `~/.gitconfig.local` - Git configuration.
- `~/.ssh/config.local` - SSH configuration.

There are also some files with OS specific configuration. See instructions
inside of them for usage.

- `~/.gitconfig.windows` - Tweaks for Git for Windows.

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

Use `bashfiles` command to validate Bash scripts with [shellcheck][shellcheck].

```bash
bashfiles check
```

## :desktop_computer: Terminal

> :fire: The following is highly opinionated.

### Emulators

- [Tilix][tilix] - For Linux.
- [Windows Terminal][win-term] - For Windows, use
  [profiles.json](../.config/templates/WindowsTerminal/profiles.json)
  as configuration.

### Font

[LiterationMono Nerd Font][nf-literation] or any other [Nerd Font][nf].

- They provide icons which are used by prompt and commands like `git-super-status`.
- Run `homefiles -f` to download the latest version to `~/.local/share/fonts`.

### Colors

[Tilix Material theme][tilix-colors] which itself is a hybrid between
Dark and Oceanic [materiallshell themes][material-colors].

| Color       |                     | Value     |
| ----------- | ------------------- | --------- |
| Foreground  | ![#A1B0B8][color-f] | `#A1B0B8` |
| Background  | ![#263238][color-b] | `#263238` |
| (0) Black   | ![#252525][color-0] | `#252525` |
| (1) Red     | ![#FF5252][color-1] | `#FF5252` |
| (2) Green   | ![#C3D82C][color-2] | `#C3D82C` |
| (3) Yellow  | ![#FFC135][color-3] | `#FFC135` |
| (4) Blue    | ![#42A5F5][color-4] | `#42A5F5` |
| (5) Magenta | ![#D81B60][color-5] | `#D81B60` |
| (6) Cyan    | ![#00ACC1][color-6] | `#00ACC1` |
| (7) White   | ![#F5F5F5][color-7] | `#F5F5F5` |

Bold colors #8-15 are the same as regular colors #0-7.

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
3. See also [Diagnosing performance issues][git-win-perf] on Git for Windows Wiki.

### Commands not working in ConEmu

Some commands does not work well with ConEmu/Bash on Windows.

- [fzf][fzf] - Fails with [character set not supported][fzf-charset-issue].
- [mvn][mvn] - Does not output colors.

There are two workarounds using [winpty][winpty]:

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

[bash]: https://www.gnu.org/software/bash
[color-0]: https://placehold.it/16/252525/000000?text=+
[color-1]: https://placehold.it/16/FF5252/000000?text=+
[color-2]: https://placehold.it/16/C3D82C/000000?text=+
[color-3]: https://placehold.it/16/FFC135/000000?text=+
[color-4]: https://placehold.it/16/42A5F5/000000?text=+
[color-5]: https://placehold.it/16/D81B60/000000?text=+
[color-6]: https://placehold.it/16/00ACC1/000000?text=+
[color-7]: https://placehold.it/16/F5F5F5/000000?text=+
[color-b]: https://placehold.it/16/263238/000000?text=+
[color-f]: https://placehold.it/16/A1B0B8/000000?text=+
[fzf-charset-issue]: https://github.com/junegunn/fzf/issues/963
[fzf]: https://github.com/junegunn/fzf
[git-win-perf]: https://github.com/git-for-windows/git/wiki/Diagnosing-performance-issues
[git-win]: https://gitforwindows.org/
[git]: https://git-scm.com
[material-colors]: https://materialshell.carloscuesta.me
[mvn]: https://maven.apache.org
[nf-literation]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/LiberationMono
[nf]: https://www.nerdfonts.com
[shellcheck]: https://shellcheck.net
[tilix-colors]: https://github.com/gnunn1/tilix/blob/master/data/schemes/material.json
[tilix]: https://gnunn1.github.io/tilix-web
[win-term]: https://github.com/microsoft/terminal
[winpty]: https://github.com/rprichard/winpty
[wsl]: https://github.com/Microsoft/WSL
