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

Logout and login to reload Bash environment.

## Configuration

The following files are not part of the `~/.dotfiles.git` repository and
can be used for machine-specific or user-specific configuration.

`~/Bash/profile_local.sh`

- Sourced at the start of `~/.bash_profile`.
- Can be used to customize environment variables.

`~/Bash/rc_local.sh`

- Sourced at the end of `~/.bashrc`.
- Can be used to define custom aliases and functions.

## Changes

Git commands for the `~/.dotfiles.git` repository are done using
`dotfiles` command.

```bash
dotfiles add ~/Bash/bin/foo-bar
dotfiles commit -m "Add foo-bar command"
dotfiles push
```

Everything outside the `~/Bash` directory is ignored by default and
needs to be forcibly added using the `-f, --force` option.

```bash
dotfiles add -f ~/.foo-bar
dotfiles commit -m "Add foo-bar dotfile"
dotfiles push
```

## Validation

All Bash scripts are validated using [shellcheck](https://shellcheck.net/).

Run `check.sh` to start the validation.

```bash
cd ~/Bash
./check.sh
```

## License

Everything in this repository is licensed under the [MIT license](LICENSE.md).
