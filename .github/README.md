# Dotfiles

My personal dotfiles and Bash scripts.

## Installation

Clone bare repository to `~/.dotfiles.git` directory using SSH.

```bash
git clone --bare git@github.com:jpikl/dotfiles.git ~/.dotfiles.git
```

Or using HTTPS.

```bash
git clone --bare https://github.com/jpikl/dotfiles.git ~/.dotfiles.git
```

Checkout `master` branch to initialize dotfiles in home directory.

```bash
git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME checkout
```

Possibly use `-f, --force` option to override existing files if there were
any conflicts.

```bash
git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME checkout -f
```

Customize your personal [configuration](#configuration).

Logout and login to reload Bash environment.

Use `home-init` command to initialize home directory structure.
Try `-h, --help` option for usage.

```bash
home-init -h
```

## Configuration

The following files are not part of the `~/.dotfiles.git` repository and
can be used for machine-specific or user-specific configuration.

`~/.profile_local`

- Sourced at the start of `~/.profile`.
- Can be used to override environment variables defined in `~/.profile`.

`~/.bashrc_local`

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

All Bash scripts are validated using [shellcheck](https://shellcheck.net/).

Run `check-dotfiles` command from the home directory to start the validation.

```bash
cd
check-dotfiles
```

## License

Everything in this repository is licensed under the [MIT license](LICENSE.md).
