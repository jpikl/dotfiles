# Dotfiles

My personal dotfiles and Bash scripts.

## Installation

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

## Configuration

The following files are not part of the `~/.dotfiles.git` repository and
can be used for machine-specific or user-specific configuration.

`~/.profile.local`

- Sourced at the start of `~/.profile`.
- Can be used to override environment variables defined in `~/.profile`.

`~/.bashrc.local`

- Sourced at the end of `~/.bashrc`.
- Can be used to define custom aliases and functions.

## Changes

Git commands for the `~/.dotfiles.git` repository have to be executed
using `dotfiles` command.

```bash
dotfiles status # Instead of 'git status'
```

Everything in the home directory is ignored by default and
needs to be  forcibly added using `-f, --force` option.

```bash
dotfiles add -f ~/.foo-bar
dotfiles commit -m "Add foo-bar dotfile"
dotfiles push
```

## Validation

Use `bashfiles` command to validate Bash scripts with [shellcheck](https://shellcheck.net).

```bash
bashfiles check
```

## Troubleshooting

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

### Character Set Not Supported

Some commands internally use [fzf](https://github.com/junegunn/fzf) which
[does not work well](https://github.com/junegunn/fzf/issues/963) in combination
with ConEmu and bash on Windows.

To work around this, `bash` needs to be executed using `winpty` command.

`winpty bash -li`

## License

Everything in this repository is licensed under the [MIT license](LICENSE.md).
