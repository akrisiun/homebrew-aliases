# Homebrew Aliases

This tap allows you to alias your [Homebrew](https://brew.sh/) commands.

## Install

    brew tap akrisiun/aliases
    brew tap homebrew/aliases

## Usage

This works similar to the `alias` command:

    # add aliases
    $ brew alias up='update'
    $ brew alias i='install'

    # print all aliases
    $ brew alias

    $ brew alias service=services
    $ brew alias s-list='services list'

    $ brew unalias lsof
    $ brew alias lsof='!losf -i'
    $ brew lsof :443

    # use your aliases like any other command
    $ brew i git
    # remove an alias
    $ brew unalias i

## C# mono and netCore

```
brew alias i=install
brew alias up=update

brew tap akrisiun/aliases
brew up
brew i akrisiun/aliases/omni-mono
```

**Note:** Some commands are reserved and can’t be aliased (Homebrew core
commands as well as `alias` and `unalias`).

## Additional Features

All aliases are prefixed with `brew`, unless they start with `!` or `%`:

    # 'brew up' -> 'brew update'
    $ brew alias up=update

    # 'brew status' -> 'git status'
    $ brew alias status='!git status'

**Note:** You may need single-quotes to prevent your shell from
interpreting `!`, but `%` will work for both types.

    # Use shell expansion to preserve a local variable
    # 'brew git status' -> '/path/to/my/git status'
    $ mygit=/path/to/my/git
    $ brew alias git="% $mygit"

Aliases can include other aliases:

    $ brew alias show=info
    $ brew alias print=show
    $ brew print git # will run 'brew info git'

Aliases can be opened in `$EDITOR` with the `--edit` flag.

    # Edit alias 'brew foo'
    $ brew alias foo --edit
    # Assign and edit alias 'brew foo'
    $ brew alias foo=bar --edit

    # This works too
    $ brew alias --edit foo
    $ brew alias --edit foo=bar

    # Open all aliases in EDITOR
    $ brew alias --edit

**Note:** If the named alias doesn't exist it will be created.
