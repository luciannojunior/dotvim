# @lcjnr VIM config files

## Dependencies

- https://github.com/ggreer/the_silver_searcher
- https://github.com/junegunn/fzf

## Installation

Run the installation script. It will install the declared plugins and move the `init.vim`!

```sh
./install.sh
```

## Main Tweaks
- `jk` instead of `Esc`
- The `SpaceBar` is used as the _leader_, instead of the default `,`
- The arrow keys are disabled on default mode
- `Command + hjkl` for window switching

## Plugin Shorcuts
- `Space + t` for searching files (on Git Repo)
- `:Ag` for searching text all over the current Repo
- `Space + c` for Git Commit (check Vim Fugitive for reference)
- `cs` for changing surrondings (check Vim Surround)

## Languages

- Typescript
- Javascript
- GraphQL
- Clojure (Parinfer and Vim Fireplace)
- Golang
