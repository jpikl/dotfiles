# Dotfiles

My personal dotfiles and Bash scripts.

The following instructions ate intended for:

1. Me, so I can easily install everything on a new machine.
2. People who want to use this repository as a template for their own dotfiles.

## Contents

- 📌 [Prerequisites](#-prerequisites)
- 📦 [Installation](#-installation)
- 🔧 [Configuration](#-configuration)
- 🚧 [Repository](#-repository)
- 🗃️ [Bash](#%EF%B8%8F-bash)
- ⚡ [Tools](#-tools)
- 🖥️ [Terminal](#%EF%B8%8F-terminal)
- 🚑 [Troubleshooting](#-troubleshooting)
- 📄 [License](#-license)

## 📌 Prerequisites

Linux distro, [WSL][wsl] or [Git for Windows][git-win] with:

- [GNU Bash][bash] >= 4.4
- [GNU Coreutils][coreutils] >= 8.26
- [Git][git] >= 2.17

Compatibility with BSD, OS X or others is not guaranteed.

## 📦 Installation

> 🚨 Be careful when running any of the commands mentioned bellow.
> You can easily lose your own configuration or data if you don't
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

Logout and login to reload Bash environment.

> ℹ️ Any changes in Bash environment can be now easily reloaded
> using `bashreload` alias.

### Post-installation

Modify your local [configuration](#-configuration).

Customize your [terminal](#%EF%B8%8F-terminal)

Install recommended [tools](#-tools).

Use `homefiles` command to initialize home directory structure.
Try `-h` option for usage.

```bash
homefiles -h
```

## 🔧 Configuration

WIP...

## 🚧 Repository

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

There is also more low-level `dotenv` command which provides `GIT_DIR`
and `GIT_WORK_TREE` environment variables:

```bash
dotenv git status # Same as 'dotfiles status'
dotenv code       # Run Visual Studio Code with set-up environment
```

## 🗃️ Bash

Bash files are managed using the `bashfiles` command.
Try `-h` option for usage.

```bash
bashfiles -h
```

The command only operates on files that are part  of the `~/.dotfiles.git`
repository.

```bash
bashfiles # List files by default
```

These files can be validated using [shellcheck][shellcheck].

```bash
bashfiles check # Run shellcheck
```

You can also print list of [available commands](commands.md).

```bash
bashfiles describe # In plaintext
bashfiles markdown # In markdown
```

## ⚡ Tools

### Included in this repository

See generated list of [available commands](commands.md).

### Recommended to install

- [bat][bat] - A cat(1) clone with wings.
- [exa][exa] - A modern version of ‘ls’.
- [fd][fd] - A simple, fast and user-friendly alternative to 'find'.
- [fzf][fzf] - A command-line fuzzy finder.
- [hexyl][hexyl] - A command-line hex viewer.
- [http-server][http-server] - A simple zero-configuration command-line http server.
- [httpie][httpie] - Modern, user-friendly command-line HTTP client for the API era.
- [mkcert][mkcert] - A simple zero-config tool to make locally trusted development certificates.
- [rew][rew] - A text processing CLI tool that rewrites FS paths according to a pattern (shameless plug 😛).
- [ripgrep][ripgrep] - ripgrep recursively searches directories for a regex pattern.
- [sd][sd] - Intuitive find & replace CLI (sed alternative).
- [starship][starship] - The minimal, blazing-fast, and infinitely customizable prompt for any shell!
- [tealdeer][tealdeer] - A very fast implementation of tldr in Rust.

```bash
# Using pacman (ArchLinux)
pacman -Sy bat exa fd fzf hexyl httpie mkcert sd ripgrep

# Using pacaur (ArchLinux AUR)
pacaur -Sy starship tealdeer

# Using chocolatey (Windows)
choco install bat fd fzf httpie mkcert ripgrep starship

# Using cargo
cargo install bat fd-find hexyl rew ripgrep sd starship tealdeer

# Using go
go get github.com/junegunn/fzf filippo.io/mkcert

# Using npm
npm install --global http-server

# Using pip
pip install --user httpie
```

## 🖥️ Terminal

> 🔥 The following is highly opinionated.

### Emulator

- [Tilix][tilix] - For Linux.
- [Windows Terminal][win-term] - For Windows.

### Font

[LiterationMono Nerd Font][nf-literation] (11pt) or any other [Nerd Font][nf].

- They provide icons required by [starship][starship], [exa][exa] and others.
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

## 🚑 Troubleshooting

See also Git for Windows [Known issues][git-win-issues].

### Git for Windows Bash rewrites `/` to `C:/Program Files/Git`

Workarounds:

1. Run command with `MSYS_NO_PATHCONV=1` or export this environment variable temporarily.
2. Use double slash `//` instead of `/`

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

Workarounds using [winpty][winpty]:

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

## 📄 License

Everything in this repository is licensed under the [MIT license](LICENSE.md).

[bash]: https://www.gnu.org/software/bash
[bat]: https://github.com/sharkdp/bat
[color-0]: https://via.placeholder.com/16/252525/000000?text=+
[color-1]: https://via.placeholder.com/16/FF5252/000000?text=+
[color-2]: https://via.placeholder.com/16/C3D82C/000000?text=+
[color-3]: https://via.placeholder.com/16/FFC135/000000?text=+
[color-4]: https://via.placeholder.com/16/42A5F5/000000?text=+
[color-5]: https://via.placeholder.com/16/D81B60/000000?text=+
[color-6]: https://via.placeholder.com/16/00ACC1/000000?text=+
[color-7]: https://via.placeholder.com/16/F5F5F5/000000?text=+
[color-b]: https://via.placeholder.com/16/263238/000000?text=+
[color-f]: https://via.placeholder.com/16/A1B0B8/000000?text=+
[coreutils]: https://www.gnu.org/software/coreutils
[exa]: https://github.com/ogham/exa
[fd]: https://github.com/sharkdp/fd
[fzf-charset-issue]: https://github.com/junegunn/fzf/issues/963
[fzf]: https://github.com/junegunn/fzf
[git-win]: https://gitforwindows.org/
[git-win-issues]: https://github.com/git-for-windows/build-extra/blob/main/ReleaseNotes.md#known-issues
[git-win-perf]: https://github.com/git-for-windows/git/wiki/Diagnosing-performance-issues
[git]: https://git-scm.com
[hexyl]: https://github.com/sharkdp/hexyl
[httpie]: https://httpie.io
[http-server]: https://github.com/http-party/http-server
[material-colors]: https://materialshell.carloscuesta.me
[mkcert]: https://github.com/FiloSottile/mkcert
[mvn]: https://maven.apache.org
[nf-literation]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/LiberationMono
[nf]: https://www.nerdfonts.com
[ripgrep]: https://github.com/BurntSushi/ripgrep
[rew]: https://github.com/jpikl/rew
[sd]: https://github.com/chmln/sd
[starship]: https://github.com/starship/starship
[shellcheck]: https://shellcheck.net
[tealdeer]: https://github.com/dbrgn/tealdeer
[tilix-colors]: https://github.com/gnunn1/tilix/blob/master/data/schemes/material.json
[tilix]: https://gnunn1.github.io/tilix-web
[win-term]: https://github.com/microsoft/terminal
[winpty]: https://github.com/rprichard/winpty
[wsl]: https://github.com/Microsoft/WSL
