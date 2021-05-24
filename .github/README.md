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
- 🗃️ [Bash](#-bash)
- ⚡ [Tools](#-tools)
- 🖥️ [Terminal](#-terminal)
- 🚑 [Troubleshooting](#-troubleshooting)
- 📄 [License](#-license)

## 📌 Prerequisites

Linux distro, [WSL][wsl] or [Git for Windows][git-win] with:

- [Bash][bash] >= 4.4.0
- [Git][git] >= 2.17.0

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

Customize your personal [configuration](#wrench-configuration).

Install [starship] as mentioned in [tools](#zap-Tools).

Logout and login to reload Bash environment.

Use `homefiles` command to initialize home directory structure.
Try `-h` option for usage.

```bash
homefiles -h
```

## 🔧 Configuration

The following files are not part of the `~/.dotfiles.git` repository and
are intended for machine specific configuration. By convention, a configuration
file named `.xyz.local` overwrites values in `.xyz`.

- `~/.profile.local` - Environment variables.
- `~/.bashrc.local`  - Bash aliases and functions.
- `~/.gitconfig.local` - Git configuration.
- `~/.ssh/config.local` - SSH configuration.

### Windows

On Windows, it's more useful to define environment variables through
**system settings** instead of using `~/.profile.local`. This way, environment
variables can be also used by programs running outside Bash environment.
You can even use *Windows-style* paths like `C:\foo\bar` as values. They will
be automatically converted to *Unix-like* paths `/c/foo/bar` by `~/.profile`.

There are also some files with Windows specific configuration. See instructions
inside of them for usage.

- `~/.gitconfig.windows` - Tweaks for Git for Windows.

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
dotenv vscode     # Run Visual Studio Code with set-up environment
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
bashfiles # List files
```

These files can be validated using [shellcheck][shellcheck].

```bash
bashfiles check # Run shellcheck
```

You can also get description of each executable Bash script
from `~/.local/bin/`.

```bash
bashfiles describe # Print names and descriptions
bashfiles markdown # The same but with Markdown output
```

## ⚡ Tools

### Included in this repository

See generated list of [bianaries and aliases](commands.md).

### Recommended to install

- [bat][bat] - A cat(1) clone with wings.
- [exa][exa] - A modern version of ‘ls’.
- [fd][fd] - A simple, fast and user-friendly alternative to 'find'.
- [fzf][fzf] - A command-line fuzzy finder.
- [hexyl][hexyl] - A command-line hex viewer.
- [ripgrep][ripgrep] - ripgrep recursively searches directories for a regex pattern.
- [sd][sd] - Intuitive find & replace CLI (sed alternative).
- [starship][starship] - The minimal, blazing-fast, and infinitely customizable prompt for any shell!
- [tealdeer][tealdeer] - A very fast implementation of tldr in Rust.

```bash
pacman -Sy bat exa fd fzf hexyl sd ripgrep # On ArchLinux
pacaur -Sy starship tealdeer               # On ArchLinux (AUR)
choco install bat fd fzf ripgrep           # On Windows using chocolatey
cargo install bat fd-find hexyl ripgrep sd starship tealdeer # Using cargo
```

## 🖥️ Terminal

> 🔥 The following is highly opinionated.

### Emulators

- [Tilix][tilix] - For Linux. Use the command below to load configuration.
- [Windows Terminal][win-term] - For Windows. Use
  [profiles.json](../.config/WindowsTerminal/profiles.json) as configuration.

```bash
# List Tilix profiles
dconf dump /com/gexperts/Tilix/profiles/

# Load values to a Tilix profile
dconf load /com/gexperts/Tilix/profiles/ <<-EOT
	[YOUR-TILIX-PROFILE-UUID]
	font='LiterationMono Nerd Font 11'
	foreground-color='#A1B0B8'
	background-color='#263238'
	palette=['#252525','#FF5252','#C3D82C','#FFC135','#42A5F5','#D81B60','#00ACC1','#F5F5F5','#708284','#FF5252','#C3D82C','#FFC135','#42A5F5','#D81B60','#00ACC1','#F5F5F5']
EOT
```

### Font

[LiterationMono Nerd Font][nf-literation] (11pt) or any other [Nerd Font][nf].

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

## 🚑 Troubleshooting

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
[exa]: https://github.com/ogham/exa
[fd]: https://github.com/sharkdp/fd
[fzf-charset-issue]: https://github.com/junegunn/fzf/issues/963
[fzf]: https://github.com/junegunn/fzf
[git-win-perf]: https://github.com/git-for-windows/git/wiki/Diagnosing-performance-issues
[git-win]: https://gitforwindows.org/
[git]: https://git-scm.com
[hexyl]: https://github.com/sharkdp/hexyl
[material-colors]: https://materialshell.carloscuesta.me
[mvn]: https://maven.apache.org
[nf-literation]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/LiberationMono
[nf]: https://www.nerdfonts.com
[ripgrep]: https://github.com/BurntSushi/ripgrep
[sd]: https://github.com/chmln/sd
[starship]: https://github.com/starship/starship
[shellcheck]: https://shellcheck.net
[tealdeer]: https://github.com/dbrgn/tealdeer
[tilix-colors]: https://github.com/gnunn1/tilix/blob/master/data/schemes/material.json
[tilix]: https://gnunn1.github.io/tilix-web
[win-term]: https://github.com/microsoft/terminal
[winpty]: https://github.com/rprichard/winpty
[wsl]: https://github.com/Microsoft/WSL
