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

### Character Set Not Supported

Some commands internally use [fzf](https://github.com/junegunn/fzf) which
[does not work well](https://github.com/junegunn/fzf/issues/963) in combination
with ConEmu and bash on Windows.

To work around this, `bash` needs to be executed using `winpty` command.

`winpty bash -i -l`

## License

Everything in this repository is licensed under the [MIT license](LICENSE.md).
