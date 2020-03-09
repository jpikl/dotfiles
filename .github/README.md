# Dotfiles

My personal dotfiles and Bash scripts.

The following instructions ate intended for:

1. Me, so I can easily install everything on a new machine.
2. People who want to use this repository as a template for their own dotfiles.

## Contents

- [:pushpin: Prerequisites](#pushpin-prerequisites)
- [:package: Installation](#package-installation)
- [:wrench: Configuration](#wrench-configuration)
- [:construction: Repository](#construction-repository)
- [:card_file_box: Bash](#cardfilebox-bash)
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

## :construction: Repository

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

## :card_file_box: Bash

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

Here is a current list:

- [bashfiles](../.local/bin/bashfiles) - Manage Bash files from dotfiles repository.
- [bashgen](../.local/bin/bashgen) - Generate new Bash script using itself as a template.
- [choose](../.local/bin/choose) - Let user choose from values. Simple fzf frontend with Bash fallback.
- [confirm](../.local/bin/confirm) - Aks user for confirmation.
- [direnc](../.local/bin/direnc) - List or (un)mount encrypted directories. Simple encfs frontend.
- [dirsync](../.local/bin/dirsync) - Synchronize two directories. Simple rsync frontend.
- [dirtree](../.local/bin/dirtree) - List contents of a directory as tree. Bash implementation of tree command.
- [disks](../.local/bin/disks) - List or (un)mount disks. Simple lsblk and udisksctl frontend.
- [extract](../.local/bin/extract) - Extract or list contents of an archive in nearly any format.
- [findex](../.local/bin/findex) - Find wrapper with extra capabilities.
- [findprj](../.local/bin/findprj) - Find root directories of software projects.
- [findup](../.local/bin/findup) - Find upwards in directory tree.
- [git-fast-forward](../.local/bin/git-fast-forward) - Fast-forward local Git branches.
- [git-gone-branches](../.local/bin/git-gone-branches) - List or delete local Git branches that are gone on remote.
- [git-ls-branches](../.local/bin/git-ls-branches) - List Git branches in machine-readable format.
- [git-state](../.local/bin/git-state) - Print state of a Git working tree.
- [git-super-status](../.local/bin/git-super-status) - Git status on steroids.
- [homefiles](../.local/bin/homefiles) - Initialize home directory structure.
- [jestat](../.local/bin/jestat) - Print statistics of Java exceptions in a log file.
- [mpdm3u](../.local/bin/mpdm3u) - Generate M3U playlists from MPD database.
- [mvnpgb](../.local/bin/mvnpgb) - Print property of a Maven project in Git branches.
- [mvnsv](../.local/bin/mvnsv) - Set version of a Maven project.
- [npmr](../.local/bin/npmr) - List or (silently) run scripts of a npm package.
- [open](../.local/bin/open) - Open file or URL in the user's preferred application.
- [pacfind](../.local/bin/pacfind) - Find ArchLinux packages. Simple pacman frontend wit AUR support.
- [refresh](../.local/bin/refresh) - Periodically refresh output of a command on change.
- [retty](../.local/bin/retty) - Execute command with current TTY as stdin.
- [sshctl](../.local/bin/sshctl) - Control ssh-agent process.
- [sshgen](../.local/bin/sshgen) - Generate SSH key with user-friendly CLI wizard.
- [wman](../.local/bin/wman) - Open online man pages in web browser.

## :desktop_computer: Terminal

> :fire: The following is highly opinionated.

### Emulators

- [Tilix][tilix] - For Linux.
- [Windows Terminal][win-term] - For Windows, use
  [profiles.json](../.config/templates/WindowsTerminal/profiles.json)
  as configuration.

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
